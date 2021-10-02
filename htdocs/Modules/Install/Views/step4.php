<?php
/*
 *	View
 */

pHeader($langs->trans("AdminAccountCreation"), "step5");

// Test if we can run a first install process
if (!is_writable($conffile)) {
    print $langs->trans("ConfFileIsNotWritable", $conffiletoshow);
    pFooter(1, $setuplang, 'jscheckparam');
    exit;
}

print '<h3><img class="valignmiddle inline-block paddingright" src= "' . BASE_URI . '/theme/common/octicons/build/svg/key.svg" width="20" alt="Database"> ' . $langs->trans("DolibarrAdminLogin") . '</h3>';

print $langs->trans("LastStepDesc") . '<br><br>';

print '<table cellspacing="0" cellpadding="2">';

//$db = getDoliDBInstance($conf->db->type, $conf->db->host, $conf->db->user, $conf->db->pass, $conf->db->name, $conf->db->port);
$db = getConnetion($conf->db->type, $conf->db->host, $conf->db->user, $conf->db->pass, $conf->db->port, $conf->db->name);

if ($db->connected) {
    print '<tr><td><label for="login">' . $langs->trans("Login") . ' :</label></td><td>';
    print '<input id="login" name="login" type="text" value="' . (!empty($_GET["login"]) ? GETPOST("login", 'alpha') : (isset($force_install_dolibarrlogin) ? $force_install_dolibarrlogin : '')) . '"' . (@$force_install_noedit == 2 && $force_install_dolibarrlogin !== null ? ' disabled' : '') . '></td></tr>';
    print '<tr><td><label for="pass">' . $langs->trans("Password") . ' :</label></td><td>';
    print '<input type="password" id="pass" name="pass" autocomplete="new-password"></td></tr>';
    print '<tr><td><label for="pass_verif">' . $langs->trans("PasswordAgain") . ' :</label></td><td>';
    print '<input type="password" id="pass_verif" name="pass_verif" autocomplete="new-password"></td></tr>';
    print '</table>';

    if (isset($_GET["error"]) && $_GET["error"] == 1) {
        print '<br>';
        print '<div class="error">' . $langs->trans("PasswordsMismatch") . '</div>';
        $error = 0; // We show button
    }

    if (isset($_GET["error"]) && $_GET["error"] == 2) {
        print '<br>';
        print '<div class="error">';
        print $langs->trans("PleaseTypePassword");
        print '</div>';
        $error = 0; // We show button
    }

    if (isset($_GET["error"]) && $_GET["error"] == 3) {
        print '<br>';
        print '<div class="error">' . $langs->trans("PleaseTypeALogin") . '</div>';
        $error = 0; // We show button
    }
}

$ret = 0;
if ($error && isset($argv[1])) {
    $ret = 1;
}
dolibarr_install_syslog("Exit " . $ret);

dolibarr_install_syslog("- step4: end");

pFooter($error, $setuplang);

$db->close();

// Return code if ran from command line
if ($ret) {
    exit($ret);
}
