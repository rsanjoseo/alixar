<?php
/* Copyright (C) 2012 Laurent Destailleur <eldy@users.sourceforge.net>
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
 *       \file       htdocs/core/ajax/bankconciliate.php
 *       \brief      File to set data for bank concilation
 */

if (!defined('NOTOKENRENEWAL')) {
    define('NOTOKENRENEWAL', '1'); // Disables token renewal
}
if (!defined('NOREQUIREMENU')) {
    define('NOREQUIREMENU', '1');
}
if (!defined('NOREQUIREHTML')) {
    define('NOREQUIREHTML', '1');
}
if (!defined('NOREQUIREAJAX')) {
    define('NOREQUIREAJAX', '1');
}
if (!defined('NOREQUIRESOC')) {
    define('NOREQUIRESOC', '1');
}
//if (! defined('NOREQUIRETRAN'))  define('NOREQUIRETRAN','1');    // Required to know date format for dol_print_date

// Descend to the htdocs folder
chdir('../../..');
define('BASE_FOLDER', getcwd());

const MAIN_HIDE_TOP_MENU = 0;
const MAIN_HIDE_LEFT_MENU = 0;
const NOREQUIREHTML = 0;
const NOREQUIREDB = 0;      // Si aparece el mensaje: "Call to member function useLocalTax() on null"
const NOREQUIRESOC = 0;     // Es que no se ha asignado a $mysoc el valor correspondiente.

require 'main.php';

require_once DOL_DOCUMENT_ROOT . '/core/lib/admin.lib.php';
require_once DOL_DOCUMENT_ROOT . '/Modules/Compta/bank/class/account.class.php';

$action = GETPOST('action', 'aZ09');

/*
 * View
 */

//top_htmlhead("", "", 1);  // Replaced with top_httphead. An ajax page does not need html header.
top_httphead();

//print '<!-- Ajax page called with url '.dol_escape_htmltag($_SERVER["PHP_SELF"]).'?'.dol_escape_htmltag($_SERVER["QUERY_STRING"]).' -->'."\n";

if (($user->rights->banque->modifier || $user->rights->banque->consolidate) && $action == 'dvnext') {
    // Increase date
    $al = new AccountLine($db);
    $al->datev_next(GETPOST('rowid', 'int'));
    $al->fetch(GETPOST('rowid', 'int'));

    print '<span class="spanforajaxedit" id="datevalue_' . $al->id . '">' . dol_print_date($db->jdate($al->datev), "day") . '</span>';

    exit;
}

if (($user->rights->banque->modifier || $user->rights->banque->consolidate) && $action == 'dvprev') {
    // Decrease date
    $al = new AccountLine($db);
    $al->datev_previous(GETPOST('rowid', 'int'));
    $al->fetch(GETPOST('rowid', 'int'));

    print '<span class="spanforajaxedit" id="datevalue_' . $al->id . '">' . dol_print_date($db->jdate($al->datev), "day") . '</span>';

    exit;
}

if (($user->rights->banque->modifier || $user->rights->banque->consolidate) && $action == 'donext') {
    // Increase date
    $al = new AccountLine($db);
    $al->dateo_next(GETPOST('rowid', 'int'));
    $al->fetch(GETPOST('rowid', 'int'));

    print '<span class="spanforajaxedit" id="dateoperation_' . $al->id . '">' . dol_print_date($db->jdate($al->dateo), "day") . '</span>';

    exit;
}

if (($user->rights->banque->modifier || $user->rights->banque->consolidate) && $action == 'doprev') {
    // Decrease date
    $al = new AccountLine($db);
    $al->dateo_previous(GETPOST('rowid', 'int'));
    $al->fetch(GETPOST('rowid', 'int'));

    print '<span class="spanforajaxedit" id="dateoperation_' . $al->id . '">' . dol_print_date($db->jdate($al->dateo), "day") . '</span>';

    exit;
}
