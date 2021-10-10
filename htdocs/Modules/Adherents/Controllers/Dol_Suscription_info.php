<?php
/* Copyright (C) 2005-2011 Laurent Destailleur  <eldy@users.sourceforge.net>
 * Copyright (C) 2005-2006 Regis Houssin        <regis.houssin@inodbox.com>
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
 *      \file       htdocs/adherents/subscription/info.php
 *      \ingroup    member
 *      \brief      Page with information of subscriptions of a member
 */

// Descend to the htdocs folder
chdir('../../..');
define('BASE_FOLDER', getcwd());

const MAIN_HIDE_TOP_MENU = 0;
const MAIN_HIDE_LEFT_MENU = 0;
const NOREQUIREHTML = 0;
const NOREQUIREDB = 0;      // Si aparece el mensaje: "Call to member function useLocalTax() on null"
const NOREQUIRESOC = 0;     // Es que no se ha asignado a $mysoc el valor correspondiente.

require 'main.php';

require_once DOL_DOCUMENT_ROOT . '/core/lib/functions2.lib.php';
require_once DOL_DOCUMENT_ROOT . '/Modules/Adherents/class/adherent.class.php';
require_once DOL_DOCUMENT_ROOT . '/core/lib/member.lib.php';
require_once DOL_DOCUMENT_ROOT . '/Modules/Adherents/class/subscription.class.php';

// Load translation files required by the page
$langs->loadLangs(["companies", "members", "bills", "users"]);

if (!$user->rights->adherent->lire) {
    accessforbidden();
}

$rowid = GETPOST("rowid", 'int');

/*
 * View
 */

$form = new Form($db);

llxHeader();

$object = new Subscription($db);
$result = $object->fetch($rowid);

$head = subscription_prepare_head($object);

print dol_get_fiche_head($head, 'info', $langs->trans("Subscription"), -1, 'payment');

$linkback = '<a href="' . DOL_URL_ROOT . '/Modules/Adherents/subscription/list.php?restore_lastsearch_values=1">' . $langs->trans("BackToList") . '</a>';

dol_banner_tab($object, 'rowid', $linkback, 1);

print '<div class="fichecenter">';

print '<div class="underbanner clearboth"></div>';

print '<br>';

$object->info($rowid);

print '<table width="100%"><tr><td>';
dol_print_object_info($object);
print '</td></tr></table>';

print '</div>';

print dol_get_fiche_end();

// End of page
llxFooter();
$db->close();
