<?php
/* Copyright (C) 2013-2014 Olivier Geffroy      <jeff@jeffinfo.com>
 * Copyright (C) 2013-2021 Alexandre Spangaro   <aspangaro@open-dsi.fr>
 * Copyright (C) 2014 	   Florian Henry		<florian.henry@open-concept.pro>
 * Copyright (C) 2014 	   Juanjo Menent		<jmenent@2byte.es>
 * Copyright (C) 2015      Ari Elbaz (elarifr)	<github@accedinfo.com>
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
 * \file        htdocs/Modules/Accountancy/admin/productaccount.php
 * \ingroup        Accountancy (Double entries)
 * \brief        To define accounting account on product / service
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

require_once DOL_DOCUMENT_ROOT . '/core/lib/accounting.lib.php';
require_once DOL_DOCUMENT_ROOT . '/core/lib/report.lib.php';
require_once DOL_DOCUMENT_ROOT . '/core/lib/admin.lib.php';
require_once DOL_DOCUMENT_ROOT . '/core/lib/date.lib.php';
require_once DOL_DOCUMENT_ROOT . '/core/class/html.formaccounting.class.php';
require_once DOL_DOCUMENT_ROOT . '/Modules/Accountancy/class/accountingaccount.class.php';
require_once DOL_DOCUMENT_ROOT . '/Modules/Products/class/product.class.php';

// Load translation files required by the page
$langs->loadLangs(["companies", "compta", "accountancy", "products"]);

// Security check
if (empty($conf->accounting->enabled)) {
    accessforbidden();
}
if (!$user->rights->accounting->bind->write) {
    accessforbidden();
}

// search & action GETPOST
$action = GETPOST('action', 'aZ09');
$codeventil_buy = GETPOST('codeventil_buy', 'array');
$codeventil_sell = GETPOST('codeventil_sell', 'array');
$chk_prod = GETPOST('chk_prod', 'array');
$account_number_buy = GETPOST('account_number_buy');
$account_number_sell = GETPOST('account_number_sell');
$changeaccount = GETPOST('changeaccount', 'array');
$changeaccount_buy = GETPOST('changeaccount_buy', 'array');
$changeaccount_sell = GETPOST('changeaccount_sell', 'array');
$search_ref = GETPOST('search_ref', 'alpha');
$search_label = GETPOST('search_label', 'alpha');
$search_desc = GETPOST('search_desc', 'alpha');
$search_vat = GETPOST('search_vat', 'alpha');
$search_current_account = GETPOST('search_current_account', 'alpha');
$search_current_account_valid = GETPOST('search_current_account_valid', 'alpha');
if ($search_current_account_valid == '') {
    $search_current_account_valid = 'withoutvalidaccount';
}
$search_onsell = GETPOST('search_onsell', 'alpha');
$search_onpurchase = GETPOST('search_onpurchase', 'alpha');

$accounting_product_mode = GETPOST('accounting_product_mode', 'alpha');
$btn_changeaccount = GETPOST('changeaccount', 'alpha');
$btn_changetype = GETPOST('changetype', 'alpha');

if (empty($accounting_product_mode)) {
    $accounting_product_mode = 'ACCOUNTANCY_SELL';
}

$limit = GETPOST('limit', 'int') ? GETPOST('limit', 'int') : (empty($conf->global->ACCOUNTING_LIMIT_LIST_VENTILATION) ? $conf->liste_limit : $conf->global->ACCOUNTING_LIMIT_LIST_VENTILATION);
$sortfield = GETPOST("sortfield", 'alpha');
$sortorder = GETPOST("sortorder", 'alpha');
$page = GETPOSTISSET('pageplusone') ? (GETPOST('pageplusone') - 1) : GETPOST("page", 'int');
if (empty($page) || $page == -1) {
    $page = 0;
}     // If $page is not defined, or '' or -1
$offset = $limit * $page;
$pageprev = $page - 1;
$pagenext = $page + 1;
if (!$sortfield) {
    $sortfield = "p.ref";
}
if (!$sortorder) {
    $sortorder = "ASC";
}

if (empty($action)) {
    $action = 'list';
}

$arrayfields = [];

$accounting_product_modes = [
    'ACCOUNTANCY_SELL',
    'ACCOUNTANCY_SELL_INTRA',
    'ACCOUNTANCY_SELL_EXPORT',
    'ACCOUNTANCY_BUY',
    'ACCOUNTANCY_BUY_INTRA',
    'ACCOUNTANCY_BUY_EXPORT',
];

if ($accounting_product_mode == 'ACCOUNTANCY_BUY') {
    $accountancy_field_name = "accountancy_code_buy";
} elseif ($accounting_product_mode == 'ACCOUNTANCY_BUY_INTRA') {
    $accountancy_field_name = "accountancy_code_buy_intra";
} elseif ($accounting_product_mode == 'ACCOUNTANCY_BUY_EXPORT') {
    $accountancy_field_name = "accountancy_code_buy_export";
} elseif ($accounting_product_mode == 'ACCOUNTANCY_SELL') {
    $accountancy_field_name = "accountancy_code_sell";
} elseif ($accounting_product_mode == 'ACCOUNTANCY_SELL_INTRA') {
    $accountancy_field_name = "accountancy_code_sell_intra";
} else { // $accounting_product_mode == 'ACCOUNTANCY_SELL_EXPORT'
    $accountancy_field_name = "accountancy_code_sell_export";
}

/*
 * Actions
 */

if (GETPOST('cancel', 'alpha')) {
    $action = 'list';
    $massaction = '';
}
if (!GETPOST('confirmmassaction', 'alpha') && $massaction != 'presend' && $massaction != 'confirm_presend') {
    $massaction = '';
}

$parameters = [];
$reshook = $hookmanager->executeHooks('doActions', $parameters, $object, $action); // Note that $action and $object may have been modified by some hooks
if ($reshook < 0) {
    setEventMessages($hookmanager->error, $hookmanager->errors, 'errors');
}

// Purge search criteria
if (GETPOST('button_removefilter_x', 'alpha') || GETPOST('button_removefilter.x', 'alpha') || GETPOST('button_removefilter', 'alpha')) { // All test are required to be compatible with all browsers
    $search_ref = '';
    $search_label = '';
    $search_desc = '';
    $search_vat = '';
    $search_onsell = '';
    $search_onpurchase = '';
    $search_current_account = '';
    $search_current_account_valid = '-1';
}

// Sales or Purchase mode ?
if ($action == 'update') {
    if (!empty($btn_changetype)) {
        $error = 0;

        if (in_array($accounting_product_mode, $accounting_product_modes)) {
            if (!dolibarr_set_const($db, 'ACCOUNTING_PRODUCT_MODE', $accounting_product_mode, 'chaine', 0, '', $conf->entity)) {
                $error++;
            }
        } else {
            $error++;
        }
    }

    if (!empty($btn_changeaccount)) {
        //$msg = '<div><span class="accountingprocessing">' . $langs->trans("Processing") . '...</span></div>';
        if (!empty($chk_prod) && in_array($accounting_product_mode, $accounting_product_modes)) {
            $accounting = new AccountingAccount($db);

            //$msg .= '<div><span class="accountingprocessing">' . count($chk_prod) . ' ' . $langs->trans("SelectedLines") . '</span></div>';
            $arrayofdifferentselectedvalues = [];

            $cpt = 0;
            $ok = 0;
            $ko = 0;
            foreach ($chk_prod as $productid) {
                $accounting_account_id = GETPOST('codeventil_' . $productid);

                $result = 0;
                if ($accounting_account_id > 0) {
                    $arrayofdifferentselectedvalues[$accounting_account_id] = $accounting_account_id;
                    $result = $accounting->fetch($accounting_account_id, null, 1);
                }
                if ($result <= 0) {
                    // setEventMessages(null, $accounting->errors, 'errors');
                    $msg .= '<div><span style="color:red">' . $langs->trans("ErrorDB") . ' : ' . $langs->trans("Product") . ' ' . $productid . ' ' . $langs->trans("NotVentilatedinAccount") . ' : id=' . $accounting_account_id . '<br> <pre>' . $sql . '</pre></span></div>';
                    $ko++;
                } else {
                    $db->begin();

                    if (!empty($conf->global->MAIN_PRODUCT_PERENTITY_SHARED)) {
                        $sql = "INSERT INTO " . MAIN_DB_PREFIX . "product_perentity (fk_product, entity, '" . $db->escape($accountancy_field_name) . "')";
                        $sql .= " VALUES (" . ((int) $productid) . ", " . ((int) $conf->entity) . ", '" . $db->escape($accounting->account_number) . "')";
                        $sql .= " ON DUPLICATE KEY UPDATE " . $accountancy_field_name . " = '" . $db->escape($accounting->account_number) . "'";
                    } else {
                        $sql = " UPDATE " . MAIN_DB_PREFIX . "product";
                        $sql .= " SET " . $accountancy_field_name . " = '" . $db->escape($accounting->account_number) . "'";
                        $sql .= " WHERE rowid = " . ((int) $productid);
                    }

                    dol_syslog("/Modules/Accountancy/admin/productaccount.php", LOG_DEBUG);
                    if ($db->query($sql)) {
                        $ok++;
                        $db->commit();
                    } else {
                        $ko++;
                        $db->rollback();
                    }
                }

                $cpt++;
            }
        }

        if ($ko) {
            setEventMessages($langs->trans("XLineFailedToBeBinded", $ko), null, 'errors');
        }
        if ($ok) {
            setEventMessages($langs->trans("XLineSuccessfullyBinded", $ok), null, 'mesgs');
        }
    }
}

/*
 * View
 */

$form = new FormAccounting($db);

// Default AccountingAccount RowId Product / Service
// at this time ACCOUNTING_SERVICE_SOLD_ACCOUNT & ACCOUNTING_PRODUCT_SOLD_ACCOUNT are account number not accountingacount rowid
// so we need to get those the rowid of those default value first
$accounting = new AccountingAccount($db);
// TODO: we should need to check if result is already exists accountaccount rowid.....
$aarowid_servbuy = $accounting->fetch('', $conf->global->ACCOUNTING_SERVICE_BUY_ACCOUNT, 1);
$aarowid_servbuy_intra = $accounting->fetch('', $conf->global->ACCOUNTING_SERVICE_BUY_INTRA_ACCOUNT, 1);
$aarowid_servbuy_export = $accounting->fetch('', $conf->global->ACCOUNTING_SERVICE_BUY_EXPORT_ACCOUNT, 1);
$aarowid_prodbuy = $accounting->fetch('', $conf->global->ACCOUNTING_PRODUCT_BUY_ACCOUNT, 1);
$aarowid_prodbuy_intra = $accounting->fetch('', $conf->global->ACCOUNTING_PRODUCT_BUY_INTRA_ACCOUNT, 1);
$aarowid_prodbuy_export = $accounting->fetch('', $conf->global->ACCOUNTING_PRODUCT_BUY_EXPORT_ACCOUNT, 1);
$aarowid_servsell = $accounting->fetch('', $conf->global->ACCOUNTING_SERVICE_SOLD_ACCOUNT, 1);
$aarowid_servsell_intra = $accounting->fetch('', $conf->global->ACCOUNTING_SERVICE_SOLD_INTRA_ACCOUNT, 1);
$aarowid_servsell_export = $accounting->fetch('', $conf->global->ACCOUNTING_SERVICE_SOLD_EXPORT_ACCOUNT, 1);
$aarowid_prodsell = $accounting->fetch('', $conf->global->ACCOUNTING_PRODUCT_SOLD_ACCOUNT, 1);
$aarowid_prodsell_intra = $accounting->fetch('', $conf->global->ACCOUNTING_PRODUCT_SOLD_INTRA_ACCOUNT, 1);
$aarowid_prodsell_export = $accounting->fetch('', $conf->global->ACCOUNTING_PRODUCT_SOLD_EXPORT_ACCOUNT, 1);

$aacompta_servbuy = (!empty($conf->global->ACCOUNTING_SERVICE_BUY_ACCOUNT) ? $conf->global->ACCOUNTING_SERVICE_BUY_ACCOUNT : $langs->trans("CodeNotDef"));
$aacompta_servbuy_intra = (!empty($conf->global->ACCOUNTING_SERVICE_BUY_INTRA_ACCOUNT) ? $conf->global->ACCOUNTING_SERVICE_BUY_INTRA_ACCOUNT : $langs->trans("CodeNotDef"));
$aacompta_servbuy_export = (!empty($conf->global->ACCOUNTING_SERVICE_BUY_EXPORT_ACCOUNT) ? $conf->global->ACCOUNTING_SERVICE_BUY_EXPORT_ACCOUNT : $langs->trans("CodeNotDef"));
$aacompta_prodbuy = (!empty($conf->global->ACCOUNTING_PRODUCT_BUY_ACCOUNT) ? $conf->global->ACCOUNTING_PRODUCT_BUY_ACCOUNT : $langs->trans("CodeNotDef"));
$aacompta_prodbuy_intra = (!empty($conf->global->ACCOUNTING_PRODUCT_BUY_INTRA_ACCOUNT) ? $conf->global->ACCOUNTING_PRODUCT_BUY_INTRA_ACCOUNT : $langs->trans("CodeNotDef"));
$aacompta_prodbuy_export = (!empty($conf->global->ACCOUNTING_PRODUCT_BUY_EXPORT_ACCOUNT) ? $conf->global->ACCOUNTING_PRODUCT_BUY_EXPORT_ACCOUNT : $langs->trans("CodeNotDef"));
$aacompta_servsell = (!empty($conf->global->ACCOUNTING_SERVICE_SOLD_ACCOUNT) ? $conf->global->ACCOUNTING_SERVICE_SOLD_ACCOUNT : $langs->trans("CodeNotDef"));
$aacompta_servsell_intra = (!empty($conf->global->ACCOUNTING_SERVICE_SOLD_INTRA_ACCOUNT) ? $conf->global->ACCOUNTING_SERVICE_SOLD_INTRA_ACCOUNT : $langs->trans("CodeNotDef"));
$aacompta_servsell_export = (!empty($conf->global->ACCOUNTING_SERVICE_SOLD_EXPORT_ACCOUNT) ? $conf->global->ACCOUNTING_SERVICE_SOLD_EXPORT_ACCOUNT : $langs->trans("CodeNotDef"));
$aacompta_prodsell = (!empty($conf->global->ACCOUNTING_PRODUCT_SOLD_ACCOUNT) ? $conf->global->ACCOUNTING_PRODUCT_SOLD_ACCOUNT : $langs->trans("CodeNotDef"));
$aacompta_prodsell_intra = (!empty($conf->global->ACCOUNTING_PRODUCT_SOLD_INTRA_ACCOUNT) ? $conf->global->ACCOUNTING_PRODUCT_SOLD_INTRA_ACCOUNT : $langs->trans("CodeNotDef"));
$aacompta_prodsell_export = (!empty($conf->global->ACCOUNTING_PRODUCT_SOLD_EXPORT_ACCOUNT) ? $conf->global->ACCOUNTING_PRODUCT_SOLD_EXPORT_ACCOUNT : $langs->trans("CodeNotDef"));

llxHeader('', $langs->trans("ProductsBinding"));

$pcgverid = $conf->global->CHARTOFACCOUNTS;
$pcgvercode = dol_getIdFromCode($db, $pcgverid, 'accounting_system', 'rowid', 'pcg_version');
if (empty($pcgvercode)) {
    $pcgvercode = $pcgverid;
}

$sql = "SELECT p.rowid, p.ref, p.label, p.description, p.tosell, p.tobuy, p.tva_tx,";
if (!empty($conf->global->MAIN_PRODUCT_PERENTITY_SHARED)) {
    $sql .= " ppe.accountancy_code_sell, ppe.accountancy_code_sell_intra, ppe.accountancy_code_sell_export,";
    $sql .= " ppe.accountancy_code_buy, ppe.accountancy_code_buy_intra, ppe.accountancy_code_buy_export,";
} else {
    $sql .= " p.accountancy_code_sell, p.accountancy_code_sell_intra, p.accountancy_code_sell_export,";
    $sql .= " p.accountancy_code_buy, p.accountancy_code_buy_intra, p.accountancy_code_buy_export,";
}
$sql .= " p.tms, p.fk_product_type as product_type,";
$sql .= " aa.rowid as aaid";
$sql .= " FROM " . MAIN_DB_PREFIX . "product as p";
if (!empty($conf->global->MAIN_PRODUCT_PERENTITY_SHARED)) {
    $sql .= " LEFT JOIN " . MAIN_DB_PREFIX . "product_perentity as ppe ON ppe.fk_product = p.rowid AND ppe.entity = " . ((int) $conf->entity);
    $sql .= " LEFT JOIN " . MAIN_DB_PREFIX . "accounting_account as aa ON aa.account_number = ppe." . $accountancy_field_name . " AND aa.fk_pcg_version = '" . $db->escape($pcgvercode) . "'";
} else {
    $sql .= " LEFT JOIN " . MAIN_DB_PREFIX . "accounting_account as aa ON aa.account_number = p." . $accountancy_field_name . " AND aa.fk_pcg_version = '" . $db->escape($pcgvercode) . "'";
}
$sql .= ' WHERE p.entity IN (' . getEntity('product') . ')';
if (strlen(trim($search_current_account))) {
    $sql .= natural_search((empty($conf->global->MAIN_PRODUCT_PERENTITY_SHARED) ? "p." : "ppe.") . $accountancy_field_name, $search_current_account);
}
if ($search_current_account_valid == 'withoutvalidaccount') {
    $sql .= " AND aa.account_number IS NULL";
}
if ($search_current_account_valid == 'withvalidaccount') {
    $sql .= " AND aa.account_number IS NOT NULL";
}
// Add search filter like
if (strlen(trim($search_ref))) {
    $sql .= natural_search("p.ref", $search_ref);
}
if (strlen(trim($search_label))) {
    $sql .= natural_search("p.label", $search_label);
}
if (strlen(trim($search_desc))) {
    $sql .= natural_search("p.description", $search_desc);
}
if (strlen(trim($search_vat))) {
    $sql .= natural_search("p.tva_tx", price2num($search_vat), 1);
}
if ($search_onsell != '' && $search_onsell != '-1') {
    $sql .= natural_search('p.tosell', $search_onsell, 1);
}
if ($search_onpurchase != '' && $search_onpurchase != '-1') {
    $sql .= natural_search('p.tobuy', $search_onpurchase, 1);
}

$sql .= $db->order($sortfield, $sortorder);

$nbtotalofrecords = '';
if (empty($conf->global->MAIN_DISABLE_FULL_SCANLIST)) {
    $result = $db->query($sql);
    $nbtotalofrecords = $db->num_rows($result);
    if (($page * $limit) > $nbtotalofrecords) {    // if total resultset is smaller then paging size (filtering), goto and load page 0
        $page = 0;
        $offset = 0;
    }
}

$sql .= $db->plimit($limit + 1, $offset);

dol_syslog("/Modules/Accountancy/admin/productaccount.php", LOG_DEBUG);
$result = $db->query($sql);
if ($result) {
    $num = $db->num_rows($result);
    $i = 0;

    $param = '';
    if (!empty($contextpage) && $contextpage != $_SERVER["PHP_SELF"]) {
        $param .= '&contextpage=' . urlencode($contextpage);
    }
    if ($limit > 0 && $limit != $conf->liste_limit) {
        $param .= '&limit=' . urlencode($limit);
    }
    if ($search_ref > 0) {
        $param .= "&search_desc=" . urlencode($search_ref);
    }
    if ($search_label > 0) {
        $param .= "&search_desc=" . urlencode($search_label);
    }
    if ($search_desc > 0) {
        $param .= "&search_desc=" . urlencode($search_desc);
    }
    if ($search_vat > 0) {
        $param .= '&search_vat=' . urlencode($search_vat);
    }
    if ($search_current_account > 0) {
        $param .= "&search_current_account=" . urlencode($search_current_account);
    }
    if ($search_current_account_valid && $search_current_account_valid != '-1') {
        $param .= "&search_current_account_valid=" . urlencode($search_current_account_valid);
    }
    if ($accounting_product_mode) {
        $param .= '&accounting_product_mode=' . urlencode($accounting_product_mode);
    }

    print '<form action="' . $_SERVER["PHP_SELF"] . '" method="post">';
    if ($optioncss != '') {
        print '<input type="hidden" name="optioncss" value="' . $optioncss . '">';
    }
    print '<input type="hidden" name="token" value="' . newToken() . '">';
    print '<input type="hidden" name="formfilteraction" id="formfilteraction" value="list">';
    print '<input type="hidden" name="action" value="update">';
    print '<input type="hidden" name="sortfield" value="' . $sortfield . '">';
    print '<input type="hidden" name="sortorder" value="' . $sortorder . '">';

    print load_fiche_titre($langs->trans("ProductsBinding"), '', 'title_accountancy');
    print '<br>';

    print '<span class="opacitymedium">' . $langs->trans("InitAccountancyDesc") . '</span><br>';
    print '<br>';

    // Select mode
    print '<table class="noborder centpercent">';
    print '<tr class="liste_titre">';
    print '<td>' . $langs->trans('Options') . '</td><td>' . $langs->trans('Description') . '</td>';
    print "</tr>\n";
    print '<tr class="oddeven"><td><input type="radio" name="accounting_product_mode" value="ACCOUNTANCY_SELL"' . ($accounting_product_mode == 'ACCOUNTANCY_SELL' ? ' checked' : '') . '> ' . $langs->trans('OptionModeProductSell') . '</td>';
    print '<td>' . $langs->trans('OptionModeProductSellDesc');
    print "</td></tr>\n";
    if ($mysoc->isInEEC()) {
        print '<tr class="oddeven"><td><input type="radio" name="accounting_product_mode" value="ACCOUNTANCY_SELL_INTRA"' . ($accounting_product_mode == 'ACCOUNTANCY_SELL_INTRA' ? ' checked' : '') . '> ' . $langs->trans('OptionModeProductSellIntra') . '</td>';
        print '<td>' . $langs->trans('OptionModeProductSellIntraDesc');
        print "</td></tr>\n";
    }
    print '<tr class="oddeven"><td><input type="radio" name="accounting_product_mode" value="ACCOUNTANCY_SELL_EXPORT"' . ($accounting_product_mode == 'ACCOUNTANCY_SELL_EXPORT' ? ' checked' : '') . '> ' . $langs->trans('OptionModeProductSellExport') . '</td>';
    print '<td>' . $langs->trans('OptionModeProductSellExportDesc');
    print "</td></tr>\n";
    print '<tr class="oddeven"><td><input type="radio" name="accounting_product_mode" value="ACCOUNTANCY_BUY"' . ($accounting_product_mode == 'ACCOUNTANCY_BUY' ? ' checked' : '') . '> ' . $langs->trans('OptionModeProductBuy') . '</td>';
    print '<td>' . $langs->trans('OptionModeProductBuyDesc') . "</td></tr>\n";
    if ($mysoc->isInEEC()) {
        print '<tr class="oddeven"><td><input type="radio" name="accounting_product_mode" value="ACCOUNTANCY_BUY_INTRA"' . ($accounting_product_mode == 'ACCOUNTANCY_BUY_INTRA' ? ' checked' : '') . '> ' . $langs->trans('OptionModeProductBuyIntra') . '</td>';
        print '<td>' . $langs->trans('OptionModeProductBuyDesc') . "</td></tr>\n";
    }
    print '<tr class="oddeven"><td><input type="radio" name="accounting_product_mode" value="ACCOUNTANCY_BUY_EXPORT"' . ($accounting_product_mode == 'ACCOUNTANCY_BUY_EXPORT' ? ' checked' : '') . '> ' . $langs->trans('OptionModeProductBuyExport') . '</td>';
    print '<td>' . $langs->trans('OptionModeProductBuyDesc') . "</td></tr>\n";
    print "</table>\n";

    print '<div class="center"><input type="submit" class="button" value="' . $langs->trans('Refresh') . '" name="changetype"></div>';

    print "<br>\n";

    // Filter on categories
    $moreforfilter = '';
    $varpage = empty($contextpage) ? $_SERVER["PHP_SELF"] : $contextpage;
    $selectedfields = $form->multiSelectArrayWithCheckbox('selectedfields', $arrayfields, $varpage); // This also change content of $arrayfields

    $buttonsave = '<input type="submit" class="button button-save" id="changeaccount" name="changeaccount" value="' . $langs->trans("Save") . '">';
    //print '<br><div class="center">'.$buttonsave.'</div>';

    $texte = $langs->trans("ListOfProductsServices");
    print_barre_liste($texte, $page, $_SERVER["PHP_SELF"], $param, $sortfield, $sortorder, $buttonsave, $num, $nbtotalofrecords, '', 0, '', '', $limit, 0, 0, 1);

    print '<div class="div-table-responsive">';
    print '<table class="liste ' . ($moreforfilter ? "listwithfilterbefore" : "") . '">';

    print '<tr class="liste_titre_filter">';
    print '<td class="liste_titre"><input type="text" class="flat" size="8" name="search_ref" value="' . dol_escape_htmltag($search_ref) . '"></td>';
    print '<td class="liste_titre"><input type="text" class="flat" size="10" name="search_label" value="' . dol_escape_htmltag($search_label) . '"></td>';
    print '<td class="liste_titre right"><input type="text" class="flat maxwidth50 right" size="5" name="search_vat" placeholder="%" value="' . dol_escape_htmltag($search_vat) . '"></td>';

    if (!empty($conf->global->ACCOUNTANCY_SHOW_PROD_DESC)) {
        print '<td class="liste_titre"><input type="text" class="flat" size="20" name="search_desc" value="' . dol_escape_htmltag($search_desc) . '"></td>';
    }
    // On sell
    if ($accounting_product_mode == 'ACCOUNTANCY_SELL' || $accounting_product_mode == 'ACCOUNTANCY_SELL_INTRA' || $accounting_product_mode == 'ACCOUNTANCY_SELL_EXPORT') {
        print '<td class="liste_titre center">' . $form->selectyesno('search_onsell', $search_onsell, 1, false, 1) . '</td>';
    } else {
        // On buy
        print '<td class="liste_titre center">' . $form->selectyesno('search_onpurchase', $search_onpurchase, 1, false, 1) . '</td>';
    }
    // Current account
    print '<td class="liste_titre">';
    print '<input type="text" class="flat" size="6" name="search_current_account" id="search_current_account" value="' . dol_escape_htmltag($search_current_account) . '">';
    $listofvals = ['withoutvalidaccount' => $langs->trans("WithoutValidAccount"), 'withvalidaccount' => $langs->trans("WithValidAccount")];
    print ' ' . $langs->trans("or") . ' ' . $form->selectarray('search_current_account_valid', $listofvals, $search_current_account_valid, 1);
    print '</td>';
    print '<td class="liste_titre">&nbsp;</td>';
    print '<td class="center liste_titre">';
    $searchpicto = $form->showFilterButtons();
    print $searchpicto;
    print '</td>';
    print '</tr>';

    print '<tr class="liste_titre">';
    print_liste_field_titre("Ref", $_SERVER["PHP_SELF"], "p.ref", "", $param, '', $sortfield, $sortorder);
    print_liste_field_titre("Label", $_SERVER["PHP_SELF"], "p.label", "", $param, '', $sortfield, $sortorder);
    if (!empty($conf->global->ACCOUNTANCY_SHOW_PROD_DESC)) {
        print_liste_field_titre("Description", $_SERVER["PHP_SELF"], "p.description", "", $param, '', $sortfield, $sortorder);
    }
    print_liste_field_titre("VATRate", $_SERVER["PHP_SELF"], "p.tva_tx", "", $param, '', $sortfield, $sortorder, 'right ');
    // On sell / On purchase
    if ($accounting_product_mode == 'ACCOUNTANCY_SELL' || $accounting_product_mode == 'ACCOUNTANCY_SELL_INTRA' || $accounting_product_mode == 'ACCOUNTANCY_SELL_EXPORT') {
        print_liste_field_titre("OnSell", $_SERVER["PHP_SELF"], "p.tosell", "", $param, '', $sortfield, $sortorder, 'center ');
    } else {
        print_liste_field_titre("OnBuy", $_SERVER["PHP_SELF"], "p.tobuy", "", $param, '', $sortfield, $sortorder, 'center ');
    }
    print_liste_field_titre("CurrentDedicatedAccountingAccount", $_SERVER["PHP_SELF"], (empty($conf->global->MAIN_PRODUCT_PERENTITY_SHARED) ? "p." : "ppe.") . $accountancy_field_name, "", $param, '', $sortfield, $sortorder);
    print_liste_field_titre("AssignDedicatedAccountingAccount");
    $clickpitco = $form->showCheckAddButtons('checkforselect', 1);
    print_liste_field_titre($clickpitco, '', '', '', '', '', '', '', 'center ');
    print '</tr>';

    $product_static = new Product($db);

    $i = 0;
    while ($i < min($num, $limit)) {
        $obj = $db->fetch_object($result);

        // Ref produit as link
        $product_static->ref = $obj->ref;
        $product_static->id = $obj->rowid;
        $product_static->type = $obj->product_type;
        $product_static->label = $obj->label;
        $product_static->description = $obj->description;
        $product_static->status = $obj->tosell;
        $product_static->status_buy = $obj->tobuy;

        // Sales
        if ($obj->product_type == 0) {
            if ($accounting_product_mode == 'ACCOUNTANCY_SELL') {
                $compta_prodsell = (!empty($conf->global->ACCOUNTING_PRODUCT_SOLD_ACCOUNT) ? $conf->global->ACCOUNTING_PRODUCT_SOLD_ACCOUNT : $langs->trans("CodeNotDef"));
                $compta_prodsell_id = $aarowid_prodsell;
            } elseif ($accounting_product_mode == 'ACCOUNTANCY_SELL_INTRA') {
                $compta_prodsell = (!empty($conf->global->ACCOUNTING_PRODUCT_SOLD_INTRA_ACCOUNT) ? $conf->global->ACCOUNTING_PRODUCT_SOLD_INTRA_ACCOUNT : $langs->trans("CodeNotDef"));
                $compta_prodsell_id = $aarowid_prodsell_intra;
            } elseif ($accounting_product_mode == 'ACCOUNTANCY_SELL_EXPORT') {
                $compta_prodsell = (!empty($conf->global->ACCOUNTING_PRODUCT_SOLD_EXPORT_ACCOUNT) ? $conf->global->ACCOUNTING_PRODUCT_SOLD_EXPORT_ACCOUNT : $langs->trans("CodeNotDef"));
                $compta_prodsell_id = $aarowid_prodsell_export;
            } else {
                $compta_prodsell = (!empty($conf->global->ACCOUNTING_PRODUCT_SOLD_ACCOUNT) ? $conf->global->ACCOUNTING_PRODUCT_SOLD_ACCOUNT : $langs->trans("CodeNotDef"));
                $compta_prodsell_id = $aarowid_prodsell;
            }
        } else {
            if ($accounting_product_mode == 'ACCOUNTANCY_SELL') {
                $compta_prodsell = (!empty($conf->global->ACCOUNTING_SERVICE_SOLD_ACCOUNT) ? $conf->global->ACCOUNTING_SERVICE_SOLD_ACCOUNT : $langs->trans("CodeNotDef"));
                $compta_prodsell_id = $aarowid_servsell;
            } elseif ($accounting_product_mode == 'ACCOUNTANCY_SELL_INTRA') {
                $compta_prodsell = (!empty($conf->global->ACCOUNTING_SERVICE_SOLD_INTRA_ACCOUNT) ? $conf->global->ACCOUNTING_SERVICE_SOLD_INTRA_ACCOUNT : $langs->trans("CodeNotDef"));
                $compta_prodsell_id = $aarowid_servsell_intra;
            } elseif ($accounting_product_mode == 'ACCOUNTANCY_SELL_EXPORT') {
                $compta_prodsell = (!empty($conf->global->ACCOUNTING_SERVICE_SOLD_EXPORT_ACCOUNT) ? $conf->global->ACCOUNTING_SERVICE_SOLD_EXPORT_ACCOUNT : $langs->trans("CodeNotDef"));
                $compta_prodsell_id = $aarowid_servsell_export;
            } else {
                $compta_prodsell = (!empty($conf->global->ACCOUNTING_SERVICE_SOLD_ACCOUNT) ? $conf->global->ACCOUNTING_SERVICE_SOLD_ACCOUNT : $langs->trans("CodeNotDef"));
                $compta_prodsell_id = $aarowid_servsell;
            }
        }

        // Purchases
        if ($obj->product_type == 0) {
            if ($accounting_product_mode == 'ACCOUNTANCY_BUY') {
                $compta_prodbuy = (!empty($conf->global->ACCOUNTING_PRODUCT_BUY_ACCOUNT) ? $conf->global->ACCOUNTING_PRODUCT_BUY_ACCOUNT : $langs->trans("CodeNotDef"));
                $compta_prodbuy_id = $aarowid_prodbuy;
            } elseif ($accounting_product_mode == 'ACCOUNTANCY_BUY_INTRA') {
                $compta_prodbuy = (!empty($conf->global->ACCOUNTING_PRODUCT_BUY_INTRA_ACCOUNT) ? $conf->global->ACCOUNTING_PRODUCT_BUY_INTRA_ACCOUNT : $langs->trans("CodeNotDef"));
                $compta_prodbuy_id = $aarowid_prodbuy_intra;
            } elseif ($accounting_product_mode == 'ACCOUNTANCY_BUY_EXPORT') {
                $compta_prodbuy = (!empty($conf->global->ACCOUNTING_PRODUCT_BUY_EXPORT_ACCOUNT) ? $conf->global->ACCOUNTING_PRODUCT_BUY_EXPORT_ACCOUNT : $langs->trans("CodeNotDef"));
                $compta_prodbuy_id = $aarowid_prodbuy_export;
            } else {
                $compta_prodbuy = (!empty($conf->global->ACCOUNTING_PRODUCT_BUY_ACCOUNT) ? $conf->global->ACCOUNTING_PRODUCT_BUY_ACCOUNT : $langs->trans("CodeNotDef"));
                $compta_prodbuy_id = $aarowid_prodbuy;
            }
        } else {
            if ($accounting_product_mode == 'ACCOUNTANCY_BUY') {
                $compta_prodbuy = (!empty($conf->global->ACCOUNTING_SERVICE_BUY_ACCOUNT) ? $conf->global->ACCOUNTING_SERVICE_BUY_ACCOUNT : $langs->trans("CodeNotDef"));
                $compta_prodbuy_id = $aarowid_servbuy;
            } elseif ($accounting_product_mode == 'ACCOUNTANCY_BUY_INTRA') {
                $compta_prodbuy = (!empty($conf->global->ACCOUNTING_SERVICE_BUY_INTRA_ACCOUNT) ? $conf->global->ACCOUNTING_SERVICE_BUY_INTRA_ACCOUNT : $langs->trans("CodeNotDef"));
                $compta_prodbuy_id = $aarowid_servbuy_intra;
            } elseif ($accounting_product_mode == 'ACCOUNTANCY_BUY_EXPORT') {
                $compta_prodbuy = (!empty($conf->global->ACCOUNTING_SERVICE_BUY_EXPORT_ACCOUNT) ? $conf->global->ACCOUNTING_SERVICE_BUY_EXPORT_ACCOUNT : $langs->trans("CodeNotDef"));
                $compta_prodbuy_id = $aarowid_servbuy_export;
            } else {
                $compta_prodbuy = (!empty($conf->global->ACCOUNTING_SERVICE_BUY_ACCOUNT) ? $conf->global->ACCOUNTING_SERVICE_BUY_ACCOUNT : $langs->trans("CodeNotDef"));
                $compta_prodbuy_id = $aarowid_servbuy;
            }
        }

        print '<tr class="oddeven">';

        print '<td>';
        print $product_static->getNomUrl(1);
        print '</td>';

        print '<td class="left">' . $obj->label . '</td>';

        if (!empty($conf->global->ACCOUNTANCY_SHOW_PROD_DESC)) {
            // TODO ADJUST DESCRIPTION SIZE
            // print '<td class="left">' . $obj->description . '</td>';
            // TODO: we should set a user defined value to adjust user square / wide screen size
            $trunclength = empty($conf->global->ACCOUNTING_LENGTH_DESCRIPTION) ? 32 : $conf->global->ACCOUNTING_LENGTH_DESCRIPTION;
            print '<td>' . nl2br(dol_trunc($obj->description, $trunclength)) . '</td>';
        }

        // VAT
        print '<td class="right">';
        print vatrate($obj->tva_tx);
        print '</td>';

        // On sell / On purchase
        if ($accounting_product_mode == 'ACCOUNTANCY_SELL' || $accounting_product_mode == 'ACCOUNTANCY_SELL_INTRA' || $accounting_product_mode == 'ACCOUNTANCY_SELL_EXPORT') {
            print '<td class="center">' . $product_static->getLibStatut(3, 0) . '</td>';
        } else {
            print '<td class="center">' . $product_static->getLibStatut(3, 1) . '</td>';
        }

        // Current accounting account
        print '<td class="left">';
        if ($accounting_product_mode == 'ACCOUNTANCY_BUY') {
            print length_accountg($obj->accountancy_code_buy);
            if ($obj->accountancy_code_buy && empty($obj->aaid)) {
                print ' ' . img_warning($langs->trans("ValueNotIntoChartOfAccount"));
            }
        } elseif ($accounting_product_mode == 'ACCOUNTANCY_BUY_INTRA') {
            print length_accountg($obj->accountancy_code_buy_intra);
            if ($obj->accountancy_code_buy_intra && empty($obj->aaid)) {
                print ' ' . img_warning($langs->trans("ValueNotIntoChartOfAccount"));
            }
        } elseif ($accounting_product_mode == 'ACCOUNTANCY_BUY_EXPORT') {
            print length_accountg($obj->accountancy_code_buy_export);
            if ($obj->accountancy_code_buy_export && empty($obj->aaid)) {
                print ' ' . img_warning($langs->trans("ValueNotIntoChartOfAccount"));
            }
        } elseif ($accounting_product_mode == 'ACCOUNTANCY_SELL') {
            print length_accountg($obj->accountancy_code_sell);
            if ($obj->accountancy_code_sell && empty($obj->aaid)) {
                print ' ' . img_warning($langs->trans("ValueNotIntoChartOfAccount"));
            }
        } elseif ($accounting_product_mode == 'ACCOUNTANCY_SELL_INTRA') {
            print length_accountg($obj->accountancy_code_sell_intra);
            if ($obj->accountancy_code_sell_intra && empty($obj->aaid)) {
                print ' ' . img_warning($langs->trans("ValueNotIntoChartOfAccount"));
            }
        } else {
            print length_accountg($obj->accountancy_code_sell_export);
            if ($obj->accountancy_code_sell_export && empty($obj->aaid)) {
                print ' ' . img_warning($langs->trans("ValueNotIntoChartOfAccount"));
            }
        }
        print '</td>';

        // New account to set
        $defaultvalue = '';
        if ($accounting_product_mode == 'ACCOUNTANCY_BUY') {
            // Accounting account buy
            print '<td class="left">';
            //$defaultvalue=GETPOST('codeventil_' . $product_static->id,'alpha');        This is id and we need a code
            if (empty($defaultvalue)) {
                $defaultvalue = $compta_prodbuy;
            }
            $codesell = length_accountg($obj->accountancy_code_buy);
            if (!empty($obj->aaid)) {
                $defaultvalue = ''; // Do not suggest default new value is code is already valid
            }
            print $form->select_account($defaultvalue, 'codeventil_' . $product_static->id, 1, [], 1, 0, 'maxwidth300 maxwidthonsmartphone productforselect');
            print '</td>';
        } elseif ($accounting_product_mode == 'ACCOUNTANCY_BUY_INTRA') {
            // Accounting account buy intra (In EEC)
            print '<td class="left">';
            //$defaultvalue=GETPOST('codeventil_' . $product_static->id,'alpha');        This is id and we need a code
            if (empty($defaultvalue)) {
                $defaultvalue = $compta_prodbuy;
            }
            $codesell = length_accountg($obj->accountancy_code_buy_intra);
            //var_dump($defaultvalue.' - '.$codesell.' - '.$compta_prodsell);
            if (!empty($obj->aaid)) {
                $defaultvalue = ''; // Do not suggest default new value is code is already valid
            }
            print $form->select_account($defaultvalue, 'codeventil_' . $product_static->id, 1, [], 1, 0, 'maxwidth300 maxwidthonsmartphone productforselect');
            print '</td>';
        } elseif ($accounting_product_mode == 'ACCOUNTANCY_BUY_EXPORT') {
            // Accounting account buy export (Out of EEC)
            print '<td class="left">';
            //$defaultvalue=GETPOST('codeventil_' . $product_static->id,'alpha');        This is id and we need a code
            if (empty($defaultvalue)) {
                $defaultvalue = $compta_prodbuy;
            }
            $codesell = length_accountg($obj->accountancy_code_buy_export);
            //var_dump($defaultvalue.' - '.$codesell.' - '.$compta_prodsell);
            if (!empty($obj->aaid)) {
                $defaultvalue = ''; // Do not suggest default new value is code is already valid
            }
            print $form->select_account($defaultvalue, 'codeventil_' . $product_static->id, 1, [], 1, 0, 'maxwidth300 maxwidthonsmartphone productforselect');
            print '</td>';
        } elseif ($accounting_product_mode == 'ACCOUNTANCY_SELL') {
            // Accounting account sell
            print '<td class="left">';
            //$defaultvalue=GETPOST('codeventil_' . $product_static->id,'alpha');        This is id and we need a code
            if (empty($defaultvalue)) {
                $defaultvalue = $compta_prodsell;
            }
            $codesell = length_accountg($obj->accountancy_code_sell);
            //var_dump($defaultvalue.' - '.$codesell.' - '.$compta_prodsell);
            if (!empty($obj->aaid)) {
                $defaultvalue = ''; // Do not suggest default new value is code is already valid
            }
            print $form->select_account($defaultvalue, 'codeventil_' . $product_static->id, 1, [], 1, 0, 'maxwidth300 maxwidthonsmartphone productforselect');
            print '</td>';
        } elseif ($accounting_product_mode == 'ACCOUNTANCY_SELL_INTRA') {
            // Accounting account sell intra (In EEC)
            print '<td class="left">';
            //$defaultvalue=GETPOST('codeventil_' . $product_static->id,'alpha');        This is id and we need a code
            if (empty($defaultvalue)) {
                $defaultvalue = $compta_prodsell;
            }
            $codesell = length_accountg($obj->accountancy_code_sell_intra);
            //var_dump($defaultvalue.' - '.$codesell.' - '.$compta_prodsell);
            if (!empty($obj->aaid)) {
                $defaultvalue = ''; // Do not suggest default new value is code is already valid
            }
            print $form->select_account($defaultvalue, 'codeventil_' . $product_static->id, 1, [], 1, 0, 'maxwidth300 maxwidthonsmartphone productforselect');
            print '</td>';
        } else {
            // Accounting account sell export (Out of EEC)
            print '<td class="left">';
            //$defaultvalue=GETPOST('codeventil_' . $product_static->id,'alpha');        This is id and we need a code
            if (empty($defaultvalue)) {
                $defaultvalue = $compta_prodsell;
            }
            $codesell = length_accountg($obj->accountancy_code_sell_export);
            if (!empty($obj->aaid)) {
                $defaultvalue = ''; // Do not suggest default new value is code is already valid
            }
            print $form->select_account($defaultvalue, 'codeventil_' . $product_static->id, 1, [], 1, 0, 'maxwidth300 maxwidthonsmartphone productforselect');
            print '</td>';
        }

        // Checkbox select
        print '<td class="center">';
        print '<input type="checkbox" class="checkforselect productforselectcodeventil_' . $product_static->id . '" name="chk_prod[]" value="' . $obj->rowid . '"/></td>';
        print "</tr>";
        $i++;
    }
    print '</table>';
    print '</div>';

    print '<script type="text/javascript" language="javascript">
        jQuery(document).ready(function() {
        	function init_savebutton()
        	{
	            console.log("We check if at least one line is checked")

    			atleastoneselected=0;
	    		jQuery(".checkforselect").each(function( index ) {
	  				/* console.log( index + ": " + $( this ).text() ); */
	  				if ($(this).is(\':checked\')) atleastoneselected++;
	  			});

	            if (atleastoneselected) jQuery("#changeaccount").removeAttr(\'disabled\');
	            else jQuery("#changeaccount").attr(\'disabled\',\'disabled\');
	            if (atleastoneselected) jQuery("#changeaccount").attr(\'class\',\'button\');
	            else jQuery("#changeaccount").attr(\'class\',\'button\');
        	}

        	jQuery(".checkforselect").change(function() {
        		init_savebutton();
        	});
        	jQuery(".productforselect").change(function() {
				console.log($(this).attr("id")+" "+$(this).val());
				if ($(this).val() && $(this).val() != -1) {
					$(".productforselect"+$(this).attr("id")).prop(\'checked\', true);
				} else {
					$(".productforselect"+$(this).attr("id")).prop(\'checked\', false);
				}
        		init_savebutton();
        	});

        	init_savebutton();

            jQuery("#search_current_account").keyup(function() {
        		if (jQuery("#search_current_account").val() != \'\')
                {
                    console.log("We set a value of account to search "+jQuery("#search_current_account").val()+", so we disable the other search criteria on account");
                    jQuery("#search_current_account_valid").val(-1);
                }
        	});
        });
        </script>';

    print '</form>';

    $db->free($result);
} else {
    dol_print_error($db);
}

// End of page
llxFooter();
$db->close();
