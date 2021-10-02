<?php
/* Copyright (C) 2004       Rodolphe Quiedeville    <rodolphe@quiedeville.org>
 * Copyright (C) 2004       Benoit Mortier          <benoit.mortier@opensides.be>
 * Copyright (C) 2004       Sebastien DiCintio      <sdicintio@ressource-toi.org>
 * Copyright (C) 2004-2008  Laurent Destailleur     <eldy@users.sourceforge.net>
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
 *    \file       htdocs/install/step4.php
 *    \ingroup    install
 *    \brief      Ask login and password of Dolibarr admin user
 */

include_once DOL_DOCUMENT_ROOT . '/Modules/Install/inc.php';

require_once $dolibarr_main_document_root . '/core/class/conf.class.php';
require_once $dolibarr_main_document_root . '/core/lib/admin.lib.php';

global $langs;

$setuplang = GETPOST('selectlang', 'aZ09', 3) ? GETPOST('selectlang', 'aZ09', 3) : (empty($argv[1]) ? 'auto' : $argv[1]);
$langs->setDefaultLang($setuplang);

$langs->loadLangs(["admin", "install"]);

// Now we load forced value from install.forced.php file.
$useforcedwizard = false;
$forcedfile = DOL_DOCUMENT_ROOT . "/install.forced.php";
if ($conffile == "/etc/dolibarr/conf.php") {
    $forcedfile = "/etc/dolibarr/install.forced.php";
}
if (@file_exists($forcedfile)) {
    $useforcedwizard = true;
    include_once $forcedfile;
}

dolibarr_install_syslog("- step4: entering step4.php page");

$error = 0;
$ok = 0;

/**
 * TODO: The view does a lot of things that it shouldn't.
 * For example, create the configuration files.
 */
require_once DOL_DOCUMENT_ROOT . '/Modules/Install/Views/step4.php';
