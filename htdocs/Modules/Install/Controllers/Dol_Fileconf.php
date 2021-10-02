<?php
/* Copyright (C) 2004       Rodolphe Quiedeville    <rodolphe@quiedeville.org>
 * Copyright (C) 2004       Eric Seigne             <eric.seigne@ryxeo.com>
 * Copyright (C) 2004-2012  Laurent Destailleur     <eldy@users.sourceforge.net>
 * Copyright (C) 2004       Benoit Mortier          <benoit.mortier@opensides.be>
 * Copyright (C) 2004       Sebastien DiCintio      <sdicintio@ressource-toi.org>
 * Copyright (C) 2005-2011  Regis Houssin           <regis.houssin@inodbox.com>
 * Copyright (C) 2016       Raphaël Doursenaud      <rdoursenaud@gpcsolutions.fr>
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
 *       \file       htdocs/install/fileconf.php
 *       \ingroup    install
 *       \brief      Ask all information required to build Dolibarr htdocs/conf/conf.php file (will be written to disk on next page step1)
 */

include_once DOL_DOCUMENT_ROOT . '/Modules/Install/inc.php';

global $langs;

$err = 0;

$setuplang = GETPOST("selectlang", 'alpha', 3) ? GETPOST("selectlang", 'alpha', 3) : (GETPOST('lang', 'alpha', 1) ? GETPOST('lang', 'alpha', 1) : 'auto');
$langs->setDefaultLang($setuplang);

$langs->loadLangs(["install", "errors"]);

dolibarr_install_syslog("- fileconf: entering fileconf.php page");

// You can force preselected values of the config step of Dolibarr by adding a file
// install.forced.php into directory htdocs/install (This is the case with some wizard
// installer like DoliWamp, DoliMamp or DoliBuntu).
// We first init "forced values" to nothing.
if (!isset($force_install_noedit)) {
    $force_install_noedit = ''; // 1=To block vars specific to distrib, 2 to block all technical parameters
}
if (!isset($force_install_type)) {
    $force_install_type = '';
}
if (!isset($force_install_dbserver)) {
    $force_install_dbserver = '';
}
if (!isset($force_install_port)) {
    $force_install_port = '';
}
if (!isset($force_install_database)) {
    $force_install_database = '';
}
if (!isset($force_install_prefix)) {
    $force_install_prefix = '';
}
if (!isset($force_install_createdatabase)) {
    $force_install_createdatabase = '';
}
if (!isset($force_install_databaselogin)) {
    $force_install_databaselogin = '';
}
if (!isset($force_install_databasepass)) {
    $force_install_databasepass = '';
}
if (!isset($force_install_databaserootlogin)) {
    $force_install_databaserootlogin = '';
}
if (!isset($force_install_databaserootpass)) {
    $force_install_databaserootpass = '';
}
// Now we load forced values from install.forced.php file.
$useforcedwizard = false;
$forcedfile = DOL_DOCUMENT_ROOT . "/install.forced.php";
if ($conffile == "/etc/dolibarr/conf.php") {
    $forcedfile = "/etc/dolibarr/install.forced.php"; // Must be after inc.php
}
if (@file_exists($forcedfile)) {
    $useforcedwizard = true;
    include_once $forcedfile;
}

/**
 * TODO: The view does a lot of things that it shouldn't.
 */
require_once DOL_DOCUMENT_ROOT . '/Modules/Install/Views/fileconf.php';
