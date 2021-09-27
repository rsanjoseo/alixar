<?php
/* Copyright (C) 2001-2004	Rodolphe Quiedeville	<rodolphe@quiedeville.org>
 * Copyright (C) 2004-2020	Laurent Destailleur		<eldy@users.sourceforge.net>
 * Copyright (C) 2005-2017	Regis Houssin			<regis.houssin@inodbox.com>
 * Copyright (C) 2011-2012	Juanjo Menent			<jmenent@2byte.es>
 * Copyright (C) 2015		Marcos García			<marcosgdf@gmail.com>
 * Copyright (C) 2021		Frédéric France			<frederic.france@netlogic.fr>
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

/**
 *    \file       htdocs/index.php
 *    \brief      Dolibarr home page
 */

/**
 * TODO: Temporarily defined constants
 */
const MAIN_HIDE_TOP_MENU = 0;
const MAIN_HIDE_LEFT_MENU = 0;

require 'main.php';
require_once DOL_DOCUMENT_ROOT . '/core/class/html.formother.class.php';

// If not defined, we select menu "home"
$_GET['mainmenu'] = GETPOST('mainmenu', 'aZ09') ? GETPOST('mainmenu', 'aZ09') : 'home';
$action = GETPOST('action', 'aZ09');

$hookmanager->initHooks(['index']);

/*
 * Actions
 */

// Check if company name is defined (first install)
if (!isset($conf->global->MAIN_INFO_SOCIETE_NOM) || empty($conf->global->MAIN_INFO_SOCIETE_NOM)) {
    header("Location: " . DOL_URL_ROOT . "/admin/index.php?mainmenu=home&leftmenu=setup&mesg=setupnotcomplete");
    exit;
}
if (count($conf->modules) <= (empty($conf->global->MAIN_MIN_NB_ENABLED_MODULE_FOR_WARNING) ? 1 : $conf->global->MAIN_MIN_NB_ENABLED_MODULE_FOR_WARNING)) {    // If only user module enabled
    header("Location: " . DOL_URL_ROOT . "/admin/index.php?mainmenu=home&leftmenu=setup&mesg=setupnotcomplete");
    exit;
}

if (GETPOST('addbox')) {    // Add box (when submit is done from a form when ajax disabled)
    require_once DOL_DOCUMENT_ROOT . '/core/class/infobox.class.php';
    $zone = GETPOST('areacode', 'int');
    $userid = GETPOST('userid', 'int');
    $boxorder = GETPOST('boxorder', 'aZ09');
    $boxorder .= GETPOST('boxcombo', 'aZ09');

    $result = InfoBox::saveboxorder($db, $zone, $boxorder, $userid);
    if ($result > 0) {
        setEventMessages($langs->trans("BoxAdded"), null);
    }
}

require_once DOL_DOCUMENT_ROOT . '/Modules/Main/Views/index.php';