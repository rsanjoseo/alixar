<?php
/* Copyright (C) 2020	Tobias Sekan	<tobias.sekan@startmail.com>
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
 *    \file        htdocs/fourn/facture/index.php
 *    \ingroup    facture
 *    \brief        Home page of customer invoices area
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

require_once DOL_DOCUMENT_ROOT . '/Modules/Fourn/class/fournisseur.facture.class.php';
require_once DOL_DOCUMENT_ROOT . '/core/class/html.formfile.class.php';
require_once DOL_DOCUMENT_ROOT . '/core/class/dolgraph.class.php';
require_once DOL_DOCUMENT_ROOT . '/core/lib/invoice.lib.php';

// Security check
restrictedArea($user, 'fournisseur', 0, '', 'facture');

// Load translation files required by the page
$langs->loadLangs(['bills', 'boxes']);

// Filter to show only result of one supplier
$socid = GETPOST('socid', 'int');
if (isset($user->socid) && $user->socid > 0) {
    $action = '';
    $socid = $user->socid;
}

$max = $conf->global->MAIN_SIZE_SHORTLIST_LIMIT;

// Maximum elements of the tables
$maxDraftCount = empty($conf->global->MAIN_MAXLIST_OVERLOAD) ? 500 : $conf->global->MAIN_MAXLIST_OVERLOAD;
$maxLatestEditCount = 5;
$maxOpenCount = empty($conf->global->MAIN_MAXLIST_OVERLOAD) ? 500 : $conf->global->MAIN_MAXLIST_OVERLOAD;

/*
* View
*/

llxHeader("", $langs->trans("SupplierInvoicesArea"), 'EN:Suppliers_Invoices|FR:FactureFournisseur|ES:Facturas_de_proveedores');

print load_fiche_titre($langs->trans("SupplierInvoicesArea"), '', 'supplier_invoice');

print '<div class="fichecenter">';

print '<div class="fichethirdleft">';
$tmp = getNumberInvoicesPieChart('suppliers');
if ($tmp) {
    print $tmp;
    print '<br>';
}

$tmp = getDraftSupplierTable($maxDraftCount, $socid);
if ($tmp) {
    print $tmp;
    print '<br>';
}

print '</div>';

print '<div class="fichetwothirdright">';
print '<div class="ficheaddleft">';

$tmp = getPurchaseInvoiceLatestEditTable($maxLatestEditCount, $socid);
if ($tmp) {
    print $tmp;
    print '<br>';
}

$tmp = getPurchaseInvoiceUnpaidOpenTable($max, $socid);
if ($tmp) {
    print $tmp;
    print '<br>';
}

print '</div>';
print '</div>';

print '</div>';

// End of page
llxFooter();
$db->close();
