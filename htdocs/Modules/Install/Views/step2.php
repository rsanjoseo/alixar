<?php

/*
 *	View
 */

use Alxarafe\Core\Singletons\Config;

pHeader($langs->trans("CreateDatabaseObjects"), "step4");

// Test if we can run a first install process
if (!is_writable($conffile)) {
    print $langs->trans("ConfFileIsNotWritable", $conffiletoshow);
    pFooter(1, $setuplang, 'jscheckparam');
    exit;
}

if ($action == "set") {
    print '<h3><img class="valignmiddle inline-block paddingright" src= "' . BASE_URI . '/theme/common/octicons/build/svg/database.svg" width="20" alt="Database"> ' . $langs->trans("Database") . '</h3>';

    print '<table cellspacing="0" style="padding: 4px 4px 4px 0" border="0" width="100%">';
    $error = 0;

    /*
    $db = getDoliDBInstance($conf->db->type, $conf->db->host, $conf->db->user, $conf->db->pass, $conf->db->name, $conf->db->port);
    if ($db->connected) {
        print "<tr><td>";
        print $langs->trans("ServerConnection") . " : " . $conf->db->host . '</td><td><img src= "' . BASE_URI . '/theme/eldy/img/tick.png" alt="Ok"></td></tr>';
        $ok = 1;
    } else {
        print "<tr><td>Failed to connect to server : " . $conf->db->host . '</td><td><img src= "' . BASE_URI . '/theme/eldy/img/error.png" alt="Error"></td></tr>';
    }
    */

    $alxConfig = Config::getInstance();
    $alxConfig->loadConfig();
    $result = $alxConfig->connectToDatabase();
    if (!$result) {
        die('Database not found in step2 view!');
    }
    $db = $alxConfig->getEngine();
    $ok = ($db !== null);

    /*
    if ($ok) {
        if ($db->database_selected) {
            dolibarr_install_syslog("step2: successful connection to database: " . $conf->db->name);
        } else {
            dolibarr_install_syslog("step2: failed connection to database :" . $conf->db->name, LOG_ERR);
            print "<tr><td>Failed to select database " . $conf->db->name . '</td><td><img src= "' . BASE_URI . '/theme/eldy/img/error.png" alt="Error"></td></tr>';
            $ok = 0;
        }
    }
    */

    // Affiche version
    if ($ok) {
        $version = $db->getVersion();
        //        $versionarray = $db->getVersionArray();
        print '<tr><td>' . $langs->trans("DatabaseVersion") . '</td>';
        print '<td>' . $version . '</td></tr>';
        //print '<td class="right">'.join('.',$versionarray).'</td></tr>';

        print '<tr><td>' . $langs->trans("DatabaseName") . '</td>';
        print '<td>' . $alxConfig->getVar('database', 'main', 'dbName') . '</td></tr>';
        //print '<td class="right">'.join('.',$versionarray).'</td></tr>';
    }

    $requestnb = 0;

    // To disable some code, so you can call step2 with url like
    // http://localhost/dolibarrnew/install/step2.php?action=set&token='.newToken().'&createtables=0&createkeys=0&createfunctions=0&createdata=llx_20_c_departements
    $createtables = isset($_GET['createtables']) ? GETPOST('createtables') : 1;
    $createkeys = isset($_GET['createkeys']) ? GETPOST('createkeys') : 1;
    $createfunctions = isset($_GET['createfunctions']) ? GETPOST('createfunction') : 1;
    $createdata = isset($_GET['createdata']) ? GETPOST('createdata') : 1;

    // To say sql requests are escaped for mysql so we need to unescape them
    $db->unescapeslashquot = true;

    /**************************************************************************************
     *
     * Chargement fichiers tables/*.sql (non *.key.sql)
     * A faire avant les fichiers *.key.sql
     *
     ***************************************************************************************/
    if ($ok && $createtables) {
        // We always choose in mysql directory (Conversion is done by driver to translate SQL syntax)
        $dir = DOL_DOCUMENT_ROOT . '/Modules/Install/tables/';

        $ok = 0;
        $handle = opendir($dir);
        dolibarr_install_syslog("step2: open tables directory " . $dir . " handle=" . $handle);
        $tablefound = 0;
        $tabledata = [];
        if (is_resource($handle)) {
            while (($file = readdir($handle)) !== false) {
                if (preg_match('/\.sql$/i', $file) && preg_match('/^llx_/i', $file) && !preg_match('/\.key\.sql$/i', $file)) {
                    $tablefound++;
                    $tabledata[] = $file;
                }
            }
            closedir($handle);
        }

        // Sort list of sql files on alphabetical order (load order is important)
        sort($tabledata);

        foreach ($tabledata as $file) {
            $name = substr($file, 0, dol_strlen($file) - 4);
            $buffer = '';
            $fp = fopen($dir . $file, "r");
            if ($fp) {
                while (!feof($fp)) {
                    $buf = fgets($fp, 4096);
                    if (substr($buf, 0, 2) <> '--') {
                        $buf = preg_replace('/--(.+)*/', '', $buf);
                        $buffer .= $buf;
                    }
                }
                fclose($fp);

                $buffer = trim($buffer);
                if ($conf->db->type == 'mysql' || $conf->db->type == 'mysqli') {    // For Mysql 5.5+, we must replace type=innodb with ENGINE=innodb
                    $buffer = preg_replace('/type=innodb/i', 'ENGINE=innodb', $buffer);
                } else {
                    // Keyword ENGINE is MySQL-specific, so scrub it for
                    // other database types (mssql, pgsql)
                    $buffer = preg_replace('/type=innodb/i', '', $buffer);
                    $buffer = preg_replace('/ENGINE=innodb/i', '', $buffer);
                }

                // Replace the prefix tables
                if ($dolibarr_main_db_prefix != 'llx_') {
                    $buffer = preg_replace('/llx_/i', $dolibarr_main_db_prefix, $buffer);
                }

                //print "<tr><td>Creation de la table $name/td>";
                $requestnb++;

                dolibarr_install_syslog("step2: request: " . $buffer);
                $resql = $db->query($buffer, 0, 'dml');
                if ($resql) {
                    // print "<td>OK requete ==== $buffer</td></tr>";
                    $db->free($resql);
                } else {
                    if ($db->errno() == 'DB_ERROR_TABLE_ALREADY_EXISTS' ||
                        $db->errno() == 'DB_ERROR_TABLE_OR_KEY_ALREADY_EXISTS') {
                        //print "<td>Deja existante</td></tr>";
                    } else {
                        print "<tr><td>" . $langs->trans("CreateTableAndPrimaryKey", $name);
                        print "<br>\n" . $langs->trans("Request") . ' ' . $requestnb . ' : ' . $buffer . ' <br>Executed query : ' . $db->lastquery;
                        print "\n</td>";
                        print '<td><span class="error">' . $langs->trans("ErrorSQL") . " " . $db->errno() . " " . $db->error() . '</span></td></tr>';
                        $error++;
                    }
                }
            } else {
                print "<tr><td>" . $langs->trans("CreateTableAndPrimaryKey", $name);
                print "</td>";
                print '<td><span class="error">' . $langs->trans("Error") . ' Failed to open file ' . $dir . $file . '</span></td></tr>';
                $error++;
                dolibarr_install_syslog("step2: failed to open file " . $dir . $file, LOG_ERR);
            }
        }

        if ($tablefound) {
            if ($error == 0) {
                print '<tr><td>';
                print $langs->trans("TablesAndPrimaryKeysCreation") . '</td><td><img src= "' . BASE_URI . '/theme/eldy/img/tick.png" alt="Ok"></td></tr>';
                $ok = 1;
            }
        } else {
            print '<tr><td>' . $langs->trans("ErrorFailedToFindSomeFiles", $dir) . '</td><td><img src= "' . BASE_URI . '/theme/eldy/img/error.png" alt="Error"></td></tr>';
            dolibarr_install_syslog("step2: failed to find files to create database in directory " . $dir, LOG_ERR);
        }
    }

    /***************************************************************************************
     *
     * Chargement fichiers tables/*.key.sql
     * A faire apres les fichiers *.sql
     *
     ***************************************************************************************/
    if ($ok && $createkeys) {
        // We always choose in mysql directory (Conversion is done by driver to translate SQL syntax)
        $dir = "mysql/tables/";

        $okkeys = 0;
        $handle = opendir($dir);
        dolibarr_install_syslog("step2: open keys directory " . $dir . " handle=" . $handle);
        $tablefound = 0;
        $tabledata = [];
        if (is_resource($handle)) {
            while (($file = readdir($handle)) !== false) {
                if (preg_match('/\.sql$/i', $file) && preg_match('/^llx_/i', $file) && preg_match('/\.key\.sql$/i', $file)) {
                    $tablefound++;
                    $tabledata[] = $file;
                }
            }
            closedir($handle);
        }

        // Sort list of sql files on alphabetical order (load order is important)
        sort($tabledata);
        foreach ($tabledata as $file) {
            $name = substr($file, 0, dol_strlen($file) - 4);
            //print "<tr><td>Creation de la table $name</td>";
            $buffer = '';
            $fp = fopen($dir . $file, "r");
            if ($fp) {
                while (!feof($fp)) {
                    $buf = fgets($fp, 4096);

                    /*
                    // Special case of lines allowed for some version only
                    if ($choix == 1 && preg_match('/^--\sV([0-9\.]+)/i', $buf, $reg)) {
                        $versioncommande = explode('.', $reg[1]);
                        //print var_dump($versioncommande);
                        //print var_dump($versionarray);
                        if (count($versioncommande) && count($versionarray)
                            && versioncompare($versioncommande, $versionarray) <= 0) {
                            // Version qualified, delete SQL comments
                            $buf = preg_replace('/^--\sV([0-9\.]+)/i', '', $buf);
                            //print "Ligne $i qualifiee par version: ".$buf.'<br>';
                        }
                    }
                    if ($choix == 2 && preg_match('/^--\sPOSTGRESQL\sV([0-9\.]+)/i', $buf, $reg)) {
                        $versioncommande = explode('.', $reg[1]);
                        //print var_dump($versioncommande);
                        //print var_dump($versionarray);
                        if (count($versioncommande) && count($versionarray)
                            && versioncompare($versioncommande, $versionarray) <= 0) {
                            // Version qualified, delete SQL comments
                            $buf = preg_replace('/^--\sPOSTGRESQL\sV([0-9\.]+)/i', '', $buf);
                            //print "Ligne $i qualifiee par version: ".$buf.'<br>';
                        }
                    }
                    */

                    // Ajout ligne si non commentaire
                    if (!preg_match('/^--/i', $buf)) {
                        $buffer .= $buf;
                    }
                }
                fclose($fp);

                // Si plusieurs requetes, on boucle sur chaque
                $listesql = explode(';', $buffer);
                foreach ($listesql as $req) {
                    $buffer = trim($req);
                    if ($buffer) {
                        // Replace the prefix tables
                        if ($dolibarr_main_db_prefix != 'llx_') {
                            $buffer = preg_replace('/llx_/i', $dolibarr_main_db_prefix, $buffer);
                        }

                        //print "<tr><td>Creation des cles et index de la table $name: '$buffer'</td>";
                        $requestnb++;

                        dolibarr_install_syslog("step2: request: " . $buffer);
                        $resql = $db->query($buffer, 0, 'dml');
                        if ($resql) {
                            //print "<td>OK requete ==== $buffer</td></tr>";
                            $db->free($resql);
                        } else {
                            if ($db->errno() == 'DB_ERROR_KEY_NAME_ALREADY_EXISTS' ||
                                $db->errno() == 'DB_ERROR_CANNOT_CREATE' ||
                                $db->errno() == 'DB_ERROR_PRIMARY_KEY_ALREADY_EXISTS' ||
                                $db->errno() == 'DB_ERROR_TABLE_OR_KEY_ALREADY_EXISTS' ||
                                preg_match('/duplicate key name/i', $db->error())) {
                                //print "<td>Deja existante</td></tr>";
                                $key_exists = 1;
                            } else {
                                print "<tr><td>" . $langs->trans("CreateOtherKeysForTable", $name);
                                print "<br>\n" . $langs->trans("Request") . ' ' . $requestnb . ' : ' . $db->lastqueryerror();
                                print "\n</td>";
                                print '<td><span class="error">' . $langs->trans("ErrorSQL") . " " . $db->errno() . " " . $db->error() . '</span></td></tr>';
                                $error++;
                            }
                        }
                    }
                }
            } else {
                print "<tr><td>" . $langs->trans("CreateOtherKeysForTable", $name);
                print "</td>";
                print '<td><span class="error">' . $langs->trans("Error") . " Failed to open file " . $dir . $file . "</span></td></tr>";
                $error++;
                dolibarr_install_syslog("step2: failed to open file " . $dir . $file, LOG_ERR);
            }
        }

        if ($tablefound && $error == 0) {
            print '<tr><td>';
            print $langs->trans("OtherKeysCreation") . '</td><td><img src= "' . BASE_URI . '/theme/eldy/img/tick.png" alt="Ok"></td></tr>';
            $okkeys = 1;
        }
    }

    /***************************************************************************************
     *
     * Chargement fichier functions.sql
     *
     ***************************************************************************************/
    /*
    if ($ok && $createfunctions) {
        // TODO: For now, we will use PDO for MySQL / MariaDB only
        $dir = "mysql/functions/";

        // For this file, we use a directory according to database type
        //if ($choix == 1) {
        //    $dir = "mysql/functions/";
        //} elseif ($choix == 2) {
        //    $dir = "pgsql/functions/";
        //} elseif ($choix == 3) {
        //    $dir = "mssql/functions/";
        //} elseif ($choix == 4) {
        //    $dir = "sqlite3/functions/";
        //}

        // Creation donnees
        $file = "functions.sql";
        if (file_exists($dir . $file)) {
            $fp = fopen($dir . $file, "r");
            dolibarr_install_syslog("step2: open function file " . $dir . $file . " handle=" . $fp);
            if ($fp) {
                $buffer = '';
                while (!feof($fp)) {
                    $buf = fgets($fp, 4096);
                    if (substr($buf, 0, 2) <> '--') {
                        $buffer .= $buf . "??";
                    }
                }
                fclose($fp);
            }
            //$buffer=preg_replace('/;\';/',";'??",$buffer);

            // If several requests, we loop on each of them
            $listesql = explode('??', $buffer);
            foreach ($listesql as $buffer) {
                $buffer = trim($buffer);
                if ($buffer) {
                    // Replace the prefix in table names
                    if ($dolibarr_main_db_prefix != 'llx_') {
                        $buffer = preg_replace('/llx_/i', $dolibarr_main_db_prefix, $buffer);
                    }
                    dolibarr_install_syslog("step2: request: " . $buffer);
                    print "<!-- Insert line : " . $buffer . "<br>-->\n";
                    $resql = $db->query($buffer, 0, 'dml');
                    if ($resql) {
                        $ok = 1;
                        $db->free($resql);
                    } else {
                        if ($db->errno() == 'DB_ERROR_RECORD_ALREADY_EXISTS'
                            || $db->errno() == 'DB_ERROR_KEY_NAME_ALREADY_EXISTS') {
                            //print "Insert line : ".$buffer."<br>\n";
                        } else {
                            $ok = 0;

                            print "<tr><td>" . $langs->trans("FunctionsCreation");
                            print "<br>\n" . $langs->trans("Request") . ' ' . $requestnb . ' : ' . $buffer;
                            print "\n</td>";
                            print '<td><span class="error">' . $langs->trans("ErrorSQL") . " " . $db->errno() . " " . $db->error() . '</span></td></tr>';
                            $error++;
                        }
                    }
                }
            }

            print "<tr><td>" . $langs->trans("FunctionsCreation") . "</td>";
            if ($ok) {
                print '<td><img src= "' . BASE_URI . '/theme/eldy/img/tick.png" alt="Ok"></td></tr>';
            } else {
                print '<td><img src= "' . BASE_URI . '/theme/eldy/img/error.png" alt="Error"></td></tr>';
                $ok = 1;
            }
        }
    }
    */

    /***************************************************************************************
     *
     * Load files data/*.sql
     *
     ***************************************************************************************/
    if ($ok && $createdata) {
        include "step2_load_data.php";
    }
    print '</table>';
} else {
    print 'Parameter action=set not defined';
}

$ret = 0;
if (!$ok && isset($argv[1])) {
    $ret = 1;
}
dolibarr_install_syslog("Exit " . $ret);

dolibarr_install_syslog("- step2: end");

$out = '<input type="checkbox" name="dolibarrpingno" id="dolibarrpingno" value="checked" checked="true"> ';
$out .= '<label for="dolibarrpingno">' . $langs->trans("MakeAnonymousPing") . '</label>';

$out .= '<!-- Add js script to manage the uncheck of option to not send the ping -->';
$out .= '<script type="text/javascript">';
$out .= 'jQuery(document).ready(function(){';
$out .= '  document.cookie = "DOLINSTALLNOPING_' . md5($dolibarr_main_instance_unique_id) . '=0; path=/"' . "\n";
$out .= '  jQuery("#dolibarrpingno").click(function() {';
$out .= '    if (! $(this).is(\':checked\')) {';
$out .= '      console.log("We uncheck anonymous ping");';
$out .= '      document.cookie = "DOLINSTALLNOPING_' . md5($dolibarr_main_instance_unique_id) . '=1; path=/"' . "\n";
$out .= '    }';
$out .= '  });';
$out .= '});';
$out .= '</script>';

print $out;

pFooter($ok ? 0 : 1, $setuplang);

if (isset($db) && is_object($db)) {
    $db->close();
}

// Return code if ran from command line
if ($ret) {
    exit($ret);
}
