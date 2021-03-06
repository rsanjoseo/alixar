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

$thirdpartygraph = '<div class="div-table-responsive-no-min">';

$thirdpartygraph .= '<table class="noborder nohover centpercent">' . "\n";
$thirdpartygraph .= '<tr class="liste_titre"><th colspan="2">' . $langs->trans("Statistics") . '</th></tr>';
if (!empty($conf->use_javascript_ajax) && ((round($third['prospect']) ? 1 : 0) + (round($third['customer']) ? 1 : 0) + (round($third['supplier']) ? 1 : 0) + (round($third['other']) ? 1 : 0) >= 2)) {
    $thirdpartygraph .= '<tr><td class="center" colspan="2">';
    $dataseries = [];
    if (!empty($conf->societe->enabled) && $user->rights->societe->lire && empty($conf->global->SOCIETE_DISABLE_PROSPECTS) && empty($conf->global->SOCIETE_DISABLE_PROSPECTS_STATS)) {
        $dataseries[] = [$langs->trans("Prospects"), round($third['prospect'])];
    }
    if (!empty($conf->societe->enabled) && $user->rights->societe->lire && empty($conf->global->SOCIETE_DISABLE_CUSTOMERS) && empty($conf->global->SOCIETE_DISABLE_CUSTOMERS_STATS)) {
        $dataseries[] = [$langs->trans("Customers"), round($third['customer'])];
    }
    if ((($conf->fournisseur->enabled && $user->rights->fournisseur->facture->lire && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || (!empty($conf->supplier_order->enabled) && $user->rights->supplier_order->lire) || (!empty($conf->supplier_invoice->enabled) && $user->rights->supplier_invoice->lire)) && empty($conf->global->SOCIETE_DISABLE_SUPPLIERS_STATS)) {
        $dataseries[] = [$langs->trans("Suppliers"), round($third['supplier'])];
    }
    if (!empty($conf->societe->enabled)) {
        $dataseries[] = [$langs->trans("Others"), round($third['other'])];
    }
    include_once DOL_DOCUMENT_ROOT . '/core/class/dolgraph.class.php';
    $dolgraph = new DolGraph();
    $dolgraph->SetData($dataseries);
    $dolgraph->setShowLegend(2);
    $dolgraph->setShowPercent(1);
    $dolgraph->SetType(['pie']);
    $dolgraph->setHeight('200');
    $dolgraph->draw('idgraphthirdparties');
    $thirdpartygraph .= $dolgraph->show();
    $thirdpartygraph .= '</td></tr>' . "\n";
} else {
    if (!empty($conf->societe->enabled) && $user->rights->societe->lire && empty($conf->global->SOCIETE_DISABLE_PROSPECTS) && empty($conf->global->SOCIETE_DISABLE_PROSPECTS_STATS)) {
        $statstring = "<tr>";
        $statstring .= '<td><a href="' . DOL_URL_ROOT . '/Modules/Societes/list.php?type=p">' . $langs->trans("Prospects") . '</a></td><td class="right">' . round($third['prospect']) . '</td>';
        $statstring .= "</tr>";
    }
    if (!empty($conf->societe->enabled) && $user->rights->societe->lire && empty($conf->global->SOCIETE_DISABLE_CUSTOMERS) && empty($conf->global->SOCIETE_DISABLE_CUSTOMERS_STATS)) {
        $statstring .= "<tr>";
        $statstring .= '<td><a href="' . DOL_URL_ROOT . '/Modules/Societes/list.php?type=c">' . $langs->trans("Customers") . '</a></td><td class="right">' . round($third['customer']) . '</td>';
        $statstring .= "</tr>";
    }
    if ((($conf->fournisseur->enabled && $user->rights->fournisseur->facture->lire && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || (!empty($conf->supplier_order->enabled) && $user->rights->supplier_order->lire) || (!empty($conf->supplier_invoice->enabled) && $user->rights->supplier_invoice->lire)) && empty($conf->global->SOCIETE_DISABLE_SUPPLIERS_STATS)) {
        $statstring2 = "<tr>";
        $statstring2 .= '<td><a href="' . DOL_URL_ROOT . '/Modules/Societes/list.php?type=f">' . $langs->trans("Suppliers") . '</a></td><td class="right">' . round($third['supplier']) . '</td>';
        $statstring2 .= "</tr>";
    }
    $thirdpartygraph .= $statstring;
    $thirdpartygraph .= $statstring2;
}
$thirdpartygraph .= '<tr class="liste_total"><td>' . $langs->trans("UniqueThirdParties") . '</td><td class="right">';
$thirdpartygraph .= $total;
$thirdpartygraph .= '</td></tr>';
$thirdpartygraph .= '</table>';
$thirdpartygraph .= '</div>';

$thirdpartycateggraph = '';
if (!empty($conf->categorie->enabled) && !empty($conf->global->CATEGORY_GRAPHSTATS_ON_THIRDPARTIES)) {
    require_once DOL_DOCUMENT_ROOT . '/Modules/Categories/class/categorie.class.php';
    $elementtype = 'societe';

    $thirdpartycateggraph = '<div class="div-table-responsive-no-min">';
    $thirdpartycateggraph .= '<table class="noborder nohover centpercent">';
    $thirdpartycateggraph .= '<tr class="liste_titre"><th colspan="2">' . $langs->trans("Categories") . '</th></tr>';
    $thirdpartycateggraph .= '<tr><td class="center" colspan="2">';
    $sql = "SELECT c.label, count(*) as nb";
    $sql .= " FROM " . MAIN_DB_PREFIX . "categorie_societe as cs";
    $sql .= " LEFT JOIN " . MAIN_DB_PREFIX . "categorie as c ON cs.fk_categorie = c.rowid";
    $sql .= " WHERE c.type = 2";
    if (!is_numeric($conf->global->CATEGORY_GRAPHSTATS_ON_THIRDPARTIES)) {
        $sql .= " AND c.label like '" . $db->escape($conf->global->CATEGORY_GRAPHSTATS_ON_THIRDPARTIES) . "'";
    }
    $sql .= " AND c.entity IN (" . getEntity('category') . ")";
    $sql .= " GROUP BY c.label";
    $total = 0;
    $result = $db->query($sql);
    if ($result) {
        $num = $db->num_rows($result);
        $i = 0;
        if (!empty($conf->use_javascript_ajax)) {
            $dataseries = [];
            $rest = 0;
            $nbmax = 10;

            while ($i < $num) {
                $obj = $db->fetch_object($result);
                if ($i < $nbmax) {
                    $dataseries[] = [$obj->label, round($obj->nb)];
                } else {
                    $rest += $obj->nb;
                }
                $total += $obj->nb;
                $i++;
            }
            if ($i > $nbmax) {
                $dataseries[] = [$langs->trans("Other"), round($rest)];
            }
            include_once DOL_DOCUMENT_ROOT . '/core/class/dolgraph.class.php';
            $dolgraph = new DolGraph();
            $dolgraph->SetData($dataseries);
            $dolgraph->setShowLegend(2);
            $dolgraph->setShowPercent(1);
            $dolgraph->SetType(['pie']);
            $dolgraph->setHeight('200');
            $dolgraph->draw('idgraphcateg');
            $thirdpartycateggraph .= $dolgraph->show();
        } else {
            while ($i < $num) {
                $obj = $db->fetch_object($result);

                $thirdpartycateggraph .= '<tr class="oddeven"><td>' . $obj->label . '</td><td>' . $obj->nb . '</td></tr>';
                $total += $obj->nb;
                $i++;
            }
        }
    }
    $thirdpartycateggraph .= '</td></tr>';
    $thirdpartycateggraph .= '<tr class="liste_total"><td>' . $langs->trans("Total") . '</td><td class="right">';
    $thirdpartycateggraph .= $total;
    $thirdpartycateggraph .= '</td></tr>';
    $thirdpartycateggraph .= '</table>';
    $thirdpartycateggraph .= '</div>';
} else {
    $thirdpartycateggraph = '';
}

/*
 * Latest modified third parties
 */
$max = 15;
$sql = "SELECT s.rowid, s.nom as name, s.email, s.client, s.fournisseur";
$sql .= ", s.code_client";
$sql .= ", s.code_fournisseur";
$sql .= ", s.code_compta_fournisseur";
$sql .= ", s.code_compta";
$sql .= ", s.logo";
$sql .= ", s.entity";
$sql .= ", s.canvas, s.tms as date_modification, s.status as status";
$sql .= " FROM " . MAIN_DB_PREFIX . "societe as s";
if (!$user->rights->societe->client->voir && !$socid) {
    $sql .= ", " . MAIN_DB_PREFIX . "societe_commerciaux as sc";
}
$sql .= ' WHERE s.entity IN (' . getEntity('societe') . ')';
if (!$user->rights->societe->client->voir && !$socid) {
    $sql .= " AND s.rowid = sc.fk_soc AND sc.fk_user = " . ((int) $user->id);
}
if ($socid) {
    $sql .= " AND s.rowid = " . ((int) $socid);
}
if (!$user->rights->fournisseur->lire) {
    $sql .= " AND (s.fournisseur != 1 OR s.client != 0)";
}
$sql .= $db->order("s.tms", "DESC");
$sql .= $db->plimit($max, 0);

//print $sql;
$lastmodified = "";
$result = $db->query($sql);
if ($result) {
    $num = $db->num_rows($result);

    $i = 0;

    if ($num > 0) {
        $transRecordedType = $langs->trans("LastModifiedThirdParties", $max);

        $lastmodified = "\n<!-- last thirdparties modified -->\n";
        $lastmodified .= '<div class="div-table-responsive-no-min">';
        $lastmodified .= '<table class="noborder centpercent">';

        $lastmodified .= '<tr class="liste_titre"><th colspan="2">' . $transRecordedType . '</th>';
        $lastmodified .= '<th>&nbsp;</th>';
        $lastmodified .= '<th class="right"><a href="' . DOL_URL_ROOT . '/Modules/Societes/list.php?sortfield=s.tms&sortorder=DESC">' . $langs->trans("FullList") . '</th>';
        $lastmodified .= '</tr>' . "\n";

        while ($i < $num) {
            $objp = $db->fetch_object($result);

            $thirdparty_static->id = $objp->rowid;
            $thirdparty_static->name = $objp->name;
            $thirdparty_static->client = $objp->client;
            $thirdparty_static->fournisseur = $objp->fournisseur;
            $thirdparty_static->logo = $objp->logo;
            $thirdparty_static->date_modification = $db->jdate($objp->date_modification);
            $thirdparty_static->status = $objp->status;
            $thirdparty_static->code_client = $objp->code_client;
            $thirdparty_static->code_fournisseur = $objp->code_fournisseur;
            $thirdparty_static->canvas = $objp->canvas;
            $thirdparty_static->email = $objp->email;
            $thirdparty_static->entity = $objp->entity;
            $thirdparty_static->code_compta_fournisseur = $objp->code_compta_fournisseur;
            $thirdparty_static->code_compta = $objp->code_compta;

            $lastmodified .= '<tr class="oddeven">';
            // Name
            $lastmodified .= '<td class="nowrap tdoverflowmax200">';
            $lastmodified .= $thirdparty_static->getNomUrl(1);
            $lastmodified .= "</td>\n";
            // Type
            $lastmodified .= '<td class="center">';
            $lastmodified .= $thirdparty_static->getTypeUrl();
            $lastmodified .= '</td>';
            // Last modified date
            $lastmodified .= '<td class="right tddate">';
            $lastmodified .= dol_print_date($thirdparty_static->date_modification, 'day');
            $lastmodified .= "</td>";
            $lastmodified .= '<td class="right nowrap">';
            $lastmodified .= $thirdparty_static->getLibStatut(3);
            $lastmodified .= "</td>";
            $lastmodified .= "</tr>\n";
            $i++;
        }

        $db->free($result);

        $lastmodified .= "</table>\n";
        $lastmodified .= '</div>';
        $lastmodified .= "<!-- End last thirdparties modified -->\n";
    }
} else {
    dol_print_error($db);
}

//print '</div></div></div>';

// boxes
print '<div class="clearboth"></div>';
print '<div class="fichecenter fichecenterbis">';

$boxlist = '<div class="twocolumns">';

$boxlist .= '<div class="firstcolumn fichehalfleft boxhalfleft" id="boxhalfleft">';
$boxlist .= $thirdpartygraph;
$boxlist .= '<br>';
$boxlist .= $thirdpartycateggraph;
$boxlist .= '<br>';
$boxlist .= $resultboxes['boxlista'];
$boxlist .= '</div>' . "\n";

$boxlist .= '<div class="secondcolumn fichehalfright boxhalfright" id="boxhalfright">';
$boxlist .= $lastmodified;
$boxlist .= '<br>';
$boxlist .= $resultboxes['boxlistb'];
$boxlist .= '</div>' . "\n";

$boxlist .= '</div>';

print $boxlist;

print '</div>';

$parameters = ['user' => $user];
$reshook = $hookmanager->executeHooks('dashboardThirdparties', $parameters, $object); // Note that $action and $object may have been modified by hook

// End of page
llxFooter();
$db->close();
