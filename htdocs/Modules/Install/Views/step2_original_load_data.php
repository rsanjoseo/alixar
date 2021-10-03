<?php
// We always choose in mysql directory (Conversion is done by driver to translate SQL syntax)
$dir = "mysql/data/";

// Insert data
$handle = opendir($dir);
dolibarr_install_syslog("step2: open directory data " . $dir . " handle=" . $handle);
$tablefound = 0;
$tabledata = [];
if (is_resource($handle)) {
    while (($file = readdir($handle)) !== false) {
        if (preg_match('/\.sql$/i', $file) && preg_match('/^llx_/i', $file)) {
            if (preg_match('/^llx_accounting_account_/', $file)) {
                continue; // We discard data file of chart of account. Will be loaded when a chart is selected.
            }

            //print 'x'.$file.'-'.$createdata.'<br>';
            if (is_numeric($createdata) || preg_match('/' . preg_quote($createdata) . '/i', $file)) {
                $tablefound++;
                $tabledata[] = $file;
            }
        }
    }
    closedir($handle);
}

// Sort list of data files on alphabetical order (load order is important)
sort($tabledata);
foreach ($tabledata as $file) {
    $name = substr($file, 0, dol_strlen($file) - 4);
    $fp = fopen($dir . $file, "r");
    dolibarr_install_syslog("step2: open data file " . $dir . $file . " handle=" . $fp);
    if ($fp) {
        $arrayofrequests = [];
        $linefound = 0;
        $linegroup = 0;
        $sizeofgroup = 1; // Grouping request to have 1 query for several requests does not works with mysql, so we use 1.

        // Load all requests
        while (!feof($fp)) {
            $buffer = fgets($fp, 4096);
            $buffer = trim($buffer);
            if ($buffer) {
                if (substr($buffer, 0, 2) == '--') {
                    continue;
                }

                if ($linefound && ($linefound % $sizeofgroup) == 0) {
                    $linegroup++;
                }
                if (empty($arrayofrequests[$linegroup])) {
                    $arrayofrequests[$linegroup] = $buffer;
                } else {
                    $arrayofrequests[$linegroup] .= " " . $buffer;
                }

                $linefound++;
            }
        }
        fclose($fp);

        dolibarr_install_syslog("step2: found " . $linefound . " records, defined " . count($arrayofrequests) . " group(s).");

        $okallfile = 1;
        $db->begin();

        // We loop on each requests of file
        foreach ($arrayofrequests as $buffer) {
            // Replace the prefix tables
            if ($dolibarr_main_db_prefix != 'llx_') {
                $buffer = preg_replace('/llx_/i', $dolibarr_main_db_prefix, $buffer);
            }

            //dolibarr_install_syslog("step2: request: " . $buffer);
            $resql = $db->query($buffer, 1);
            if ($resql) {
                //$db->free($resql);     // Not required as request we launch here does not return memory needs.
            } else {
                if ($db->lasterrno() == 'DB_ERROR_RECORD_ALREADY_EXISTS') {
                    //print "<tr><td>Insertion ligne : $buffer</td><td>";
                } else {
                    $ok = 0;
                    $okallfile = 0;
                    print '<span class="error">' . $langs->trans("ErrorSQL") . " : " . $db->lasterrno() . " - " . $db->lastqueryerror() . " - " . $db->lasterror() . "</span><br>";
                }
            }
        }

        if ($okallfile) {
            $db->commit();
        } else {
            $db->rollback();
        }
    }
}

print "<tr><td>" . $langs->trans("ReferenceDataLoading") . "</td>";
if ($ok) {
    print '<td><img src="../theme/eldy/img/tick.png" alt="Ok"></td></tr>';
} else {
    print '<td><img src="../theme/eldy/img/error.png" alt="Error"></td></tr>';
    $ok = 1; // Data loading are not blocking errors
}
