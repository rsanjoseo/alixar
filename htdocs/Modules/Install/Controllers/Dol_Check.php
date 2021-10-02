<?php
/* Copyright (C) 2004-2005  Rodolphe Quiedeville    <rodolphe@quiedeville.org>
 * Copyright (C) 2004-2015  Laurent Destailleur     <eldy@users.sourceforge.net>
 * Copyright (C) 2005       Marc Barilley / Ocebo   <marc@ocebo.com>
 * Copyright (C) 2005-2012  Regis Houssin           <regis.houssin@inodbox.com>
 * Copyright (C) 2013-2014  Juanjo Menent           <jmenent@2byte.es>
 * Copyright (C) 2014       Marcos García           <marcosgdf@gmail.com>
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

require 'load_install.php';

// Define DOL_DOCUMENT_ROOT and ADODB_PATH used for install/upgrade process
if (!defined('DOL_DOCUMENT_ROOT')) {
    define('DOL_DOCUMENT_ROOT', BASE_FOLDER);
}

/**
 *    \file       htdocs/install/check.php
 *    \ingroup    install
 *    \brief      Test if file conf can be modified and if does not exists, test if install process can create it
 */

include_once DOL_DOCUMENT_ROOT . '/Modules/Install/inc.php';

global $langs;

$err = 0;
$allowinstall = 0;
$allowupgrade = false;
$checksok = 1;

$setuplang = GETPOST("selectlang", 'aZ09', 3) ? GETPOST("selectlang", 'aZ09', 3) : $langs->getDefaultLang();
$langs->setDefaultLang($setuplang);

$langs->load("install");

/**
 * TODO: Review 'htdocs/install.forced.php' file
 * Dolibarr allows you to create a file called install.forced.php in the htdocs folder to force the installation values.
 *
 * For debian/redhat like systems, must use /etc folder? (???)
 */

// Now we load forced/pre-set values from install.forced.php file.
$useforcedwizard = false;
$forcedfile = DOL_DOCUMENT_ROOT . "/install.forced.php";
if ($conffile == "/etc/dolibarr/conf.php") {
    $forcedfile = "/etc/dolibarr/install.forced.php";
}

if (@file_exists($forcedfile)) {
    $useforcedwizard = true;
    include_once $forcedfile;
}

dolibarr_install_syslog("- check: Dolibarr install/upgrade process started");

/**
 * TODO: The view does a lot of things that it shouldn't.
 */
require_once DOL_DOCUMENT_ROOT . '/Modules/Install/Views/check.php';
