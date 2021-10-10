<?php
/* Copyright (C) 2005-2010 Laurent Destailleur  <eldy@users.sourceforge.net>
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
 *     \file       htdocs/compta/bank/info.php
 *     \ingroup    banque
 *     \brief      Onglet info d'une ecriture bancaire
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
require_once DOL_DOCUMENT_ROOT . '/Modules/Compta/paiement/class/paiement.class.php';
require_once DOL_DOCUMENT_ROOT . '/Modules/Compta/bank/class/account.class.php';

// Load translation files required by the page
$langs->loadLangs(['banks', 'categories', 'companies']);

$id = GETPOST("rowid", 'int');
$ref = GETPOST('ref', 'alpha');

// Security check
$fieldvalue = (!empty($id) ? $id : (!empty($ref) ? $ref : ''));
$fieldtype = (!empty($ref) ? 'ref' : 'rowid');
if ($user->socid) {
    $socid = $user->socid;
}
$result = restrictedArea($user, 'banque', $fieldvalue, 'bank_account', '', '', $fieldtype);
if (!$user->rights->banque->lire && !$user->rights->banque->consolidate) {
    accessforbidden();
}

/*
 * View
 */

llxHeader();

$object = new AccountLine($db);
$object->fetch($id);
$object->info($id);

$h = 0;

$head[$h][0] = DOL_URL_ROOT . '/Modules/Compta/bank/line.php?rowid=' . $id;
$head[$h][1] = $langs->trans("BankTransaction");
$h++;

$head[$h][0] = DOL_URL_ROOT . '/Modules/Compta/bank/info.php?rowid=' . $id;
$head[$h][1] = $langs->trans("Info");
$hselected = $h;
$h++;

print dol_get_fiche_head($head, $hselected, $langs->trans("LineRecord"), -1, 'accountline');

$linkback = '<a href="' . DOL_URL_ROOT . '/Modules/Compta/bank/bankentries_list.php?restore_lastsearch_values=1">' . $langs->trans("BackToList") . '</a>';

dol_banner_tab($object, 'rowid', $linkback);

print '<div class="underbanner clearboth"></div>';
print '<br>';

print '<table width="100%"><tr><td>';
dol_print_object_info($object);
print '</td></tr></table>';

print '</div>';

// End of page
llxFooter();
$db->close();
