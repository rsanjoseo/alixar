<?php
/* Copyright (C) 2004-2007  Rodolphe Quiedeville    <rodolphe@quiedeville.org>
 * Copyright (C) 2004-2016  Laurent Destailleur     <eldy@users.sourceforge.net>
 * Copyright (C) 2004       Benoit Mortier          <benoit.mortier@opensides.be>
 * Copyright (C) 2004       Sebastien Di Cintio     <sdicintio@ressource-toi.org>
 * Copyright (C) 2005-2011  Regis Houssin           <regis.houssin@inodbox.com>
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
 *        \file       htdocs/install/step1.php
 *        \ingroup    install
 *        \brief      Build conf file on disk
 */

define('DONOTLOADCONF', 1); // To avoid loading conf by file inc.php

include_once DOL_DOCUMENT_ROOT . '/Modules/Install/inc.php';

global $langs;

$action = GETPOST('action', 'aZ09') ? GETPOST('action', 'aZ09') : (empty($argv[1]) ? '' : $argv[1]);
$setuplang = GETPOST('selectlang', 'aZ09', 3) ? GETPOST('selectlang', 'aZ09', 3) : (empty($argv[2]) ? 'auto' : $argv[2]);
$langs->setDefaultLang($setuplang);

$langs->loadLangs(["admin", "install", "errors"]);

// Dolibarr pages directory
$main_dir = GETPOST('main_dir') ? GETPOST('main_dir') : (empty($argv[3]) ? '' : $argv[3]);

// Directory for generated documents (invoices, orders, ecm, etc...)
$main_data_dir = GETPOST('main_data_dir') ? GETPOST('main_data_dir') : (empty($argv[4]) ? ($main_dir . '/documents') : $argv[4]);

// Dolibarr root URL
$main_url = GETPOST('main_url') ? GETPOST('main_url') : (empty($argv[5]) ? '' : $argv[5]);
// Database login information
$userroot = GETPOST('db_user_root', 'alpha') ? GETPOST('db_user_root', 'alpha') : (empty($argv[6]) ? '' : $argv[6]);
$passroot = GETPOST('db_pass_root', 'none') ? GETPOST('db_pass_root', 'none') : (empty($argv[7]) ? '' : $argv[7]);
// Database server
$db_type = GETPOST('db_type', 'aZ09') ? GETPOST('db_type', 'aZ09') : (empty($argv[8]) ? '' : $argv[8]);
$db_host = GETPOST('db_host', 'alpha') ? GETPOST('db_host', 'alpha') : (empty($argv[9]) ? '' : $argv[9]);
$db_name = GETPOST('db_name', 'aZ09') ? GETPOST('db_name', 'aZ09') : (empty($argv[10]) ? '' : $argv[10]);
$db_user = GETPOST('db_user', 'alpha') ? GETPOST('db_user', 'alpha') : (empty($argv[11]) ? '' : $argv[11]);
$db_pass = GETPOST('db_pass', 'none') ? GETPOST('db_pass', 'none') : (empty($argv[12]) ? '' : $argv[12]);
$db_port = GETPOST('db_port', 'int') ? GETPOST('db_port', 'int') : (empty($argv[13]) ? '' : $argv[13]);
$db_prefix = GETPOST('db_prefix', 'aZ09') ? GETPOST('db_prefix', 'aZ09') : (empty($argv[14]) ? '' : $argv[14]);
$db_create_database = GETPOST('db_create_database', 'alpha') ? GETPOST('db_create_database', 'alpha') : (empty($argv[15]) ? '' : $argv[15]);
$db_create_user = GETPOST('db_create_user', 'alpha') ? GETPOST('db_create_user', 'alpha') : (empty($argv[16]) ? '' : $argv[16]);
// Force https
$main_force_https = ((GETPOST("main_force_https", 'alpha') && (GETPOST("main_force_https", 'alpha') == "on" || GETPOST("main_force_https", 'alpha') == 1)) ? '1' : '0');
// Use alternative directory
$main_use_alt_dir = ((GETPOST("main_use_alt_dir", 'alpha') == '' || (GETPOST("main_use_alt_dir", 'alpha') == "on" || GETPOST("main_use_alt_dir", 'alpha') == 1)) ? '' : '//');
// Alternative root directory name
$main_alt_dir_name = ((GETPOST("main_alt_dir_name", 'alpha') && GETPOST("main_alt_dir_name", 'alpha') != '') ? GETPOST("main_alt_dir_name", 'alpha') : 'custom');

$dolibarr_main_distrib = 'standard';

session_start(); // To be able to keep info into session (used for not losing password during navigation. The password must not transit through parameters)

// Save a flag to tell to restore input value if we go back
$_SESSION['dol_save_pass'] = $db_pass;
//$_SESSION['dol_save_passroot']=$passroot;

// Now we load forced values from install.forced.php file.
$useforcedwizard = false;
$forcedfile = DOL_DOCUMENT_ROOT . "/install.forced.php";
if ($conffile == "/etc/dolibarr/conf.php") {
    $forcedfile = "/etc/dolibarr/install.forced.php";
}
if (@file_exists($forcedfile)) {
    $useforcedwizard = true;
    include_once $forcedfile;
    // If forced install is enabled, replace the post values. These are empty because form fields are disabled.
    if ($force_install_noedit) {
        $main_dir = detect_dolibarr_main_document_root();
        if (!empty($argv[1])) {
            $main_dir = $argv[1]; // override when executing the script in command line
        }
        if (!empty($force_install_main_data_root)) {
            $main_data_dir = $force_install_main_data_root;
        } else {
            $main_data_dir = detect_dolibarr_main_data_root($main_dir);
        }
        $main_url = detect_dolibarr_main_url_root();

        if (!empty($force_install_databaserootlogin)) {
            $userroot = parse_database_login($force_install_databaserootlogin);
        }
        if (!empty($force_install_databaserootpass)) {
            $passroot = parse_database_pass($force_install_databaserootpass);
        }
    }
    if ($force_install_noedit == 2) {
        if (!empty($force_install_type)) {
            $db_type = $force_install_type;
        }
        if (!empty($force_install_dbserver)) {
            $db_host = $force_install_dbserver;
        }
        if (!empty($force_install_database)) {
            $db_name = $force_install_database;
        }
        if (!empty($force_install_databaselogin)) {
            $db_user = $force_install_databaselogin;
        }
        if (!empty($force_install_databasepass)) {
            $db_pass = $force_install_databasepass;
        }
        if (!empty($force_install_port)) {
            $db_port = $force_install_port;
        }
        if (!empty($force_install_prefix)) {
            $db_prefix = $force_install_prefix;
        }
        if (!empty($force_install_createdatabase)) {
            $db_create_database = $force_install_createdatabase;
        }
        if (!empty($force_install_createuser)) {
            $db_create_user = $force_install_createuser;
        }
        if (!empty($force_install_mainforcehttps)) {
            $main_force_https = $force_install_mainforcehttps;
        }
    }

    if (!empty($force_install_distrib)) {
        $dolibarr_main_distrib = $force_install_distrib;
    }
}

$error = 0;

/**
 * TODO: The view does a lot of things that it shouldn't.
 * For example, create the configuration files.
 */
require_once DOL_DOCUMENT_ROOT . '/Modules/Install/Views/step1.php';
