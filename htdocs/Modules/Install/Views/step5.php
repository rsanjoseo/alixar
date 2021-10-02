<?php
/*
 *	View
 */

$morehtml = '';

pHeader($langs->trans("SetupEnd"), "step5", 'set', '', '', 'main-inside main-inside-borderbottom');
print '<br>';

// Test if we can run a first install process
if (empty($versionfrom) && empty($versionto) && !is_writable($conffile)) {
    print $langs->trans("ConfFileIsNotWritable", $conffiletoshow);
    pFooter(1, $setuplang, 'jscheckparam');
    exit;
}

if ($action == "set" || empty($action) || preg_match('/upgrade/i', $action)) {
    $error = 0;

    // If password is encoded, we decode it
    if (preg_match('/crypted:/i', $dolibarr_main_db_pass) || !empty($dolibarr_main_db_encrypted_pass)) {
        require_once $dolibarr_main_document_root . '/core/lib/security.lib.php';
        if (preg_match('/crypted:/i', $dolibarr_main_db_pass)) {
            $dolibarr_main_db_pass = preg_replace('/crypted:/i', '', $dolibarr_main_db_pass);
            $dolibarr_main_db_pass = dol_decode($dolibarr_main_db_pass);
            $dolibarr_main_db_encrypted_pass = $dolibarr_main_db_pass; // We need to set this as it is used to know the password was initially crypted
        } else {
            $dolibarr_main_db_pass = dol_decode($dolibarr_main_db_encrypted_pass);
        }
    }

    $conf->db->type = $dolibarr_main_db_type;
    $conf->db->host = $dolibarr_main_db_host;
    $conf->db->port = $dolibarr_main_db_port;
    $conf->db->name = $dolibarr_main_db_name;
    $conf->db->user = $dolibarr_main_db_user;
    $conf->db->pass = $dolibarr_main_db_pass;
    $conf->db->dolibarr_main_db_encryption = isset($dolibarr_main_db_encryption) ? $dolibarr_main_db_encryption : '';
    $conf->db->dolibarr_main_db_cryptkey = isset($dolibarr_main_db_cryptkey) ? $dolibarr_main_db_cryptkey : '';

    //$db = getDoliDBInstance($conf->db->type, $conf->db->host, $conf->db->user, $conf->db->pass, $conf->db->name, $conf->db->port);
    $db = getConnetion($conf->db->type, $conf->db->host, $conf->db->user, $conf->db->pass, $conf->db->port, $conf->db->name);

    // Create the global $hookmanager object
    include_once DOL_DOCUMENT_ROOT . '/core/class/hookmanager.class.php';
    $hookmanager = new HookManager($db);

    $ok = 0;

    // If first install
    if ($action == "set") {
        // Active module user
        $modName = 'modUser';
        $file = $modName . ".class.php";
        dolibarr_install_syslog('step5: load module user ' . DOL_DOCUMENT_ROOT . "/core/modules/" . $file, LOG_INFO);
        include_once DOL_DOCUMENT_ROOT . "/core/modules/" . $file;
        $objMod = new $modName($db);
        $result = $objMod->init();
        if (!$result) {
            print 'ERROR in activating module file=' . $file;
        }

        if ($db->connected) {
            $conf->setValues($db);
            // Reset forced setup after the setValues
            if (defined('SYSLOG_FILE')) {
                $conf->global->SYSLOG_FILE = constant('SYSLOG_FILE');
            }
            $conf->global->MAIN_ENABLE_LOG_TO_HTML = 1;

            // Create admin user
            include_once DOL_DOCUMENT_ROOT . '/Modules/Users/class/user.class.php';

            // Set default encryption to yes, generate a salt and set default encryption algorythm (but only if there is no user yet into database)
            $sql = "SELECT u.rowid, u.pass, u.pass_crypted";
            $sql .= " FROM " . MAIN_DB_PREFIX . "user as u";
            $resql = $db->query($sql);
            if ($resql) {
                $numrows = $db->num_rows($resql);
                if ($numrows == 0) {
                    // Define default setup for password encryption
                    dolibarr_set_const($db, "DATABASE_PWD_ENCRYPTED", "1", 'chaine', 0, '', $conf->entity);
                    dolibarr_set_const($db, "MAIN_SECURITY_SALT", dol_print_date(dol_now(), 'dayhourlog'), 'chaine', 0, '', 0); // All entities
                    if (function_exists('password_hash')) {
                        dolibarr_set_const($db, "MAIN_SECURITY_HASH_ALGO", 'password_hash', 'chaine', 0, '', 0); // All entities
                    } else {
                        dolibarr_set_const($db, "MAIN_SECURITY_HASH_ALGO", 'sha1md5', 'chaine', 0, '', 0); // All entities
                    }
                }

                dolibarr_install_syslog('step5: DATABASE_PWD_ENCRYPTED = ' . $conf->global->DATABASE_PWD_ENCRYPTED . ' MAIN_SECURITY_HASH_ALGO = ' . $conf->global->MAIN_SECURITY_HASH_ALGO, LOG_INFO);
            }

            // Create user used to create the admin user
            $createuser = new User($db);
            $createuser->id = 0;
            $createuser->admin = 1;

            // Set admin user
            $newuser = new User($db);
            $newuser->lastname = 'SuperAdmin';
            $newuser->firstname = '';
            $newuser->login = $login;
            $newuser->pass = $pass;
            $newuser->admin = 1;
            $newuser->entity = 0;

            $conf->global->USER_MAIL_REQUIRED = 0; // Force global option to be sure to create a new user with no email
            $result = $newuser->create($createuser, 1);
            if ($result > 0) {
                print $langs->trans("AdminLoginCreatedSuccessfuly", $login) . "<br>";
                $success = 1;
            } else {
                if ($newuser->error == 'ErrorLoginAlreadyExists') {
                    dolibarr_install_syslog('step5: AdminLoginAlreadyExists', LOG_WARNING);
                    print '<br><div class="warning">' . $langs->trans("AdminLoginAlreadyExists", $login) . "</div><br>";
                    $success = 1;
                } else {
                    dolibarr_install_syslog('step5: FailedToCreateAdminLogin ' . $newuser->error, LOG_ERR);
                    print '<br><div class="error">' . $langs->trans("FailedToCreateAdminLogin") . ' ' . $newuser->error . '</div><br><br>';
                }
            }

            if ($success) {
                // Insert MAIN_VERSION_FIRST_INSTALL in a dedicated transaction. So if it fails (when first install was already done), we can do other following requests.
                $db->begin();
                dolibarr_install_syslog('step5: set MAIN_VERSION_FIRST_INSTALL const to ' . $targetversion, LOG_DEBUG);
                $resql = $db->query("INSERT INTO " . MAIN_DB_PREFIX . "const(name, value, type, visible, note, entity) values(" . $db->encrypt('MAIN_VERSION_FIRST_INSTALL') . ", " . $db->encrypt($targetversion) . ", 'chaine', 0, 'Dolibarr version when first install', 0)");
                if ($resql) {
                    $conf->global->MAIN_VERSION_FIRST_INSTALL = $targetversion;
                    $db->commit();
                } else {
                    //if (! $resql) dol_print_error($db,'Error in setup program');      // We ignore errors. Key may already exists
                    $db->commit();
                }

                $db->begin();

                dolibarr_install_syslog('step5: set MAIN_VERSION_LAST_INSTALL const to ' . $targetversion, LOG_DEBUG);
                $resql = $db->query("DELETE FROM " . MAIN_DB_PREFIX . "const WHERE " . $db->decrypt('name') . " = 'MAIN_VERSION_LAST_INSTALL'");
                if (!$resql) {
                    dol_print_error($db, 'Error in setup program');
                }
                $resql = $db->query("INSERT INTO " . MAIN_DB_PREFIX . "const(name,value,type,visible,note,entity) values(" . $db->encrypt('MAIN_VERSION_LAST_INSTALL') . ", " . $db->encrypt($targetversion) . ", 'chaine', 0, 'Dolibarr version when last install', 0)");
                if (!$resql) {
                    dol_print_error($db, 'Error in setup program');
                }
                $conf->global->MAIN_VERSION_LAST_INSTALL = $targetversion;

                if ($useforcedwizard) {
                    dolibarr_install_syslog('step5: set MAIN_REMOVE_INSTALL_WARNING const to 1', LOG_DEBUG);
                    $resql = $db->query("DELETE FROM " . MAIN_DB_PREFIX . "const WHERE " . $db->decrypt('name') . " = 'MAIN_REMOVE_INSTALL_WARNING'");
                    if (!$resql) {
                        dol_print_error($db, 'Error in setup program');
                    }
                    $resql = $db->query("INSERT INTO " . MAIN_DB_PREFIX . "const(name,value,type,visible,note,entity) values(" . $db->encrypt('MAIN_REMOVE_INSTALL_WARNING') . ", " . $db->encrypt(1) . ", 'chaine', 1, 'Disable install warnings', 0)");
                    if (!$resql) {
                        dol_print_error($db, 'Error in setup program');
                    }
                    $conf->global->MAIN_REMOVE_INSTALL_WARNING = 1;
                }

                // If we ask to force some modules to be enabled
                if (!empty($force_install_module)) {
                    if (!defined('DOL_DOCUMENT_ROOT') && !empty($dolibarr_main_document_root)) {
                        define('DOL_DOCUMENT_ROOT', $dolibarr_main_document_root);
                    }

                    $tmparray = explode(',', $force_install_module);
                    foreach ($tmparray as $modtoactivate) {
                        $modtoactivatenew = preg_replace('/\.class\.php$/i', '', $modtoactivate);
                        print $langs->trans("ActivateModule", $modtoactivatenew) . '<br>';

                        $file = $modtoactivatenew . '.class.php';
                        dolibarr_install_syslog('step5: activate module file=' . $file);
                        $res = dol_include_once("/core/modules/" . $file);

                        $res = activateModule($modtoactivatenew, 1);
                        if (!empty($res['errors'])) {
                            print 'ERROR in activating module file=' . $file;
                        }
                    }
                }

                dolibarr_install_syslog('step5: remove MAIN_NOT_INSTALLED const');
                $resql = $db->query("DELETE FROM " . MAIN_DB_PREFIX . "const WHERE " . $db->decrypt('name') . "='MAIN_NOT_INSTALLED'");
                if (!$resql) {
                    dol_print_error($db, 'Error in setup program');
                }

                $db->commit();
            }
        } else {
            print $langs->trans("ErrorFailedToConnect") . "<br>";
        }
    } elseif (empty($action) || preg_match('/upgrade/i', $action)) {
        // If upgrade
        if ($db->connected) {
            $conf->setValues($db);
            // Reset forced setup after the setValues
            if (defined('SYSLOG_FILE')) {
                $conf->global->SYSLOG_FILE = constant('SYSLOG_FILE');
            }
            $conf->global->MAIN_ENABLE_LOG_TO_HTML = 1;

            // Define if we need to update the MAIN_VERSION_LAST_UPGRADE value in database
            $tagdatabase = false;
            if (empty($conf->global->MAIN_VERSION_LAST_UPGRADE)) {
                $tagdatabase = true; // We don't know what it was before, so now we consider we are version choosed.
            } else {
                $mainversionlastupgradearray = preg_split('/[.-]/', $conf->global->MAIN_VERSION_LAST_UPGRADE);
                $targetversionarray = preg_split('/[.-]/', $targetversion);
                if (versioncompare($targetversionarray, $mainversionlastupgradearray) > 0) {
                    $tagdatabase = true;
                }
            }

            if ($tagdatabase) {
                dolibarr_install_syslog('step5: set MAIN_VERSION_LAST_UPGRADE const to value ' . $targetversion);
                $resql = $db->query("DELETE FROM " . MAIN_DB_PREFIX . "const WHERE " . $db->decrypt('name') . " = 'MAIN_VERSION_LAST_UPGRADE'");
                if (!$resql) {
                    dol_print_error($db, 'Error in setup program');
                }
                $resql = $db->query("INSERT INTO " . MAIN_DB_PREFIX . "const(name, value, type, visible, note, entity) VALUES (" . $db->encrypt('MAIN_VERSION_LAST_UPGRADE') . ", " . $db->encrypt($targetversion) . ", 'chaine', 0, 'Dolibarr version for last upgrade', 0)");
                if (!$resql) {
                    dol_print_error($db, 'Error in setup program');
                }
                $conf->global->MAIN_VERSION_LAST_UPGRADE = $targetversion;
            } else {
                dolibarr_install_syslog('step5: we run an upgrade to version ' . $targetversion . ' but database was already upgraded to ' . $conf->global->MAIN_VERSION_LAST_UPGRADE . '. We keep MAIN_VERSION_LAST_UPGRADE as it is.');
            }
        } else {
            print $langs->trans("ErrorFailedToConnect") . "<br>";
        }
    } else {
        dol_print_error('', 'step5.php: unknown choice of action');
    }

    // May fail if parameter already defined
    $resql = $db->query("INSERT INTO " . MAIN_DB_PREFIX . "const(name,value,type,visible,note,entity) VALUES (" . $db->encrypt('MAIN_LANG_DEFAULT') . ", " . $db->encrypt($setuplang) . ", 'chaine', 0, 'Default language', 1)");
    //if (! $resql) dol_print_error($db,'Error in setup program');

    $db->close();
}

// Create lock file

// If first install
if ($action == "set" && $success) {
    if (empty($conf->global->MAIN_VERSION_LAST_UPGRADE) || ($conf->global->MAIN_VERSION_LAST_UPGRADE == DOL_VERSION)) {
        // Install is finished
        print $langs->trans("SystemIsInstalled") . "<br>";

        $createlock = 0;

        if (!empty($force_install_lockinstall) || !empty($conf->global->MAIN_ALWAYS_CREATE_LOCK_AFTER_LAST_UPGRADE)) {
            // Install is finished, we create the lock file
            $lockfile = DOL_DATA_ROOT . '/install.lock';
            $fp = @fopen($lockfile, "w");
            if ($fp) {
                if (empty($force_install_lockinstall) || $force_install_lockinstall == 1) {
                    $force_install_lockinstall = 444; // For backward compatibility
                }
                fwrite($fp, "This is a lock file to prevent use of install pages (set with permission " . $force_install_lockinstall . ")");
                fclose($fp);
                @chmod($lockfile, octdec($force_install_lockinstall));
                $createlock = 1;
            }
        }
        if (empty($createlock)) {
            print '<div class="warning">' . $langs->trans("WarningRemoveInstallDir") . "</div>";
        }

        print "<br>";

        print $langs->trans("YouNeedToPersonalizeSetup") . "<br><br><br>";

        print '<div class="center"><a href="../admin/index.php?mainmenu=home&leftmenu=setup' . (isset($login) ? '&username=' . urlencode($login) : '') . '">';
        print '<span class="fas fa-external-link-alt"></span> ' . $langs->trans("GoToSetupArea");
        print '</a></div>';
    } else {
        // If here MAIN_VERSION_LAST_UPGRADE is not empty
        print $langs->trans("VersionLastUpgrade") . ': <b><span class="ok">' . $conf->global->MAIN_VERSION_LAST_UPGRADE . '</span></b><br>';
        print $langs->trans("VersionProgram") . ': <b><span class="ok">' . DOL_VERSION . '</span></b><br>';
        print $langs->trans("MigrationNotFinished") . '<br>';
        print "<br>";

        print '<div class="center"><a href="' . $dolibarr_main_url_root . '/install/index.php">';
        print '<span class="fas fa-link-alt"></span> ' . $langs->trans("GoToUpgradePage");
        print '</a></div>';
    }
} elseif (empty($action) || preg_match('/upgrade/i', $action)) {
    // If upgrade
    if (empty($conf->global->MAIN_VERSION_LAST_UPGRADE) || ($conf->global->MAIN_VERSION_LAST_UPGRADE == DOL_VERSION)) {
        // Upgrade is finished
        print '<img class="valignmiddle inline-block paddingright" src= "' . BASE_URI . '/theme/common/octicons/build/svg/checklist.svg" width="20" alt="Configuration"> ' . $langs->trans("SystemIsUpgraded") . "<br>";

        $createlock = 0;

        if (!empty($force_install_lockinstall) || !empty($conf->global->MAIN_ALWAYS_CREATE_LOCK_AFTER_LAST_UPGRADE)) {
            // Upgrade is finished, we create the lock file
            $lockfile = DOL_DATA_ROOT . '/install.lock';
            $fp = @fopen($lockfile, "w");
            if ($fp) {
                if (empty($force_install_lockinstall) || $force_install_lockinstall == 1) {
                    $force_install_lockinstall = 444; // For backward compatibility
                }
                fwrite($fp, "This is a lock file to prevent use of install pages (set with permission " . $force_install_lockinstall . ")");
                fclose($fp);
                @chmod($lockfile, octdec($force_install_lockinstall));
                $createlock = 1;
            }
        }
        if (empty($createlock)) {
            print '<br><div class="warning">' . $langs->trans("WarningRemoveInstallDir") . "</div>";
        }

        print "<br>";

        $morehtml = '<br><div class="center"><a href="../index.php?mainmenu=home' . (isset($login) ? '&username=' . urlencode($login) : '') . '">';
        $morehtml .= '<span class="fas fa-link-alt"></span> ' . $langs->trans("GoToDolibarr") . '...';
        $morehtml .= '</a></div><br>';
    } else {
        // If here MAIN_VERSION_LAST_UPGRADE is not empty
        print $langs->trans("VersionLastUpgrade") . ': <b><span class="ok">' . $conf->global->MAIN_VERSION_LAST_UPGRADE . '</span></b><br>';
        print $langs->trans("VersionProgram") . ': <b><span class="ok">' . DOL_VERSION . '</span></b>';

        print "<br>";

        $morehtml = '<br><div class="center"><a href="../install/index.php">';
        $morehtml .= '<span class="fas fa-link-alt"></span> ' . $langs->trans("GoToUpgradePage");
        $morehtml .= '</a></div>';
    }
} else {
    dol_print_error('', 'step5.php: unknown choice of action');
}

// Clear cache files
clearstatcache();

$ret = 0;
if ($error && isset($argv[1])) {
    $ret = 1;
}
dolibarr_install_syslog("Exit " . $ret);

dolibarr_install_syslog("- step5: Dolibarr setup finished");

pFooter(1, $setuplang, '', 0, $morehtml);

// Return code if ran from command line
if ($ret) {
    exit($ret);
}
