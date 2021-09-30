<?php
/* Copyright (C) 2001-2006 Rodolphe Quiedeville <rodolphe@quiedeville.org>
 * Copyright (C) 2004-2018 Laurent Destailleur  <eldy@users.sourceforge.net>
 * Copyright (C) 2005-2012 Regis Houssin        <regis.houssin@inodbox.com>
 * Copyright (C) 2014-2021 Charlene Benke		<charlene.r@benke.fr>
 * Copyright (C) 2015      Jean-François Ferry	<jfefe@aternatik.fr>
 * Copyright (C) 2016      Ferran Marcet        <fmarcet@2byte.es>
 * Copyright (C) 2019	   Nicolas ZABOURI	<info@inovea-conseil.com>
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

/**
 *    \file       htdocs/societe/index.php
 *  \ingroup    societe
 *  \brief      Home page for third parties area
 */

/**
 * TODO: Temporarily defined constants
 */
const MAIN_HIDE_TOP_MENU = 0;
const MAIN_HIDE_LEFT_MENU = 0;

require 'main.php';

require_once DOL_DOCUMENT_ROOT . '/Modules/Societes/class/societe.class.php';
require_once DOL_DOCUMENT_ROOT . '/core/class/html.form.class.php';
require_once DOL_DOCUMENT_ROOT . '/core/class/html.formother.class.php';

$hookmanager = new HookManager($db);

// Initialize technical object to manage hooks. Note that conf->hooks_modules contains array
$hookmanager->initHooks(['thirdpartiesindex']);

$langs->load("companies");

$socid = GETPOST('socid', 'int');
if ($user->socid) {
    $socid = $user->socid;
}

// Security check
$result = restrictedArea($user, 'societe', 0, '', '', '', '');

$thirdparty_static = new Societe($db);

if (!isset($form) || !is_object($form)) {
    $form = new Form($db);
}
// Load $resultboxes
$resultboxes = FormOther::getBoxesArea($user, "3");

if (GETPOST('addbox')) {
    // Add box (when submit is done from a form when ajax disabled)
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

/*
 * View
 */

$transAreaType = $langs->trans("ThirdPartiesArea");
$helpurl = 'EN:Module_Third_Parties|FR:Module_Tiers|ES:M&oacute;dulo_Terceros';

llxHeader("", $langs->trans("ThirdParties"), $helpurl);

print load_fiche_titre($transAreaType, $resultboxes['selectboxlist'], 'companies');

/*
 * Statistics area
 */

$third = [
    'customer' => 0,
    'prospect' => 0,
    'supplier' => 0,
    'other' => 0,
];
$total = 0;

$sql = "SELECT s.rowid, s.client, s.fournisseur";
$sql .= " FROM " . MAIN_DB_PREFIX . "societe as s";
if (!$user->rights->societe->client->voir && !$socid) {
    $sql .= ", " . MAIN_DB_PREFIX . "societe_commerciaux as sc";
}
$sql .= ' WHERE s.entity IN (' . getEntity('societe') . ')';
if (!$user->rights->societe->client->voir && !$socid) {
    $sql .= " AND s.rowid = sc.fk_soc AND sc.fk_user = " . ((int) $user->id);
}
if ($socid > 0) {
    $sql .= " AND s.rowid = " . ((int) $socid);
}
if (!$user->rights->fournisseur->lire) {
    $sql .= " AND (s.fournisseur <> 1 OR s.client <> 0)"; // client=0, fournisseur=0 must be visible
}
//print $sql;
$result = $db->query($sql);
if ($result) {
    while ($objp = $db->fetch_object($result)) {
        $found = 0;
        if (!empty($conf->societe->enabled) && $user->rights->societe->lire && empty($conf->global->SOCIETE_DISABLE_PROSPECTS) && empty($conf->global->SOCIETE_DISABLE_PROSPECTS_STATS) && ($objp->client == 2 || $objp->client == 3)) {
            $found = 1;
            $third['prospect']++;
        }
        if (!empty($conf->societe->enabled) && $user->rights->societe->lire && empty($conf->global->SOCIETE_DISABLE_CUSTOMERS) && empty($conf->global->SOCIETE_DISABLE_CUSTOMERS_STATS) && ($objp->client == 1 || $objp->client == 3)) {
            $found = 1;
            $third['customer']++;
        }
        if ((($conf->fournisseur->enabled && $user->rights->fournisseur->facture->lire && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || (!empty($conf->supplier_order->enabled) && $user->rights->supplier_order->lire) || (!empty($conf->supplier_invoice->enabled) && $user->rights->supplier_invoice->lire)) && empty($conf->global->SOCIETE_DISABLE_SUPPLIERS_STATS) && $objp->fournisseur) {
            $found = 1;
            $third['supplier']++;
        }
        if (!empty($conf->societe->enabled) && $objp->client == 0 && $objp->fournisseur == 0) {
            $found = 1;
            $third['other']++;
        }
        if ($found) {
            $total++;
        }
    }
} else {
    dol_print_error($db);
}

require_once DOL_DOCUMENT_ROOT . '/Modules/Societes/Views/index.php';
