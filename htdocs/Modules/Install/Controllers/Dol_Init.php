<?php
/* Copyright (C) 2004-2005  Rodolphe Quiedeville    <rodolphe@quiedeville.org>
 * Copyright (C) 2004-2010  Laurent Destailleur     <eldy@users.sourceforge.net>
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
 *       \file       htdocs/install/index.php
 *       \ingroup    install
 *       \brief      Show page to select language. This is done only for a first installation.
 *                     For a reinstall this page redirect to page check.php
 */
include_once DOL_DOCUMENT_ROOT . '/Modules/Install/inc.php';
include_once DOL_DOCUMENT_ROOT . '/core/class/html.form.class.php';
include_once DOL_DOCUMENT_ROOT . '/core/class/html.formadmin.class.php';

// If the config file exists and is filled, we're not on first install so we skip the language selection page
if (file_exists($conffile) && isset($dolibarr_main_url_root)) {
    header("Location: " . BASE_URI . "/Modules/Install/Controllers/Dol_Check?testget=ok");
    exit;
}

$err = 0;

$langs->load("admin");

require_once DOL_DOCUMENT_ROOT . '/Modules/Install/Views/index.php';
