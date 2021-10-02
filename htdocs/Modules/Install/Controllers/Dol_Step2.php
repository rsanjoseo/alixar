<?php
/* Copyright (C) 2004       Rodolphe Quiedeville    <rodolphe@quiedeville.org>
 * Copyright (C) 2004-2010  Laurent Destailleur     <eldy@users.sourceforge.net>
 * Copyright (C) 2015       Cedric GROSS            <c.gross@kreiz-it.fr>
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
use Alxarafe\Core\Singletons\Config;

chdir('../../..');
define('BASE_FOLDER', getcwd());

require 'load.php';

// Define DOL_DOCUMENT_ROOT and ADODB_PATH used for install/upgrade process
if (!defined('DOL_DOCUMENT_ROOT')) {
    define('DOL_DOCUMENT_ROOT', BASE_FOLDER);
}

/**
 *      \file       htdocs/install/step2.php
 *      \ingroup    install
 *      \brief      Create tables, primary keys, foreign keys, indexes and functions into database and then load reference data
 */

include_once DOL_DOCUMENT_ROOT . '/Modules/Install/inc.php';

// require_once $dolibarr_main_document_root.'/core/class/conf.class.php';
// require_once $dolibarr_main_document_root.'/core/lib/admin.lib.php';

require_once DOL_DOCUMENT_ROOT . '/core/class/conf.class.php';
require_once DOL_DOCUMENT_ROOT . '/core/lib/admin.lib.php';

global $langs;

$step = 2;
$ok = 0;

// Cette page peut etre longue. On augmente le delai autorise.
// Ne fonctionne que si on est pas en safe_mode.
$err = error_reporting();
error_reporting(0); // Disable all errors
//error_reporting(E_ALL);
@set_time_limit(1800); // Need 1800 on some very slow OS like Windows 7/64
error_reporting($err);

$action = GETPOST('action', 'aZ09') ? GETPOST('action', 'aZ09') : (empty($argv[1]) ? '' : $argv[1]);
$setuplang = GETPOST('selectlang', 'aZ09', 3) ? GETPOST('selectlang', 'aZ09', 3) : (empty($argv[2]) ? 'auto' : $argv[2]);
$langs->setDefaultLang($setuplang);

$langs->loadLangs(["admin", "install"]);

/*
$choix = 0;
if ($dolibarr_main_db_type == "mysqli") {
    $choix = 1;
}
if ($dolibarr_main_db_type == "pgsql") {
    $choix = 2;
}
if ($dolibarr_main_db_type == "mssql") {
    $choix = 3;
}
if ($dolibarr_main_db_type == "sqlite") {
    $choix = 4;
}
if ($dolibarr_main_db_type == "sqlite3") {
    $choix = 5;
}

//if (empty($choix)) dol_print_error('','Database type '.$dolibarr_main_db_type.' not supported into step2.php page');
*/

// Now we load forced values from install.forced.php file.
$useforcedwizard = false;
$forcedfile = DOL_DOCUMENT_ROOT . "/install.forced.php";
if ($conffile == "/etc/dolibarr/conf.php") {
    $forcedfile = "/etc/dolibarr/install.forced.php";
}
if (@file_exists($forcedfile)) {
    $useforcedwizard = true;
    include_once $forcedfile;
    // test for travis
    if (!empty($argv[1]) && $argv[1] == "set") {
        $action = "set";
    }
}

dolibarr_install_syslog("- step2: entering step2.php page");

/**
 * TODO: The view does a lot of things that it shouldn't.
 * For example, create the configuration files.
 */
require_once DOL_DOCUMENT_ROOT . '/Modules/Install/Views/step2.php';
