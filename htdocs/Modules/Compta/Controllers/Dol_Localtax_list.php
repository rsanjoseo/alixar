<?php
/* Copyright (C) 2011-2014		Juanjo Menent <jmenent@2byte.es>
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
 *        \file       htdocs/compta/localtax/list.php
 *      \ingroup    tax
 *        \brief      List of IRPF payments
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

require_once DOL_DOCUMENT_ROOT . '/Modules/Compta/localtax/class/localtax.class.php';

// Load translation files required by the page
$langs->load("compta");

// Security check
$socid = GETPOST('socid', 'int');
if ($user->socid) {
    $socid = $user->socid;
}
$result = restrictedArea($user, 'tax', '', '', 'charges');
$ltt = GETPOST("localTaxType", 'int');

/*
 * View
 */

llxHeader();

$localtax_static = new Localtax($db);

$url = DOL_URL_ROOT . '/Modules/Compta/localtax/card.php?action=create&localTaxType=' . $ltt;
if (!empty($socid)) {
    $url .= '&socid=' . $socid;
}
$newcardbutton = dolGetButtonTitle($langs->trans('NewLocalTaxPayment', ($ltt + 1)), '', 'fa fa-plus-circle', $url, '', $user->rights->tax->charges->creer);

print load_fiche_titre($langs->transcountry($ltt == 2 ? "LT2Payments" : "LT1Payments", $mysoc->country_code), $newcardbutton, 'title_accountancy');

$sql = "SELECT rowid, amount, label, f.datev, f.datep";
$sql .= " FROM " . MAIN_DB_PREFIX . "localtax as f ";
$sql .= " WHERE f.entity = " . $conf->entity . " AND localtaxtype = " . ((int) $ltt);
$sql .= " ORDER BY datev DESC";

$result = $db->query($sql);
if ($result) {
    $num = $db->num_rows($result);
    $i = 0;
    $total = 0;

    print '<table class="noborder centpercent">';
    print '<tr class="liste_titre">';
    print '<td class="nowrap" align="left">' . $langs->trans("Ref") . '</td>';
    print "<td>" . $langs->trans("Label") . "</td>";
    print "<td>" . $langs->trans("PeriodEndDate") . "</td>";
    print '<td class="nowrap" align="left">' . $langs->trans("DatePayment") . '</td>';
    print "<td align=\"right\">" . $langs->trans("PayedByThisPayment") . "</td>";
    print "</tr>\n";
    $var = 1;
    while ($i < $num) {
        $obj = $db->fetch_object($result);

        print '<tr class="oddeven">';

        $localtax_static->id = $obj->rowid;
        $localtax_static->ref = $obj->rowid;
        print "<td>" . $localtax_static->getNomUrl(1) . "</td>\n";
        print "<td>" . dol_trunc($obj->label, 40) . "</td>\n";
        print '<td class="left">' . dol_print_date($db->jdate($obj->datev), 'day') . "</td>\n";
        print '<td class="left">' . dol_print_date($db->jdate($obj->datep), 'day') . "</td>\n";
        $total = $total + $obj->amount;

        print "<td align=\"right\">" . price($obj->amount) . "</td>";
        print "</tr>\n";

        $i++;
    }
    print '<tr class="liste_total"><td colspan="4">' . $langs->trans("Total") . '</td>';
    print '<td class="right"><span class="amount">' . price($total) . '</span></td></tr>';

    print "</table>";
    $db->free($result);
} else {
    dol_print_error($db);
}

// End of page
llxFooter();
$db->close();
