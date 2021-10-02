<?php
/* Copyright (C) 2004       Rodolphe Quiedeville    <rodolphe@quiedeville.org>
 * Copyright (C) 2004-2017  Laurent Destailleur     <eldy@users.sourceforge.net>
 * Copyright (C) 2004       Benoit Mortier          <benoit.mortier@opensides.be>
 * Copyright (C) 2004       Sebastien DiCintio      <sdicintio@ressource-toi.org>
 * Copyright (C) 2005-2012  Regis Houssin           <regis.houssin@inodbox.com>
 * Copyright (C) 2015-2016  Raphaël Doursenaud      <rdoursenaud@gpcsolutions.fr>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

// Descend to the htdocs folder
chdir('../../..');
define('BASE_FOLDER', getcwd());

require 'load_install.php';

// Define DOL_DOCUMENT_ROOT and ADODB_PATH used for install/upgrade process
if (!defined('DOL_DOCUMENT_ROOT')) {
    define('DOL_DOCUMENT_ROOT', BASE_FOLDER);
}

/**
 *       \file      htdocs/install/step5.php
 *       \ingroup   install
 *       \brief     Last page of upgrade / install process
 */

include_once DOL_DOCUMENT_ROOT . '/Modules/Install/inc.php';

if (file_exists($conffile)) {
    include_once $conffile;
}
require_once $dolibarr_main_document_root . '/core/lib/admin.lib.php';
require_once $dolibarr_main_document_root . '/core/lib/security.lib.php'; // for dol_hash

global $langs;

$versionfrom = GETPOST("versionfrom", 'alpha', 3) ? GETPOST("versionfrom", 'alpha', 3) : (empty($argv[1]) ? '' : $argv[1]);
$versionto = GETPOST("versionto", 'alpha', 3) ? GETPOST("versionto", 'alpha', 3) : (empty($argv[2]) ? '' : $argv[2]);
$setuplang = GETPOST('selectlang', 'aZ09', 3) ? GETPOST('selectlang', 'aZ09', 3) : (empty($argv[3]) ? 'auto' : $argv[3]);
$langs->setDefaultLang($setuplang);
$action = GETPOST('action', 'alpha') ? GETPOST('action', 'alpha') : (empty($argv[4]) ? '' : $argv[4]);

// Define targetversion used to update MAIN_VERSION_LAST_INSTALL for first install
// or MAIN_VERSION_LAST_UPGRADE for upgrade.
$targetversion = DOL_VERSION; // If it's latest upgrade
if (!empty($action) && preg_match('/upgrade/i', $action)) {
    // If it's an old upgrade
    $tmp = explode('_', $action, 2);
    if ($tmp[0] == 'upgrade') {
        if (!empty($tmp[1])) {
            $targetversion = $tmp[1]; // if $action = 'upgrade_6.0.0-beta', we use '6.0.0-beta'
        } else {
            $targetversion = DOL_VERSION; // if $action = 'upgrade', we use DOL_VERSION
        }
    }
}

$langs->loadLangs(["admin", "install"]);

$login = GETPOST('login', 'alpha') ? GETPOST('login', 'alpha') : (empty($argv[5]) ? '' : $argv[5]);
$pass = GETPOST('pass', 'alpha') ? GETPOST('pass', 'alpha') : (empty($argv[6]) ? '' : $argv[6]);
$pass_verif = GETPOST('pass_verif', 'alpha') ? GETPOST('pass_verif', 'alpha') : (empty($argv[7]) ? '' : $argv[7]);
$force_install_lockinstall = (int) (!empty($force_install_lockinstall) ? $force_install_lockinstall : (GETPOST('installlock', 'aZ09') ? GETPOST('installlock', 'aZ09') : (empty($argv[8]) ? '' : $argv[8])));

$success = 0;

$useforcedwizard = false;
$forcedfile = DOL_DOCUMENT_ROOT . "/install.forced.php";
if ($conffile == "/etc/dolibarr/conf.php") {
    $forcedfile = "/etc/dolibarr/install.forced.php";
}
if (@file_exists($forcedfile)) {
    $useforcedwizard = true;
    include_once $forcedfile;
    // If forced install is enabled, replace post values. These are empty because form fields are disabled.
    if ($force_install_noedit == 2) {
        if (!empty($force_install_dolibarrlogin)) {
            $login = $force_install_dolibarrlogin;
        }
    }
}

dolibarr_install_syslog("- step5: entering step5.php page");

$error = 0;

/*
 *	Actions
 */

// If install, check password and password_verification used to create admin account
if ($action == "set") {
    if ($pass <> $pass_verif) {
        header("Location: step4.php?error=1&selectlang=$setuplang" . (isset($login) ? '&login=' . $login : ''));
        exit;
    }

    if (dol_strlen(trim($pass)) == 0) {
        header("Location: step4.php?error=2&selectlang=$setuplang" . (isset($login) ? '&login=' . $login : ''));
        exit;
    }

    if (dol_strlen(trim($login)) == 0) {
        header("Location: step4.php?error=3&selectlang=$setuplang" . (isset($login) ? '&login=' . $login : ''));
        exit;
    }
}

/**
 * TODO: The view does a lot of things that it shouldn't.
 * For example, create the configuration files.
 */
require_once DOL_DOCUMENT_ROOT . '/Modules/Install/Views/step5.php';
