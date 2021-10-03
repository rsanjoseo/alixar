<?php
// We always choose in mysql directory (Conversion is done by driver to translate SQL syntax)
$dir = DOL_DOCUMENT_ROOT . '/Modules/Install/data/';

$ok = true;

$files = scandir($dir);
dolibarr_install_syslog('step2: open directory data ' . $dir . ' files=' . count($files));

foreach ($files as $file) {
    if (substr($file, -4) !== '.sql') {
        continue;
    }

    // The accounting file is discarded, as there is one for each language.
    if (substr($file, 0, -7) === 'llx_accounting_account') {
        continue;
    }

    $arrayOfRequests = [];
    $sqlCommand = '';

    $fp = fopen($dir . $file, "r");
    while (!feof($fp)) {
        $line = trim(fgets($fp));
        if (substr($line, 0, 2) === '--' || empty($line)) {
            continue;
        }
        $sqlCommand .= ' ' . $line;
        if (substr($sqlCommand, -1) === ';') {
            $arrayOfRequests[] = $sqlCommand;
            $sqlCommand = '';
        }
    }
    fclose($fp);

    dolibarr_install_syslog('step2: found ' . count($arrayOfRequests) . ' records.');

    $db->beginTransaction();
    foreach ($arrayOfRequests as $request) {
        // Replace the prefix tables
        if ($dolibarr_main_db_prefix != 'llx_') {
            $request = preg_replace('/llx_/i', $dolibarr_main_db_prefix, $request);
        }

        //dolibarr_install_syslog("step2: request: " . $buffer);
        try {
            $result = $db->exec($request);
        } catch (PDOException $e) {
            if ($e->getCode() !== '23000') {
                $ok = false;
                dump($request);
                dump($e);
                $db->rollback();
                break;
            }
        }
    }
    $db->commitTransaction();
}

print "<tr><td>" . $langs->trans("ReferenceDataLoading") . "</td>";
if ($ok) {
    print '<td><img src="' . BASE_URI . '/theme/eldy/img/tick.png" alt="Ok"></td></tr>';
} else {
    print '<td><img src="' . BASE_URI . '/theme/eldy/img/error.png" alt="Error"></td></tr>';
    $ok = 1; // Data loading are not blocking errors
}
