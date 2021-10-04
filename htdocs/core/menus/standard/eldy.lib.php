<?php
/* Copyright (C) 2010-2014 Laurent Destailleur  <eldy@users.sourceforge.net>
 * Copyright (C) 2010      Regis Houssin        <regis.houssin@inodbox.com>
 * Copyright (C) 2012-2015 Juanjo Menent        <jmenent@2byte.es>
 * Copyright (C) 2013      Cédric Salvador      <csalvador@gpcsolutions.fr>
 * Copyright (C) 2015      Marcos García        <marcosgdf@gmail.com>
 * Copyright (C) 2018      Ferran Marcet        <fmarcet@2byte.es>
 * Copyright (C) 2018-2019  Frédéric France         <frederic.france@netlogic.fr>
 * Copyright (C) 2021       Gauthier VERDOL         <gauthier.verdol@atm-consulting.fr>
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
 * or see https://www.gnu.org/
 */

/**
 *  \file        htdocs/core/menus/standard/eldy.lib.php
 *  \brief        Library for file eldy menus
 */
require_once DOL_DOCUMENT_ROOT . '/core/class/menubase.class.php';

/**
 * Core function to output top menu eldy
 *
 * @param DoliDB $db        Database handler
 * @param string $atarget   Target (Example: '' or '_top')
 * @param int    $type_user 0=Menu for backoffice, 1=Menu for front office
 * @param array  $tabMenu   If array with menu entries already loaded, we put this array here (in most cases, it's empty). For eldy menu, it contains menu entries loaded from database.
 * @param Menu   $menu      Object Menu to return back list of menu entries
 * @param int    $noout     1=Disable output (Initialise &$menu only).
 * @param string $mode      'top', 'topnb', 'left', 'jmobile'
 *
 * @return    int                        0
 */
function print_eldy_menu($db, $atarget, $type_user, &$tabMenu, &$menu, $noout = 0, $mode = '')
{
    global $user, $conf, $langs, $mysoc;
    global $dolibarr_main_db_name;

    $mainmenu = (empty($_SESSION["mainmenu"]) ? '' : $_SESSION["mainmenu"]);
    $leftmenu = (empty($_SESSION["leftmenu"]) ? '' : $_SESSION["leftmenu"]);

    $id = 'mainmenu';
    $listofmodulesforexternal = explode(',', $conf->global->MAIN_MODULES_FOR_EXTERNAL);

    $substitarray = getCommonSubstitutionArray($langs, 0, null, null);

    if (empty($noout)) {
        print_start_menu_array();
    }

    $usemenuhider = 1;

    // Show/Hide vertical menu. The hamburger icon for .menuhider action.
    if ($mode != 'jmobile' && $mode != 'topnb' && $usemenuhider && empty($conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) {
        $showmode = 1;
        $classname = 'class="tmenu menuhider"';
        $idsel = 'menu';

        $menu->add('#', (!empty($conf->global->THEME_TOPMENU_DISABLE_IMAGE) ? '<span class="fa fa-bars"></span>' : ''), 0, $showmode, $atarget, "xxx", '', 0, $id, $idsel, $classname);
    }

    $menu_arr = [];

    // Home
    $menu_arr[] = [
        'name' => 'Home',
        'link' => constant('BASE_URI') . '?mainmenu=home&amp;leftmenu=home',
        'title' => "Home",
        'level' => 0,
        'enabled' => $showmode = 1,
        'target' => $atarget,
        'mainmenu' => "home",
        'leftmenu' => '',
        'position' => 10,
        'id' => $id,
        'idsel' => 'home',
        'classname' => $classname = (!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "home") ? 'class="tmenusel"' : 'class="tmenu"',
        'prefix' => '<span class="fa fa-home fa-fw paddingright"></span>',
        'session' => ((!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "home") ? 0 : 1),
        'loadLangs' => [],
        'submenus' => [],
    ];

    // Members
    $tmpentry = [
        'enabled' => (!empty($conf->adherent->enabled)),
        'perms' => (!empty($user->rights->adherent->lire)),
        'module' => 'adherent',
    ];
    $menu_arr[] = [
        'name' => 'Members',
        'link' => constant('BASE_URI') . '?modules=Adherents&mainmenu=members&amp;leftmenu=',
        'title' => "MenuMembers",
        'level' => 0,
        'enabled' => $showmode = isVisibleToUserType($type_user, $tmpentry, $listofmodulesforexternal),
        'target' => $atarget,
        'mainmenu' => "members",
        'leftmenu' => '',
        'position' => 18,
        'id' => $id,
        'idsel' => 'members',
        'classname' => $classname = (!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "members") ? 'class="tmenusel"' : 'class="tmenu"',
        'prefix' => img_picto('', 'member', 'class="fa-fw paddingright"'),
        'session' => ((!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "members") ? 0 : 1),
        'loadLangs' => [],
        'submenus' => [],
    ];

    // Third parties
    $tmpentry = [
        'enabled' => ((!empty($conf->societe->enabled) &&
                (empty($conf->global->SOCIETE_DISABLE_PROSPECTS) || empty($conf->global->SOCIETE_DISABLE_CUSTOMERS))
            )
            || ((!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || !empty($conf->supplier_order->enabled) || !empty($conf->supplier_invoice->enabled))
        ),
        'perms' => (!empty($user->rights->societe->lire) || !empty($user->rights->fournisseur->lire) || !empty($user->rights->supplier_order->lire) || !empty($user->rights->supplier_invoice->lire) || !empty($user->rights->supplier_proposal->lire)),
        'module' => 'societe|fournisseur',
    ];
    $menu_arr[] = [
        'name' => 'Companies',
        'link' => constant('BASE_URI') . '?module=Societes', // '/Modules/Societes/index.php?mainmenu=companies&amp;leftmenu=',
        'title' => "ThirdParties",
        'level' => 0,
        'enabled' => $showmode = isVisibleToUserType($type_user, $tmpentry, $listofmodulesforexternal),
        'target' => $atarget,
        'mainmenu' => "companies",
        'leftmenu' => '',
        'position' => 20,
        'id' => $id,
        'idsel' => 'companies',
        'classname' => $classname = (!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "companies") ? 'class="tmenusel"' : 'class="tmenu"',
        'prefix' => img_picto('', 'company', 'class="fa-fw paddingright"'),
        'session' => ((!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "companies") ? 0 : 1),
        'loadLangs' => ["companies", "suppliers"],
        'submenus' => [],
    ];

    // Products-Services
    $tmpentry = [
        'enabled' => (!empty($conf->product->enabled) || !empty($conf->service->enabled) || !empty($conf->expedition->enabled)),
        'perms' => (!empty($user->rights->produit->lire) || !empty($user->rights->service->lire) || !empty($user->rights->expedition->lire)),
        'module' => 'product|service',
    ];
    $menu_arr[] = [
        'name' => 'Products',
        'link' => constant('BASE_URI') . '&module=Products&mainmenu=products&leftmenu=',
        'title' => (!empty($conf->product->enabled) && !empty($conf->service->enabled))
            ? (["TMenuProducts", " | ", "TMenuServices"])
            : (!empty($conf->product->enabled) ? "TMenuProducts" : "TMenuServices"),
        'level' => 0,
        'enabled' => $showmode = isVisibleToUserType($type_user, $tmpentry, $listofmodulesforexternal),
        'target' => $atarget,
        'mainmenu' => "products",
        'leftmenu' => '',
        'position' => 30,
        'id' => $id,
        'idsel' => 'products',
        'classname' => $classname = (!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "products") ? 'class="tmenusel"' : 'class="tmenu"',
        'prefix' => img_picto('', 'product', 'class="fa-fw paddingright"'),
        'session' => ((!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "products") ? 0 : 1),
        'loadLangs' => ["products"],
        'submenus' => [],
    ];

    // MRP - GPAO
    $tmpentry = [
        'enabled' => (!empty($conf->bom->enabled) || !empty($conf->mrp->enabled)),
        'perms' => (!empty($user->rights->bom->read) || !empty($user->rights->mrp->read)),
        'module' => 'bom|mrp',
    ];
    $menu_arr[] = [
        'name' => 'TMenuMRP',
        'link' => constant('BASE_URI') . '?module=Mrp&mainmenu=mrp&leftmenu=',
        'title' => "TMenuMRP",
        'level' => 0,
        'enabled' => $showmode = isVisibleToUserType($type_user, $tmpentry, $listofmodulesforexternal),
        'target' => $atarget,
        'mainmenu' => "mrp",
        'leftmenu' => '',
        'position' => 31,
        'id' => $id,
        'idsel' => 'mrp',
        'classname' => $classname = (!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "mrp") ? 'class="tmenusel"' : 'class="tmenu"',
        'prefix' => img_picto('', 'mrp', 'class="fa-fw paddingright"'),
        'session' => ((!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "mrp") ? 0 : 1),
        'loadLangs' => ["mrp"],
        'submenus' => [],
    ];

    // Projects
    $tmpentry = [
        'enabled' => (!empty($conf->projet->enabled) ? 1 : 0),
        'perms' => (!empty($user->rights->projet->lire) ? 1 : 0),
        'module' => 'projet',
    ];
    $menu_arr[] = [
        'name' => 'Projet',
        'link' => constant('BASE_URI') . '?module=Projects&mainmenu=project&leftmenu=',
        'title' => (!empty($conf->global->PROJECT_USE_OPPORTUNITIES) && $conf->global->PROJECT_USE_OPPORTUNITIES == 2 ? "Leads" : "Projects"),
        'level' => 0,
        'enabled' => $showmode = isVisibleToUserType($type_user, $tmpentry, $listofmodulesforexternal),
        'target' => $atarget,
        'mainmenu' => "project",
        'leftmenu' => '',
        'position' => 35,
        'id' => $id,
        'idsel' => 'project',
        'classname' => $classname = (!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "project") ? 'class="tmenusel"' : 'class="tmenu"',
        'prefix' => img_picto('', 'project', 'class="fa-fw paddingright"'),
        'session' => ((!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "project") ? 0 : 1),
        'loadLangs' => ["projects"],
        'submenus' => [],
    ];

    // Commercial (propal, commande, supplier_proposal, supplier_order, contrat, ficheinter)
    $tmpentry = [
        'enabled' => (!empty($conf->propal->enabled)
            || !empty($conf->commande->enabled)
            || !empty($conf->fournisseur->enabled)
            || !empty($conf->supplier_proposal->enabled)
            || !empty($conf->supplier_order->enabled)
            || !empty($conf->contrat->enabled)
            || !empty($conf->ficheinter->enabled)
        ) ? 1 : 0,
        'perms' => (!empty($user->rights->propal->lire)
            || !empty($user->rights->commande->lire)
            || !empty($user->rights->supplier_proposal->lire)
            || !empty($user->rights->fournisseur->lire)
            || !empty($user->rights->fournisseur->commande->lire)
            || !empty($user->rights->supplier_order->lire)
            || !empty($user->rights->contrat->lire)
            || !empty($user->rights->ficheinter->lire)
        ),
        'module' => 'propal|commande|supplier_proposal|supplier_order|contrat|ficheinter',
    ];

    $onlysupplierorder = !empty($user->rights->fournisseur->commande->lire) &&
        empty($user->rights->propal->lire) &&
        empty($user->rights->commande->lire) &&
        empty($user->rights->supplier_order->lire) &&
        empty($user->rights->supplier_proposal->lire) &&
        empty($user->rights->contrat->lire) &&
        empty($user->rights->ficheinter->lire);

    $menu_arr[] = [
        'name' => 'Commercial',
        'link' => constant('BASE_URI') . ($onlysupplierorder
                ? '?module=Fourn&controller=Commande&mainmenu=commercial&leftmenu='
                : '?module=Comm&mainmenu=commercial&leftmenu='),
        'title' => "Commercial",
        'level' => 0,
        'enabled' => $showmode = isVisibleToUserType($type_user, $tmpentry, $listofmodulesforexternal),
        'target' => $atarget,
        'mainmenu' => "commercial",
        'leftmenu' => '',
        'position' => 40,
        'id' => $id,
        'idsel' => 'commercial',
        'classname' => $classname = (!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "commercial") ? 'class="tmenusel"' : 'class="tmenu"',
        'prefix' => img_picto('', 'contract', 'class="fa-fw paddingright"'),
        'session' => ((!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "commercial") ? 0 : 1),
        'loadLangs' => ["commercial"],
        'submenus' => [],
    ];

    // Billing - Financial
    $tmpentry = [
        'enabled' => (!empty($conf->facture->enabled) ||
            !empty($conf->don->enabled) ||
            !empty($conf->tax->enabled) ||
            !empty($conf->salaries->enabled) ||
            !empty($conf->supplier_invoice->enabled) ||
            !empty($conf->loan->enabled) ||
            !empty($conf->margins->enabled)
        ) ? 1 : 0,
        'perms' => (!empty($user->rights->facture->lire) || !empty($user->rights->don->contact->lire)
            || !empty($user->rights->tax->charges->lire) || !empty($user->rights->salaries->read)
            || !empty($user->rights->fournisseur->facture->lire) || !empty($user->rights->loan->read) || !empty($user->rights->margins->liretous)),
        'module' => 'facture|supplier_invoice|don|tax|salaries|loan',
    ];
    $menu_arr[] = [
        'name' => 'Compta',
        'link' => constant('BASE_URI') . '?modules=Compta&mainmenu=billing&leftmenu=',
        'title' => "MenuFinancial",
        'level' => 0,
        'enabled' => $showmode = isVisibleToUserType($type_user, $tmpentry, $listofmodulesforexternal),
        'target' => $atarget,
        'mainmenu' => "billing",
        'leftmenu' => '',
        'position' => 50,
        'id' => $id,
        'idsel' => 'billing',
        'classname' => $classname = (!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "billing") ? 'class="tmenusel"' : 'class="tmenu"',
        'prefix' => img_picto('', 'bill', 'class="fa-fw paddingright"'),
        'session' => ((!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "billing") ? 0 : 1),
        'loadLangs' => ["compta"],
        'submenus' => [],
    ];

    // Bank
    $tmpentry = [
        'enabled' => (!empty($conf->banque->enabled) || !empty($conf->prelevement->enabled)),
        'perms' => (!empty($user->rights->banque->lire) || !empty($user->rights->prelevement->lire) || !empty($user->rights->paymentbybanktransfer->read)),
        'module' => 'banque|prelevement|paymentbybanktransfer',
    ];
    $menu_arr[] = [
        'name' => 'Bank',
        'link' => constant('BASE_URI') . '?module=Compta&controller=BankList&mainmenu=bank&leftmenu=',
        'title' => "MenuBankCash",
        'level' => 0,
        'enabled' => $showmode = isVisibleToUserType($type_user, $tmpentry, $listofmodulesforexternal),
        'target' => $atarget,
        'mainmenu' => "bank",
        'leftmenu' => '',
        'position' => 52,
        'id' => $id,
        'idsel' => 'bank',
        'classname' => $classname = (!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "bank") ? 'class="tmenusel"' : 'class="tmenu"',
        'prefix' => img_picto('', 'bank_account', 'class="fa-fw paddingright"'),
        'session' => ((!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "bank") ? 0 : 1),
        'loadLangs' => ["compta", "banks"],
        'submenus' => [],
    ];

    // Accounting
    $tmpentry = [
        'enabled' => (!empty($conf->comptabilite->enabled) || !empty($conf->accounting->enabled) || !empty($conf->asset->enabled) || !empty($conf->intracommreport->enabled)),
        'perms' => (!empty($user->rights->compta->resultat->lire) || !empty($user->rights->accounting->comptarapport->lire) || !empty($user->rights->accounting->mouvements->lire) || !empty($user->rights->asset->read) || !empty($user->rights->intracommreport->read)),
        'module' => 'comptabilite|accounting|asset|intracommreport',
    ];
    $menu_arr[] = [
        'name' => 'Accounting',
        'link' => constant('BASE_URI') . '?module=Accountancy&mainmenu=accountancy&leftmenu=',
        'title' => "MenuAccountancy",
        'level' => 0,
        'enabled' => $showmode = isVisibleToUserType($type_user, $tmpentry, $listofmodulesforexternal),
        'target' => $atarget,
        'mainmenu' => "accountancy",
        'leftmenu' => '',
        'position' => 54,
        'id' => $id,
        'idsel' => 'accountancy',
        'classname' => $classname = (!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "accountancy") ? 'class="tmenusel"' : 'class="tmenu"',
        'prefix' => img_picto('', 'accountancy', 'class="fa-fw paddingright"'),
        'session' => ((!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "accountancy") ? 0 : 1),
        'loadLangs' => ["compta", "accountancy", "assets", "intracommreport"],
        'submenus' => [],
    ];

    // HRM
    $tmpentry = [
        'enabled' => (!empty($conf->hrm->enabled) || (!empty($conf->holiday->enabled)) || !empty($conf->deplacement->enabled) || !empty($conf->expensereport->enabled) || !empty($conf->recruitment->enabled)),
        'perms' => (!empty($user->rights->user->user->lire) || !empty($user->rights->holiday->read) || !empty($user->rights->deplacement->lire) || !empty($user->rights->expensereport->lire) || !empty($user->rights->recruitment->recruitmentjobposition->read)),
        'module' => 'hrm|holiday|deplacement|expensereport|recruitment',
    ];

    $menu_arr[] = [
        'name' => 'HRM',
        'link' => constant('BASE_URI') . '?module=Hrm&mainmenu=hrm&leftmenu=',
        'title' => "HRM",
        'level' => 0,
        'enabled' => $showmode = isVisibleToUserType($type_user, $tmpentry, $listofmodulesforexternal),
        'target' => $atarget,
        'mainmenu' => "hrm",
        'leftmenu' => '',
        'position' => 80,
        'id' => $id,
        'idsel' => 'hrm',
        'classname' => $classname = (!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "hrm") ? 'class="tmenusel"' : 'class="tmenu"',
        'prefix' => img_picto('', 'hrm', 'class="fa-fw paddingright"'),
        'session' => ((!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "hrm") ? 0 : 1),
        'loadLangs' => ["holiday"],
        'submenus' => [],
    ];

    // Tickets and knowledge base
    $tmpentry = [
        'enabled' => (!empty($conf->ticket->enabled) || !empty($conf->knowledgemanagement->enabled)),
        'perms' => (!empty($user->rights->ticket->read) || !empty($user->rights->knowledgemanagement->knowledgerecord->read)),
        'module' => 'ticket|knowledgemanagement',
    ];
    $link = '';
    if (!empty($conf->ticket->enabled)) {
        $link = '/Modules/Tickets/index.php?mainmenu=ticket&amp;leftmenu=';
    } else {
        $link = '/knowledgemanagement/knowledgerecord_list.php?mainmenu=ticket&amp;leftmenu=';
    }
    $menu_arr[] = [
        'name' => 'Ticket',
        'link' => constant('BASE_URI') . '?module=Tickets&mainmenu=ticket&leftmenu=',
        'title' => "Tickets",
        'level' => 0,
        'enabled' => $showmode = isVisibleToUserType($type_user, $tmpentry, $listofmodulesforexternal),
        'target' => $atarget,
        'mainmenu' => "ticket",
        'leftmenu' => '',
        'position' => 88,
        'id' => $id,
        'idsel' => 'ticket',
        'classname' => $classname = (!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "ticket") ? 'class="tmenusel"' : 'class="tmenu"',
        'prefix' => img_picto('', 'ticket', 'class="fa-fw paddingright"'),
        'session' => ((!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "ticket") ? 0 : 1),
        'loadLangs' => ["other"],
        'submenus' => [],
    ];

    // Tools
    $tmpentry = [
        'enabled' => 1,
        'perms' => 1,
        'module' => '',
    ];
    $menu_arr[] = [
        'name' => 'Tools',
        'link' => constant('BASE_URI') . '?module=Tools&mainmenu=tools&leftmenu=', // /core/tools.php
        'title' => "Tools",
        'level' => 0,
        'enabled' => $showmode = isVisibleToUserType($type_user, $tmpentry, $listofmodulesforexternal),
        'target' => $atarget,
        'mainmenu' => "tools",
        'leftmenu' => '',
        'position' => 90,
        'id' => $id,
        'idsel' => 'tools',
        'classname' => $classname = (!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "tools") ? 'class="tmenusel"' : 'class="tmenu"',
        'prefix' => img_picto('', 'tools', 'class="fa-fw paddingright"'),
        'session' => ((!empty($_SESSION["mainmenu"]) && $_SESSION["mainmenu"] == "tools") ? 0 : 1),
        'loadLangs' => ["other"],
        'submenus' => [],
    ];

    // Add menus
    foreach ($menu_arr as $key => $smenu) {
        $smenu = (object) $smenu;

        if ($smenu->enabled) {
            if ($smenu->session) {
                $_SESSION['idmenu'] = '';
            }

            // Load Langue
            if (!empty($smenu->loadLangs)) {
                $langs->loadLangs($smenu->loadLangs);
            }

            // Trans title
            $mtitle = '';
            if (is_array($smenu->title)) {
                foreach ($smenu->title as $item) {
                    $mtitle .= $langs->trans($item);
                }
            } else {
                $mtitle = $langs->trans($smenu->title);
            }
            // Add item
            $menu->add($smenu->link, $mtitle, $smenu->level, $smenu->enabled, $smenu->target, $smenu->mainmenu, $smenu->leftmenu, $smenu->position, $smenu->id, $smenu->idsel, $smenu->classname, $smenu->prefix);
        }
    }

    // Show personalized menus
    $menuArbo = new Menubase($db, 'eldy');

    $newTabMenu = $menuArbo->menuTopCharger('', '', $type_user, 'eldy', $tabMenu); // Return tabMenu with only top entries

    $num = count($newTabMenu);
    for ($i = 0; $i < $num; $i++) {
        //var_dump($type_user.' '.$newTabMenu[$i]['url'].' '.$showmode.' '.$newTabMenu[$i]['perms']);
        $idsel = (empty($newTabMenu[$i]['mainmenu']) ? 'none' : $newTabMenu[$i]['mainmenu']);

        $newTabMenu[$i]['url'] = make_substitutions($newTabMenu[$i]['url'], $substitarray);

        // url = url from host, shorturl = relative path into dolibarr sources
        $url = $shorturl = $newTabMenu[$i]['url'];
        if (!preg_match("/^(http:\/\/|https:\/\/)/i", $newTabMenu[$i]['url'])) {    // Do not change url content for external links
            $tmp = explode('?', $newTabMenu[$i]['url'], 2);
            $url = $shorturl = $tmp[0];
            $param = (isset($tmp[1]) ? $tmp[1] : '');

            if (!preg_match('/mainmenu/i', $param) || !preg_match('/leftmenu/i', $param)) {
                $param .= ($param ? '&' : '') . 'mainmenu=' . $newTabMenu[$i]['mainmenu'] . '&amp;leftmenu=';
            }
            //$url.="idmenu=".$newTabMenu[$i]['rowid'];    // Already done by menuLoad
            $url = dol_buildpath($url, 1) . ($param ? '?' . $param : '');
            //$shorturl = $shorturl.($param?'?'.$param:'');
            $shorturl = $url;
            if (DOL_URL_ROOT) {
                $shorturl = preg_replace('/^' . preg_quote(DOL_URL_ROOT, '/') . '/', '', $shorturl);
            }
        }

        $showmode = isVisibleToUserType($type_user, $newTabMenu[$i], $listofmodulesforexternal);
        if ($showmode == 1) {
            // Define the class (top menu selected or not)
            if (!empty($_SESSION['idmenu']) && $newTabMenu[$i]['rowid'] == $_SESSION['idmenu']) {
                $classname = 'class="tmenusel"';
            } elseif (!empty($_SESSION["mainmenu"]) && $newTabMenu[$i]['mainmenu'] == $_SESSION["mainmenu"]) {
                $classname = 'class="tmenusel"';
            } else {
                $classname = 'class="tmenu"';
            }
        } elseif ($showmode == 2) {
            $classname = 'class="tmenu"';
        }

        $menu->add(
            $shorturl,
            $newTabMenu[$i]['titre'],
            0,
            $showmode,
            ($newTabMenu[$i]['target'] ? $newTabMenu[$i]['target'] : $atarget),
            ($newTabMenu[$i]['mainmenu'] ? $newTabMenu[$i]['mainmenu'] : $newTabMenu[$i]['rowid']),
            ($newTabMenu[$i]['leftmenu'] ? $newTabMenu[$i]['leftmenu'] : ''),
            $newTabMenu[$i]['position'],
            $id,
            $idsel,
            $classname,
            $newTabMenu[$i]['prefix']
        );
    }

    // Sort on position
    $menu->liste = dol_sort_array($menu->liste, 'position');

    // Output menu entries
    // Show logo company
    if (empty($conf->global->MAIN_MENU_INVERT) && empty($noout) && !empty($conf->global->MAIN_SHOW_LOGO) && empty($conf->global->MAIN_OPTIMIZEFORTEXTBROWSER)) {
        //$mysoc->logo_mini=(empty($conf->global->MAIN_INFO_SOCIETE_LOGO_MINI)?'':$conf->global->MAIN_INFO_SOCIETE_LOGO_MINI);
        $mysoc->logo_squarred_mini = (empty($conf->global->MAIN_INFO_SOCIETE_LOGO_SQUARRED_MINI) ? '' : $conf->global->MAIN_INFO_SOCIETE_LOGO_SQUARRED_MINI);

        $logoContainerAdditionalClass = 'backgroundforcompanylogo';
        if (!empty($conf->global->MAIN_INFO_SOCIETE_LOGO_NO_BACKGROUND)) {
            $logoContainerAdditionalClass = '';
        }

        if (!empty($mysoc->logo_squarred_mini) && is_readable($conf->mycompany->dir_output . '/logos/thumbs/' . $mysoc->logo_squarred_mini)) {
            $urllogo = DOL_URL_ROOT . '/viewimage.php?cache=1&amp;modulepart=mycompany&amp;file=' . urlencode('logos/thumbs/' . $mysoc->logo_squarred_mini);
            /*} elseif (! empty($mysoc->logo_mini) && is_readable($conf->mycompany->dir_output.'/logos/thumbs/'.$mysoc->logo_mini))
            {
                $urllogo=DOL_URL_ROOT.'/viewimage.php?cache=1&amp;modulepart=mycompany&amp;file='.urlencode('logos/thumbs/'.$mysoc->logo_mini);
            }*/
        } else {
            $urllogo = DOL_URL_ROOT . '/theme/dolibarr_512x512_white.png';
            $logoContainerAdditionalClass = '';
        }
        $title = $langs->trans("GoIntoSetupToChangeLogo");

        print "\n" . '<!-- Show logo on menu -->' . "\n";
        print_start_menu_entry('companylogo', 'class="tmenu tmenucompanylogo nohover"', 1);

        print '<div class="center ' . $logoContainerAdditionalClass . ' menulogocontainer"><img class="mycompany" title="' . dol_escape_htmltag($title) . '" alt="" src="' . $urllogo . '" style="max-width: 100px"></div>' . "\n";

        print_end_menu_entry(4);
    }

    if (empty($noout)) {
        foreach ($menu->liste as $menuval) {
            print_start_menu_entry($menuval['idsel'], $menuval['classname'], $menuval['enabled']);
            print_text_menu_entry($menuval['titre'], $menuval['enabled'], (($menuval['url'] != '#' && !preg_match('/^(http:\/\/|https:\/\/)/i', $menuval['url'])) ? DOL_URL_ROOT : '') . $menuval['url'], $menuval['id'], $menuval['idsel'], $menuval['classname'], ($menuval['target'] ? $menuval['target'] : $atarget));
            print_end_menu_entry($menuval['enabled']);
        }
    }

    $showmode = 1;
    if (empty($noout)) {
        print_start_menu_entry('', 'class="tmenuend"', $showmode);
        print_end_menu_entry($showmode);
        print_end_menu_array();
    }

    return 0;
}

/**
 * Output start menu array
 *
 * @return    void
 */
function print_start_menu_array()
{
    global $conf;

    print '<div class="tmenudiv">';
    print '<ul role="navigation" class="tmenu"' . (empty($conf->global->MAIN_OPTIMIZEFORTEXTBROWSER) ? '' : ' title="Top menu"') . '>';
}

/**
 * Output start menu entry
 *
 * @param string $idsel     Text
 * @param string $classname String to add a css class
 * @param int    $showmode  0 = hide, 1 = allowed or 2 = not allowed
 *
 * @return    void
 */
function print_start_menu_entry($idsel, $classname, $showmode)
{
    if ($showmode) {
        print '<li ' . $classname . ' id="mainmenutd_' . $idsel . '">';
        //print '<div class="tmenuleft tmenusep"></div>';
        print '<div class="tmenucenter">';
    }
}

/**
 * Output menu entry
 *
 * @param string $text      Text
 * @param int    $showmode  0 = hide, 1 = allowed or 2 = not allowed
 * @param string $url       Url
 * @param string $id        Id
 * @param string $idsel     Id sel
 * @param string $classname Class name
 * @param string $atarget   Target
 *
 * @return    void
 */
function print_text_menu_entry($text, $showmode, $url, $id, $idsel, $classname, $atarget)
{
    global $conf, $langs;

    //$conf->global->THEME_TOPMENU_DISABLE_TEXT=1;
    if ($showmode == 1) {
        print '<a class="tmenuimage" tabindex="-1" href="' . $url . '"' . ($atarget ? ' target="' . $atarget . '"' : '') . ' title="' . dol_escape_htmltag($text) . '">';
        print '<div class="' . $id . ' ' . $idsel . ' topmenuimage"><span class="' . $id . ' tmenuimage" id="mainmenuspan_' . $idsel . '"></span></div>';
        print '</a>';
        if (empty($conf->global->THEME_TOPMENU_DISABLE_TEXT)) {
            print '<a ' . $classname . ' id="mainmenua_' . $idsel . '" href="' . $url . '"' . ($atarget ? ' target="' . $atarget . '"' : '') . ' title="' . dol_escape_htmltag($text) . '">';
            print '<span class="mainmenuaspan">';
            print $text;
            print '</span>';
            print '</a>';
        }
    } elseif ($showmode == 2) {
        print '<div class="' . $id . ' ' . $idsel . ' topmenuimage tmenudisabled"><span class="' . $id . '" id="mainmenuspan_' . $idsel . '"></span></div>';
        if (empty($conf->global->THEME_TOPMENU_DISABLE_TEXT)) {
            print '<a class="tmenudisabled" id="mainmenua_' . $idsel . '" href="#" title="' . dol_escape_htmltag($langs->trans("NotAllowed")) . '">';
            print '<span class="mainmenuaspan">';
            print $text;
            print '</span>';
            print '</a>';
        }
    }
}

/**
 * Output end menu entry
 *
 * @param int $showmode 0 = hide, 1 = allowed or 2 = not allowed
 *
 * @return    void
 */
function print_end_menu_entry($showmode)
{
    if ($showmode) {
        print '</div></li>';
    }
    print "\n";
}

/**
 * Output menu array
 *
 * @return    void
 */
function print_end_menu_array()
{
    print '</ul>';
    print '</div>';
    print "\n";
}

/**
 * Core function to output left menu eldy
 * Fill &$menu (example with $forcemainmenu='home' $forceleftmenu='all', return left menu tree of Home)
 *
 * @param DoliDB $db                Database handler
 * @param array  $menu_array_before Table of menu entries to show before entries of menu handler (menu->liste filled with menu->add)
 * @param array  $menu_array_after  Table of menu entries to show after entries of menu handler (menu->liste filled with menu->add)
 * @param array  $tabMenu           If array with menu entries already loaded, we put this array here (in most cases, it's empty)
 * @param Menu   $menu              Object Menu to return back list of menu entries
 * @param int    $noout             Disable output (Initialise &$menu only).
 * @param string $forcemainmenu     'x'=Force mainmenu to mainmenu='x'
 * @param string $forceleftmenu     'all'=Force leftmenu to '' (= all). If value come being '', we change it to value in session and 'none' if not defined in session.
 * @param array  $moredata          An array with more data to output
 * @param int    $type_user         0=Menu for backoffice, 1=Menu for front office
 *
 * @return    int                                Nb of menu entries
 */
function print_left_eldy_menu($db, $menu_array_before, $menu_array_after, &$tabMenu, &$menu, $noout = 0, $forcemainmenu = '', $forceleftmenu = '', $moredata = null, $type_user = 0)
{

    global $user, $conf, $langs, $dolibarr_main_db_name, $mysoc, $hookmanager;

    //var_dump($tabMenu);

    $newmenu = $menu;

    $mainmenu = ($forcemainmenu ? $forcemainmenu : $_SESSION["mainmenu"]);
    $leftmenu = ($forceleftmenu ? '' : (empty($_SESSION["leftmenu"]) ? 'none' : $_SESSION["leftmenu"]));

    $usemenuhider = 0;

    if (is_array($moredata) && !empty($moredata['searchform'])) {    // searchform can contains select2 code or link to show old search form or link to switch on search page
        print "\n";
        print "<!-- Begin SearchForm -->\n";
        print '<div id="blockvmenusearch" class="blockvmenusearch">' . "\n";
        print $moredata['searchform'];
        print '</div>' . "\n";
        print "<!-- End SearchForm -->\n";
    }

    if (is_array($moredata) && !empty($moredata['bookmarks'])) {
        print "\n";
        print "<!-- Begin Bookmarks -->\n";
        print '<div id="blockvmenubookmarks" class="blockvmenubookmarks">' . "\n";
        print $moredata['bookmarks'];
        print '</div>' . "\n";
        print "<!-- End Bookmarks -->\n";
    }

    $substitarray = getCommonSubstitutionArray($langs, 0, null, null);

    $listofmodulesforexternal = explode(',', $conf->global->MAIN_MODULES_FOR_EXTERNAL);

    /**
     * We update newmenu with entries found into database
     * --------------------------------------------------
     */
    if ($mainmenu) {    // If this is empty, loading hard coded menu and loading personalised menu will fail
        /*
         * Menu HOME
         */
        if ($mainmenu == 'home') {
            $langs->load("users");

            // Home - dashboard
            $newmenu->add(constant('BASE_URI') . '?mainmenu=home&leftmenu=home', $langs->trans("MyDashboard"), 0, 1, '', $mainmenu, 'home', 0, '', '', '', '<i class="fa fa-bar-chart fa-fw paddingright pictofixedwidth"></i>');

            // Setup
            $newmenu->add(constant('BASE_URI') . '?module=Admin&mainmenu=home&leftmenu=setup', $langs->trans("Setup"), 0, $user->admin, '', $mainmenu, 'setup', 0, '', '', '', '<i class="fa fa-tools fa-fw paddingright pictofixedwidth"></i>');

            if ($usemenuhider || empty($leftmenu) || $leftmenu == "setup") {
                // Load translation files required by the page
                $langs->loadLangs(["admin", "help"]);

                $warnpicto = '';
                if (empty($conf->global->MAIN_INFO_SOCIETE_NOM) || empty($conf->global->MAIN_INFO_SOCIETE_COUNTRY)) {
                    $langs->load("errors");
                    $warnpicto = img_warning($langs->trans("WarningMandatorySetupNotComplete"));
                }
                $newmenu->add(BASE_URI . "?module=Admin&controller=company&mainmenu=home", $langs->trans("MenuCompanySetup") . $warnpicto, 1);

                $warnpicto = '';
                if (count($conf->modules) <= (empty($conf->global->MAIN_MIN_NB_ENABLED_MODULE_FOR_WARNING) ? 1 : $conf->global->MAIN_MIN_NB_ENABLED_MODULE_FOR_WARNING)) {    // If only user module enabled
                    $langs->load("errors");
                    $warnpicto = img_warning($langs->trans("WarningMandatorySetupNotComplete"));
                }
                $newmenu->add(constant('BASE_URI') . '?module=Admin&controller=Modules&mainmenu=home', $langs->trans("Modules") . $warnpicto, 1);
                $newmenu->add(constant('BASE_URI') . '?module=Admin&controller=Ihm&mainmenu=home', $langs->trans("GUISetup"), 1);
                $newmenu->add(constant('BASE_URI') . '?module=Admin&controller=menus&mainmenu=home', $langs->trans("Menus"), 1);
                $newmenu->add(constant('BASE_URI') . '?module=Admin&controller=translation&mainmenu=home', $langs->trans("Translation"), 1);
                $newmenu->add(constant('BASE_URI') . '?module=Admin&controller=defaultvalues&mainmenu=home', $langs->trans("DefaultValues"), 1);
                $newmenu->add(constant('BASE_URI') . '?module=Admin&controller=boxes&mainmenu=home', $langs->trans("Boxes"), 1);
                $newmenu->add(constant('BASE_URI') . '?module=Admin&controller=delais&mainmenu=home', $langs->trans("MenuWarnings"), 1);
                $newmenu->add(constant('BASE_URI') . '?module=Admin&controller=security_other&mainmenu=home', $langs->trans("Security"), 1);
                $newmenu->add(constant('BASE_URI') . '?module=Admin&controller=limits&mainmenu=home', $langs->trans("MenuLimits"), 1);
                $newmenu->add(constant('BASE_URI') . '?module=Admin&controller=pdf&mainmenu=home', $langs->trans("PDF"), 1);

                $warnpicto = '';
                if (!empty($conf->global->MAIN_MAIL_SENDMODE) && $conf->global->MAIN_MAIL_SENDMODE == 'mail' && empty($conf->global->MAIN_HIDE_WARNING_TO_ENCOURAGE_SMTP_SETUP)) {
                    $langs->load("errors");
                    $warnpicto = img_warning($langs->trans("WarningPHPMailD"));
                }
                if (!empty($conf->global->MAIN_MAIL_SENDMODE) && in_array($conf->global->MAIN_MAIL_SENDMODE, ['smtps', 'swiftmail']) && empty($conf->global->MAIN_MAIL_SMTP_SERVER)) {
                    $langs->load("errors");
                    $warnpicto = img_warning($langs->trans("ErrorSetupOfEmailsNotComplete"));
                }

                $newmenu->add(constant('BASE_URI') . /* TODO */ "/admin/mails.php?mainmenu=home", $langs->trans("Emails") . $warnpicto, 1);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/admin/sms.php?mainmenu=home", $langs->trans("SMS"), 1);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/admin/dict.php?mainmenu=home", $langs->trans("Dictionary"), 1);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/admin/const.php?mainmenu=home", $langs->trans("OtherSetup"), 1);
            }

            // System tools
            $newmenu->add(constant('BASE_URI') . /* TODO */ "/admin/tools/index.php?mainmenu=home&amp;leftmenu=admintools", $langs->trans("AdminTools"), 0, $user->admin, '', $mainmenu, 'admintools', 0, '', '', '', '<i class="fa fa-server fa-fw paddingright pictofixedwidth"></i>');
            if ($usemenuhider || empty($leftmenu) || preg_match('/^admintools/', $leftmenu)) {
                // Load translation files required by the page
                $langs->loadLangs(['admin', 'help']);

                $newmenu->add('/admin/system/dolibarr.php?mainmenu=home&amp;leftmenu=admintools_info', $langs->trans('InfoDolibarr'), 1);
                if ($usemenuhider || empty($leftmenu) || $leftmenu == 'admintools_info') {
                    $newmenu->add('/admin/system/modules.php?mainmenu=home&amp;leftmenu=admintools_info', $langs->trans('Modules'), 2);
                    $newmenu->add('/admin/triggers.php?mainmenu=home&amp;leftmenu=admintools_info', $langs->trans('Triggers'), 2);
                    $newmenu->add('/admin/system/filecheck.php?mainmenu=home&amp;leftmenu=admintools_info', $langs->trans('FileCheck'), 2);
                }
                $newmenu->add('/admin/system/browser.php?mainmenu=home&amp;leftmenu=admintools', $langs->trans('InfoBrowser'), 1);
                $newmenu->add('/admin/system/os.php?mainmenu=home&amp;leftmenu=admintools', $langs->trans('InfoOS'), 1);
                $newmenu->add('/admin/system/web.php?mainmenu=home&amp;leftmenu=admintools', $langs->trans('InfoWebServer'), 1);
                $newmenu->add('/admin/system/phpinfo.php?mainmenu=home&amp;leftmenu=admintools', $langs->trans('InfoPHP'), 1);
                $newmenu->add('/admin/system/database.php?mainmenu=home&amp;leftmenu=admintools', $langs->trans('InfoDatabase'), 1);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/admin/system/perf.php?mainmenu=home&amp;leftmenu=admintools", $langs->trans("InfoPerf"), 1);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/admin/system/security.php?mainmenu=home&amp;leftmenu=admintools", $langs->trans("InfoSecurity"), 1);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/admin/tools/dolibarr_export.php?mainmenu=home&amp;leftmenu=admintools", $langs->trans("Backup"), 1);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/admin/tools/dolibarr_import.php?mainmenu=home&amp;leftmenu=admintools", $langs->trans("Restore"), 1);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/admin/tools/update.php?mainmenu=home&amp;leftmenu=admintools", $langs->trans("MenuUpgrade"), 1);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/admin/tools/purge.php?mainmenu=home&amp;leftmenu=admintools", $langs->trans("Purge"), 1);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/admin/tools/listevents.php?mainmenu=home&amp;leftmenu=admintools", $langs->trans("Audit"), 1);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/admin/tools/listsessions.php?mainmenu=home&amp;leftmenu=admintools", $langs->trans("Sessions"), 1);
                $newmenu->add('/admin/system/about.php?mainmenu=home&amp;leftmenu=admintools', $langs->trans('ExternalResources'), 1);

                if (!empty($conf->product->enabled) || !empty($conf->service->enabled)) {
                    $langs->load("products");
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/admin/product_tools.php?mainmenu=home&amp;leftmenu=admintools", $langs->trans("ProductVatMassChange"), 1, $user->admin);
                }
            }

            $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Users/home.php?leftmenu=users", $langs->trans("MenuUsersAndGroups"), 0, $user->rights->user->user->lire, '', $mainmenu, 'users', 0, '', '', '', img_picto('', 'user', 'class="paddingright pictofixedwidth"'));
            if ($user->rights->user->user->lire) {
                if ($usemenuhider || empty($leftmenu) || $leftmenu == "users") {
                    $newmenu->add(constant('BASE_URI') . "", $langs->trans("Users"), 1, $user->rights->user->user->lire || $user->admin);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Users/card.php?leftmenu=users&action=create", $langs->trans("NewUser"), 2, ($user->rights->user->user->creer || $user->admin) && !(!empty($conf->multicompany->enabled) && $conf->entity > 1 && $conf->global->MULTICOMPANY_TRANSVERSE_MODE), '', 'home');
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Users/list.php?leftmenu=users", $langs->trans("ListOfUsers"), 2, $user->rights->user->user->lire || $user->admin);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Users/hierarchy.php?leftmenu=users", $langs->trans("HierarchicView"), 2, $user->rights->user->user->lire || $user->admin);
                    if (!empty($conf->categorie->enabled)) {
                        $langs->load("categories");
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Categories/index.php?leftmenu=users&type=7", $langs->trans("UsersCategoriesShort"), 2, $user->rights->categorie->lire, '', $mainmenu, 'cat');
                    }
                    $newmenu->add(constant('BASE_URI') . "", $langs->trans("Groups"), 1, ($user->rights->user->user->lire || $user->admin) && !(!empty($conf->multicompany->enabled) && $conf->entity > 1 && $conf->global->MULTICOMPANY_TRANSVERSE_MODE));
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Users/group/card.php?leftmenu=users&action=create", $langs->trans("NewGroup"), 2, ((!empty($conf->global->MAIN_USE_ADVANCED_PERMS) ? $user->rights->user->group_advance->write : $user->rights->user->user->creer) || $user->admin) && !(!empty($conf->multicompany->enabled) && $conf->entity > 1 && $conf->global->MULTICOMPANY_TRANSVERSE_MODE));
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Users/group/list.php?leftmenu=users", $langs->trans("ListOfGroups"), 2, ((!empty($conf->global->MAIN_USE_ADVANCED_PERMS) ? $user->rights->user->group_advance->read : $user->rights->user->user->lire) || $user->admin) && !(!empty($conf->multicompany->enabled) && $conf->entity > 1 && $conf->global->MULTICOMPANY_TRANSVERSE_MODE));
                }
            }
        }

        /*
         * Menu THIRDPARTIES
         */
        if ($mainmenu == 'companies') {
            // Societes
            if (!empty($conf->societe->enabled)) {
                $langs->load("companies");
                // $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Societes/index.php?leftmenu=thirdparties", $langs->trans("ThirdParty"), 0, $user->rights->societe->lire, '', $mainmenu, 'thirdparties', 0, '', '', '', img_picto('', 'company', 'class="paddingright pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . "/index.php?Modules=societes&leftmenu=thirdparties", $langs->trans("ThirdParty"), 0, $user->rights->societe->lire, '', $mainmenu, 'thirdparties', 0, '', '', '', img_picto('', 'company', 'class="paddingright pictofixedwidth"'));

                if ($user->rights->societe->creer) {
                    $newmenu->add(constant('BASE_URI') . "index.php?module=societes&controller=card&action=create", $langs->trans("MenuNewThirdParty"), 1);
                    if (!$conf->use_javascript_ajax) {
                        $newmenu->add(constant('BASE_URI') . "index.php?module=societes&controller=card&action=create&amp;private=1", $langs->trans("MenuNewPrivateIndividual"), 1);
                    }
                }
            }

            $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Societes/list.php?leftmenu=thirdparties", $langs->trans("List"), 1);

            // Prospects
            if (!empty($conf->societe->enabled) && empty($conf->global->SOCIETE_DISABLE_PROSPECTS)) {
                $langs->load("commercial");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Societes/list.php?type=p&amp;leftmenu=prospects", $langs->trans("ListProspectsShort"), 2, $user->rights->societe->lire, '', $mainmenu, 'prospects');
                /* no more required, there is a filter that can do more
                if ($usemenuhider || empty($leftmenu) || $leftmenu=="prospects") $newmenu->add(constant('BASE_URI') . "/Modules/Societes/list.php?type=p&amp;sortfield=s.datec&amp;sortorder=desc&amp;begin=&amp;search_stcomm=-1", $langs->trans("LastProspectDoNotContact"), 2, $user->rights->societe->lire);
                if ($usemenuhider || empty($leftmenu) || $leftmenu=="prospects") $newmenu->add(constant('BASE_URI') "/Modules/Societes/list.php?type=p&amp;sortfield=s.datec&amp;sortorder=desc&amp;begin=&amp;search_stcomm=0", $langs->trans("LastProspectNeverContacted"), 2, $user->rights->societe->lire);
                if ($usemenuhider || empty($leftmenu) || $leftmenu=="prospects") $newmenu->add(constant('BASE_URI') "/Modules/Societes/list.php?type=p&amp;sortfield=s.datec&amp;sortorder=desc&amp;begin=&amp;search_stcomm=1", $langs->trans("LastProspectToContact"), 2, $user->rights->societe->lire);
                if ($usemenuhider || empty($leftmenu) || $leftmenu=="prospects") $newmenu->add(constant('BASE_URI') "/Modules/Societes/list.php?type=p&amp;sortfield=s.datec&amp;sortorder=desc&amp;begin=&amp;search_stcomm=2", $langs->trans("LastProspectContactInProcess"), 2, $user->rights->societe->lire);
                if ($usemenuhider || empty($leftmenu) || $leftmenu=="prospects") $newmenu->add(constant('BASE_URI') "/Modules/Societes/list.php?type=p&amp;sortfield=s.datec&amp;sortorder=desc&amp;begin=&amp;search_stcomm=3", $langs->trans("LastProspectContactDone"), 2, $user->rights->societe->lire);
                */
                $newmenu->add(constant('BASE_URI') . "index.php?module=societes&controller=card&leftmenu=prospects&amp;action=create&amp;type=p", $langs->trans("MenuNewProspect"), 3, $user->rights->societe->creer);
            }

            // Customers/Prospects
            if (!empty($conf->societe->enabled) && empty($conf->global->SOCIETE_DISABLE_CUSTOMERS)) {
                $langs->load("commercial");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Societes/list.php?type=c&amp;leftmenu=customers", $langs->trans("ListCustomersShort"), 2, $user->rights->societe->lire, '', $mainmenu, 'customers');

                $newmenu->add(constant('BASE_URI') . "index.php?module=societes&controller=card&leftmenu=customers&amp;action=create&amp;type=c", $langs->trans("MenuNewCustomer"), 3, $user->rights->societe->creer);
            }

            // Suppliers
            if (!empty($conf->societe->enabled) && (((!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || !empty($conf->supplier_order->enabled) || !empty($conf->supplier_invoice->enabled)) || !empty($conf->supplier_proposal->enabled))) {
                $langs->load("suppliers");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Societes/list.php?type=f&amp;leftmenu=suppliers", $langs->trans("ListSuppliersShort"), 2, ($user->rights->fournisseur->lire || $user->rights->supplier_order->lire || $user->rights->supplier_invoice->lire || $user->rights->supplier_proposal->lire), '', $mainmenu, 'suppliers');
                $newmenu->add(constant('BASE_URI') . "index.php?module=societes&controller=card&leftmenu=suppliers&amp;action=create&amp;type=f", $langs->trans("MenuNewSupplier"), 3, $user->rights->societe->creer && ($user->rights->fournisseur->lire || $user->rights->supplier_order->lire || $user->rights->supplier_invoice->lire || $user->rights->supplier_proposal->lire));
            }

            // Categories
            if (!empty($conf->categorie->enabled)) {
                $langs->load("categories");
                if (empty($conf->global->SOCIETE_DISABLE_PROSPECTS) || empty($conf->global->SOCIETE_DISABLE_CUSTOMERS)) {
                    // Categories prospects/customers
                    $menutoshow = $langs->trans("CustomersProspectsCategoriesShort");
                    if (!empty($conf->global->SOCIETE_DISABLE_PROSPECTS)) {
                        $menutoshow = $langs->trans("CustomersCategoriesShort");
                    }
                    if (!empty($conf->global->SOCIETE_DISABLE_CUSTOMERS)) {
                        $menutoshow = $langs->trans("ProspectsCategoriesShort");
                    }
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Categories/index.php?leftmenu=cat&amp;type=2", $menutoshow, 1, $user->rights->categorie->lire, '', $mainmenu, 'cat');
                }
                // Categories suppliers
                if ((!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || !empty($conf->supplier_order->enabled) || !empty($conf->supplier_invoice->enabled)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Categories/index.php?leftmenu=catfournish&amp;type=1", $langs->trans("SuppliersCategoriesShort"), 1, $user->rights->categorie->lire);
                }
            }

            // Contacts
            $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Societes/index.php?leftmenu=thirdparties", (!empty($conf->global->SOCIETE_ADDRESSES_MANAGEMENT) ? $langs->trans("Contacts") : $langs->trans("ContactsAddresses")), 0, $user->rights->societe->contact->lire, '', $mainmenu, 'contacts', 0, '', '', '', img_picto('', 'contact', 'class="paddingright pictofixedwidth"'));

            $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Contacts/card.php?leftmenu=contacts&amp;action=create", (!empty($conf->global->SOCIETE_ADDRESSES_MANAGEMENT) ? $langs->trans("NewContact") : $langs->trans("NewContactAddress")), 1, $user->rights->societe->contact->creer);
            $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Contacts/list.php?leftmenu=contacts", $langs->trans("List"), 1, $user->rights->societe->contact->lire);
            if (empty($conf->global->SOCIETE_DISABLE_PROSPECTS)) {
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Contacts/list.php?leftmenu=contacts&type=p", $langs->trans("Prospects"), 2, $user->rights->societe->contact->lire);
            }
            if (empty($conf->global->SOCIETE_DISABLE_CUSTOMERS)) {
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Contacts/list.php?leftmenu=contacts&type=c", $langs->trans("Customers"), 2, $user->rights->societe->contact->lire);
            }
            if ((!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || !empty($conf->supplier_order->enabled) || !empty($conf->supplier_invoice->enabled)) {
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Contacts/list.php?leftmenu=contacts&type=f", $langs->trans("Suppliers"), 2, $user->rights->societe->contact->lire);
            }
            $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Contacts/list.php?leftmenu=contacts&type=o", $langs->trans("ContactOthers"), 2, $user->rights->societe->contact->lire);
            //$newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Contacts/list.php?userid=$user->id", $langs->trans("MyContacts"), 1, $user->rights->societe->contact->lire);

            // Categories
            if (!empty($conf->categorie->enabled)) {
                $langs->load("categories");
                // Categories Contact
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Categories/index.php?leftmenu=catcontact&amp;type=4", $langs->trans("ContactCategoriesShort"), 1, $user->rights->categorie->lire, '', $mainmenu, 'cat');
            }
        }

        /*
         * Menu COMMERCIAL (propal, commande, supplier_proposal, supplier_order, contrat, ficheinter)
         */
        if ($mainmenu == 'commercial') {
            $langs->load("companies");

            // Customer proposal
            if (!empty($conf->propal->enabled)) {
                $langs->load("propal");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Comm/propal/index.php?leftmenu=propals", $langs->trans("Proposals"), 0, $user->rights->propale->lire, '', $mainmenu, 'propals', 100, '', '', '', img_picto('', 'propal', 'class="paddingright pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Comm/propal/card.php?action=create&amp;leftmenu=propals", $langs->trans("NewPropal"), 1, $user->rights->propale->creer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Comm/propal/list.php?leftmenu=propals", $langs->trans("List"), 1, $user->rights->propale->lire);
                if ($usemenuhider || empty($leftmenu) || $leftmenu == "propals") {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Comm/propal/list.php?leftmenu=propals&search_status=0", $langs->trans("PropalsDraft"), 2, $user->rights->propale->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Comm/propal/list.php?leftmenu=propals&search_status=1", $langs->trans("PropalsOpened"), 2, $user->rights->propale->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Comm/propal/list.php?leftmenu=propals&search_status=2", $langs->trans("PropalStatusSigned"), 2, $user->rights->propale->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Comm/propal/list.php?leftmenu=propals&search_status=3", $langs->trans("PropalStatusNotSigned"), 2, $user->rights->propale->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Comm/propal/list.php?leftmenu=propals&search_status=4", $langs->trans("PropalStatusBilled"), 2, $user->rights->propale->lire);
                    //$newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Comm/propal/list.php?leftmenu=propals&search_status=2,3,4", $langs->trans("PropalStatusClosedShort"), 2, $user->rights->propale->lire);
                }
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Comm/propal/stats/index.php?leftmenu=propals", $langs->trans("Statistics"), 1, $user->rights->propale->lire);
            }

            // Customers orders
            if (!empty($conf->commande->enabled)) {
                $langs->load("orders");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Commande/index.php?leftmenu=orders", $langs->trans("CustomersOrders"), 0, $user->rights->commande->lire, '', $mainmenu, 'orders', 200, '', '', '', img_picto('', 'order', 'class="paddingright pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Commande/card.php?action=create&amp;leftmenu=orders", $langs->trans("NewOrder"), 1, $user->rights->commande->creer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Commande/list.php?leftmenu=orders", $langs->trans("List"), 1, $user->rights->commande->lire);
                if ($usemenuhider || empty($leftmenu) || $leftmenu == "orders") {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Commande/list.php?leftmenu=orders&search_status=0", $langs->trans("StatusOrderDraftShort"), 2, $user->rights->commande->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Commande/list.php?leftmenu=orders&search_status=1", $langs->trans("StatusOrderValidated"), 2, $user->rights->commande->lire);
                    if (!empty($conf->expedition->enabled)) {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Commande/list.php?leftmenu=orders&search_status=2", $langs->trans("StatusOrderSentShort"), 2, $user->rights->commande->lire);
                    }
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Commande/list.php?leftmenu=orders&search_status=3", $langs->trans("StatusOrderDelivered"), 2, $user->rights->commande->lire);
                    //$newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Commande/list.php?leftmenu=orders&search_status=4", $langs->trans("StatusOrderProcessed"), 2, $user->rights->commande->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Commande/list.php?leftmenu=orders&search_status=-1", $langs->trans("StatusOrderCanceledShort"), 2, $user->rights->commande->lire);
                }
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Commande/stats/index.php?leftmenu=orders", $langs->trans("Statistics"), 1, $user->rights->commande->lire);
            }

            // Supplier proposal
            if (!empty($conf->supplier_proposal->enabled)) {
                $langs->load("supplier_proposal");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/SupplierProposal/index.php?leftmenu=propals_supplier", $langs->trans("SupplierProposalsShort"), 0, $user->rights->supplier_proposal->lire, '', $mainmenu, 'propals_supplier', 300, '', '', '', img_picto('', 'supplier_proposal', 'class="paddingright pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/SupplierProposal/card.php?action=create&amp;leftmenu=supplier_proposals", $langs->trans("SupplierProposalNew"), 1, $user->rights->supplier_proposal->creer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/SupplierProposal/list.php?leftmenu=supplier_proposals", $langs->trans("List"), 1, $user->rights->supplier_proposal->lire);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Comm/propal/stats/index.php?leftmenu=supplier_proposals&amp;mode=supplier", $langs->trans("Statistics"), 1, $user->rights->supplier_proposal->lire);
            }

            // Suppliers orders
            if (!empty($conf->supplier_order->enabled)) {
                $langs->load("orders");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/commande/index.php?leftmenu=orders_suppliers", $langs->trans("SuppliersOrders"), 0, $user->rights->fournisseur->commande->lire, '', $mainmenu, 'orders_suppliers', 400, '', '', '', img_picto('', 'supplier_order', 'class="paddingright pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/commande/card.php?action=create&amp;leftmenu=orders_suppliers", $langs->trans("NewSupplierOrderShort"), 1, $user->rights->fournisseur->commande->creer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/commande/list.php?leftmenu=orders_suppliers", $langs->trans("List"), 1, $user->rights->fournisseur->commande->lire);

                if ($usemenuhider || empty($leftmenu) || $leftmenu == "orders_suppliers") {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/commande/list.php?leftmenu=orders_suppliers&statut=0", $langs->trans("StatusSupplierOrderDraftShort"), 2, $user->rights->fournisseur->commande->lire);
                    if (empty($conf->global->SUPPLIER_ORDER_HIDE_VALIDATED)) {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/commande/list.php?leftmenu=orders_suppliers&statut=1", $langs->trans("StatusSupplierOrderValidated"), 2, $user->rights->fournisseur->commande->lire);
                    }
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/commande/list.php?leftmenu=orders_suppliers&statut=2", $langs->trans("StatusSupplierOrderApprovedShort"), 2, $user->rights->fournisseur->commande->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/commande/list.php?leftmenu=orders_suppliers&statut=3", $langs->trans("StatusSupplierOrderOnProcessShort"), 2, $user->rights->fournisseur->commande->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/commande/list.php?leftmenu=orders_suppliers&statut=4", $langs->trans("StatusSupplierOrderReceivedPartiallyShort"), 2, $user->rights->fournisseur->commande->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/commande/list.php?leftmenu=orders_suppliers&statut=5", $langs->trans("StatusSupplierOrderReceivedAll"), 2, $user->rights->fournisseur->commande->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/commande/list.php?leftmenu=orders_suppliers&statut=6,7", $langs->trans("StatusSupplierOrderCanceled"), 2, $user->rights->fournisseur->commande->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/commande/list.php?leftmenu=orders_suppliers&statut=9", $langs->trans("StatusSupplierOrderRefused"), 2, $user->rights->fournisseur->commande->lire);
                }
                // Billed is another field. We should add instead a dedicated filter on list. if ($usemenuhider || empty($leftmenu) || $leftmenu=="orders_suppliers") $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/commande/list.php?leftmenu=orders_suppliers&billed=1", $langs->trans("Billed"), 2, $user->rights->fournisseur->commande->lire);

                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Commande/stats/index.php?leftmenu=orders_suppliers&amp;mode=supplier", $langs->trans("Statistics"), 1, $user->rights->fournisseur->commande->lire);
            }

            // Contrat
            if (!empty($conf->contrat->enabled)) {
                $langs->load("contracts");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Contracts/index.php?leftmenu=contracts", $langs->trans("ContractsSubscriptions"), 0, $user->rights->contrat->lire, '', $mainmenu, 'contracts', 2000, '', '', '', img_picto('', 'contract', 'class="paddingright pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Contracts/card.php?action=create&amp;leftmenu=contracts", $langs->trans("NewContractSubscription"), 1, $user->rights->contrat->creer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Contracts/list.php?leftmenu=contracts", $langs->trans("List"), 1, $user->rights->contrat->lire);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Contracts/services_list.php?leftmenu=contracts", $langs->trans("MenuServices"), 1, $user->rights->contrat->lire);
                if ($usemenuhider || empty($leftmenu) || $leftmenu == "contracts") {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Contracts/services_list.php?leftmenu=contracts&amp;mode=0", $langs->trans("MenuInactiveServices"), 2, $user->rights->contrat->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Contracts/services_list.php?leftmenu=contracts&amp;mode=4", $langs->trans("MenuRunningServices"), 2, $user->rights->contrat->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Contracts/services_list.php?leftmenu=contracts&amp;mode=4&amp;filter=expired", $langs->trans("MenuExpiredServices"), 2, $user->rights->contrat->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Contracts/services_list.php?leftmenu=contracts&amp;mode=5", $langs->trans("MenuClosedServices"), 2, $user->rights->contrat->lire);
                }
            }

            // Interventions
            if (!empty($conf->ficheinter->enabled)) {
                $langs->load("interventions");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fichinter/index.php?leftmenu=ficheinter", $langs->trans("Interventions"), 0, $user->rights->ficheinter->lire, '', $mainmenu, 'ficheinter', 2200, '', '', '', img_picto('', 'intervention', 'class="paddingright pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fichinter/card.php?action=create&amp;leftmenu=ficheinter", $langs->trans("NewIntervention"), 1, $user->rights->ficheinter->creer, '', '', '', 201);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fichinter/list.php?leftmenu=ficheinter", $langs->trans("List"), 1, $user->rights->ficheinter->lire, '', '', '', 202);
                if ($conf->global->MAIN_FEATURES_LEVEL >= 2) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fichinter/card-rec.php?leftmenu=ficheinter", $langs->trans("ListOfTemplates"), 1, $user->rights->ficheinter->lire, '', '', '', 203);
                }
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fichinter/stats/index.php?leftmenu=ficheinter", $langs->trans("Statistics"), 1, $user->rights->ficheinter->lire);
            }
        }

        /*
         * Menu COMPTA-FINANCIAL
         */
        if ($mainmenu == 'billing') {
            $langs->load("companies");

            // Customers invoices
            if (!empty($conf->facture->enabled)) {
                $langs->load("bills");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/facture/index.php?leftmenu=customers_bills", $langs->trans("BillsCustomers"), 0, $user->rights->facture->lire, '', $mainmenu, 'customers_bills', 0, '', '', '', img_picto('', 'bill', 'class="paddingright pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/facture/card.php?action=create", $langs->trans("NewBill"), 1, $user->rights->facture->creer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/facture/list.php?leftmenu=customers_bills", $langs->trans("List"), 1, $user->rights->facture->lire, '', $mainmenu, 'customers_bills_list');

                if ($usemenuhider || empty($leftmenu) || preg_match('/customers_bills(|_draft|_notpaid|_paid|_canceled)$/', $leftmenu)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/facture/list.php?leftmenu=customers_bills_draft&amp;search_status=0", $langs->trans("BillShortStatusDraft"), 2, $user->rights->facture->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/facture/list.php?leftmenu=customers_bills_notpaid&amp;search_status=1", $langs->trans("BillShortStatusNotPaid"), 2, $user->rights->facture->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/facture/list.php?leftmenu=customers_bills_paid&amp;search_status=2", $langs->trans("BillShortStatusPaid"), 2, $user->rights->facture->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/facture/list.php?leftmenu=customers_bills_canceled&amp;search_status=3", $langs->trans("BillShortStatusCanceled"), 2, $user->rights->facture->lire);
                }
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/facture/invoicetemplate_list.php?leftmenu=customers_bills_templates", $langs->trans("ListOfTemplates"), 1, $user->rights->facture->creer, '', $mainmenu, 'customers_bills_templates'); // No need to see recurring invoices, if user has no permission to create invoice.

                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/paiement/list.php?leftmenu=customers_bills_payment", $langs->trans("Payments"), 1, $user->rights->facture->lire, '', $mainmenu, 'customers_bills_payment');

                if (!empty($conf->global->BILL_ADD_PAYMENT_VALIDATION)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/paiement/tovalidate.php?leftmenu=customers_bills_tovalid", $langs->trans("MenuToValid"), 2, $user->rights->facture->lire, '', $mainmenu, 'customer_bills_tovalid');
                }
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/paiement/rapport.php?leftmenu=customers_bills_reports", $langs->trans("Reportings"), 2, $user->rights->facture->lire, '', $mainmenu, 'customers_bills_reports');

                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/facture/stats/index.php?leftmenu=customers_bills_stats", $langs->trans("Statistics"), 1, $user->rights->facture->lire, '', $mainmenu, 'customers_bills_stats');
            }

            // Suppliers invoices
            if (!empty($conf->societe->enabled) && !empty($conf->supplier_invoice->enabled)) {
                $langs->load("bills");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/facture/index.php?leftmenu=suppliers_bills", $langs->trans("BillsSuppliers"), 0, $user->rights->fournisseur->facture->lire, '', $mainmenu, 'suppliers_bills', 0, '', '', '', img_picto('', 'supplier_invoice', 'class="paddingright pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/facture/card.php?leftmenu=suppliers_bills&amp;action=create", $langs->trans("NewBill"), 1, ($user->rights->fournisseur->facture->creer || $user->rights->supplier_invoice->creer), '', $mainmenu, 'suppliers_bills_create');
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/facture/list.php?leftmenu=suppliers_bills", $langs->trans("List"), 1, $user->rights->fournisseur->facture->lire, '', $mainmenu, 'suppliers_bills_list');

                if ($usemenuhider || empty($leftmenu) || preg_match('/suppliers_bills/', $leftmenu)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/facture/list.php?leftmenu=suppliers_bills_draft&amp;search_status=0", $langs->trans("BillShortStatusDraft"), 2, $user->rights->fournisseur->facture->lire, '', $mainmenu, 'suppliers_bills_draft');
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/facture/list.php?leftmenu=suppliers_bills_notpaid&amp;search_status=1", $langs->trans("BillShortStatusNotPaid"), 2, $user->rights->fournisseur->facture->lire, '', $mainmenu, 'suppliers_bills_notpaid');
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/facture/list.php?leftmenu=suppliers_bills_paid&amp;search_status=2", $langs->trans("BillShortStatusPaid"), 2, $user->rights->fournisseur->facture->lire, '', $mainmenu, 'suppliers_bills_paid');
                }

                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/paiement/list.php?leftmenu=suppliers_bills_payment", $langs->trans("Payments"), 1, $user->rights->fournisseur->facture->lire, '', $mainmenu, 'suppliers_bills_payment');

                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/facture/rapport.php?leftmenu=suppliers_bills_report", $langs->trans("Reportings"), 2, $user->rights->fournisseur->facture->lire, '', $mainmenu, 'suppliers_bills_report');

                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/facture/stats/index.php?mode=supplier&amp;leftmenu=suppliers_bills_stats", $langs->trans("Statistics"), 1, $user->rights->fournisseur->facture->lire, '', $mainmenu, 'suppliers_bills_stats');
            }

            // Orders
            if (!empty($conf->commande->enabled)) {
                $langs->load("orders");
                if (!empty($conf->facture->enabled)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Commande/list.php?leftmenu=orders&amp;search_status=-3&amp;billed=0&amp;contextpage=billableorders", $langs->trans("MenuOrdersToBill2"), 0, $user->rights->commande->lire, '', $mainmenu, 'orders', 0, '', '', '', img_picto('', 'order', 'class="paddingright pictofixedwidth"'));
                }
                //if ($usemenuhider || empty($leftmenu) || $leftmenu=="orders") $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Commande/", $langs->trans("StatusOrderToBill"), 1, $user->rights->commande->lire);
            }

            // Supplier Orders to bill
            if (!empty($conf->supplier_invoice->enabled)) {
                if (!empty($conf->global->SUPPLIER_MENU_ORDER_RECEIVED_INTO_INVOICE)) {
                    $langs->load("supplier");
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Fourn/commande/list.php?leftmenu=orders&amp;search_status=5&amp;billed=0", $langs->trans("MenuOrdersSupplierToBill"), 0, $user->rights->commande->lire, '', $mainmenu, 'orders', 0, '', '', '', img_picto('', 'supplier_order', 'class="paddingright pictofixedwidth"'));
                    //if ($usemenuhider || empty($leftmenu) || $leftmenu=="orders") $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Commande/", $langs->trans("StatusOrderToBill"), 1, $user->rights->commande->lire);
                }
            }

            // Donations
            if (!empty($conf->don->enabled)) {
                $langs->load("donations");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Don/index.php?leftmenu=donations&amp;mainmenu=billing", $langs->trans("Donations"), 0, $user->rights->don->lire, '', $mainmenu, 'donations', 0, '', '', '', img_picto('', 'donation', 'class="paddingright pictofixedwidth"'));
                if ($usemenuhider || empty($leftmenu) || $leftmenu == "donations") {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Don/card.php?leftmenu=donations&amp;action=create", $langs->trans("NewDonation"), 1, $user->rights->don->creer);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Don/list.php?leftmenu=donations", $langs->trans("List"), 1, $user->rights->don->lire);
                }
                // if ($leftmenu=="donations") $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Don/stats/index.php",$langs->trans("Statistics"), 1, $user->rights->don->lire);
            }

            // Taxes and social contributions
            if (!empty($conf->tax->enabled)) {
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/charges/index.php?leftmenu=tax&amp;mainmenu=billing", $langs->trans("MenuTaxesAndSpecialExpenses"), 0, $user->rights->tax->charges->lire, '', $mainmenu, 'tax', 0, '', '', '', img_picto('', 'payment', 'class="paddingright pictofixedwidth"'));

                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/sociales/list.php?leftmenu=tax_social", $langs->trans("MenuSocialContributions"), 1, $user->rights->tax->charges->lire);
                if ($usemenuhider || empty($leftmenu) || preg_match('/^tax_social/i', $leftmenu)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/sociales/card.php?leftmenu=tax_social&action=create", $langs->trans("MenuNewSocialContribution"), 2, $user->rights->tax->charges->creer);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/sociales/list.php?leftmenu=tax_social", $langs->trans("List"), 2, $user->rights->tax->charges->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/sociales/payments.php?leftmenu=tax_social&amp;mainmenu=billing", $langs->trans("Payments"), 2, $user->rights->tax->charges->lire);
                }
                // VAT
                if (empty($conf->global->TAX_DISABLE_VAT_MENUS)) {
                    global $mysoc;

                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/tva/list.php?leftmenu=tax_vat&amp;mainmenu=billing", $langs->transcountry("VAT", $mysoc->country_code), 1, $user->rights->tax->charges->lire, '', $mainmenu, 'tax_vat');
                    if ($usemenuhider || empty($leftmenu) || preg_match('/^tax_vat/i', $leftmenu)) {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/tva/card.php?leftmenu=tax_vat&action=create", $langs->trans("New"), 2, $user->rights->tax->charges->creer);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/tva/list.php?leftmenu=tax_vat", $langs->trans("List"), 2, $user->rights->tax->charges->lire);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/tva/payments.php?mode=tvaonly&amp;leftmenu=tax_vat", $langs->trans("Payments"), 2, $user->rights->tax->charges->lire);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/tva/index.php?leftmenu=tax_vat", $langs->trans("ReportByMonth"), 2, $user->rights->tax->charges->lire);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/tva/clients.php?leftmenu=tax_vat", $langs->trans("ReportByThirdparties"), 2, $user->rights->tax->charges->lire);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/tva/quadri_detail.php?leftmenu=tax_vat", $langs->trans("ReportByQuarter"), 2, $user->rights->tax->charges->lire);
                    }

                    //Local Taxes 1
                    if ($mysoc->useLocalTax(1) && (isset($mysoc->localtax1_assuj) && $mysoc->localtax1_assuj == "1")) {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/localtax/list.php?leftmenu=tax_1_vat&amp;mainmenu=billing&amp;localTaxType=1", $langs->transcountry("LT1", $mysoc->country_code), 1, $user->rights->tax->charges->lire);
                        if ($usemenuhider || empty($leftmenu) || preg_match('/^tax_1_vat/i', $leftmenu)) {
                            $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/localtax/card.php?leftmenu=tax_1_vat&action=create&amp;localTaxType=1", $langs->trans("New"), 2, $user->rights->tax->charges->creer);
                            $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/localtax/list.php?leftmenu=tax_1_vat&amp;localTaxType=1", $langs->trans("List"), 2, $user->rights->tax->charges->lire);
                            $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/localtax/index.php?leftmenu=tax_1_vat&amp;localTaxType=1", $langs->trans("ReportByMonth"), 2, $user->rights->tax->charges->lire);
                            $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/localtax/clients.php?leftmenu=tax_1_vat&amp;localTaxType=1", $langs->trans("ReportByThirdparties"), 2, $user->rights->tax->charges->lire);
                            $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/localtax/quadri_detail.php?leftmenu=tax_1_vat&amp;localTaxType=1", $langs->trans("ReportByQuarter"), 2, $user->rights->tax->charges->lire);
                        }
                    }
                    //Local Taxes 2
                    if ($mysoc->useLocalTax(2) && (isset($mysoc->localtax2_assuj) && $mysoc->localtax2_assuj == "1")) {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/localtax/list.php?leftmenu=tax_2_vat&amp;mainmenu=billing&amp;localTaxType=2", $langs->transcountry("LT2", $mysoc->country_code), 1, $user->rights->tax->charges->lire);
                        if ($usemenuhider || empty($leftmenu) || preg_match('/^tax_2_vat/i', $leftmenu)) {
                            $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/localtax/card.php?leftmenu=tax_2_vat&action=create&amp;localTaxType=2", $langs->trans("New"), 2, $user->rights->tax->charges->creer);
                            $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/localtax/list.php?leftmenu=tax_2_vat&amp;localTaxType=2", $langs->trans("List"), 2, $user->rights->tax->charges->lire);
                            $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/localtax/index.php?leftmenu=tax_2_vat&amp;localTaxType=2", $langs->trans("ReportByMonth"), 2, $user->rights->tax->charges->lire);
                            $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/localtax/clients.php?leftmenu=tax_2_vat&amp;localTaxType=2", $langs->trans("ReportByThirdparties"), 2, $user->rights->tax->charges->lire);
                            $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/localtax/quadri_detail.php?leftmenu=tax_2_vat&amp;localTaxType=2", $langs->trans("ReportByQuarter"), 2, $user->rights->tax->charges->lire);
                        }
                    }
                }
            }

            // Salaries
            if (!empty($conf->salaries->enabled)) {
                $langs->load("salaries");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/salaries/list.php?leftmenu=tax_salary&amp;mainmenu=billing", $langs->trans("Salaries"), 0, $user->rights->salaries->read, '', $mainmenu, 'tax_salary', 0, '', '', '', img_picto('', 'salary', 'class="paddingright pictofixedwidth"'));
                if ($usemenuhider || empty($leftmenu) || preg_match('/^tax_salary/i', $leftmenu)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/salaries/card.php?leftmenu=tax_salary&action=create", $langs->trans("New"), 1, $user->rights->salaries->write);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/salaries/list.php?leftmenu=tax_salary", $langs->trans("List"), 1, $user->rights->salaries->read);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/salaries/payments.php?leftmenu=tax_salary", $langs->trans("Payments"), 1, $user->rights->salaries->read);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/salaries/stats/index.php?leftmenu=tax_salary", $langs->trans("Statistics"), 1, $user->rights->salaries->read);
                }
            }

            // Loan
            if (!empty($conf->loan->enabled)) {
                $langs->load("loan");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/loan/list.php?leftmenu=tax_loan&amp;mainmenu=billing", $langs->trans("Loans"), 0, $user->rights->loan->read, '', $mainmenu, 'tax_loan', 0, '', '', '', img_picto('', 'loan', 'class="paddingright pictofixedwidth"'));
                if ($usemenuhider || empty($leftmenu) || preg_match('/^tax_loan/i', $leftmenu)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/loan/card.php?leftmenu=tax_loan&action=create", $langs->trans("NewLoan"), 1, $user->rights->loan->write);
                    //$newmenu->add(constant('BASE_URI') . /* TODO */ "/loan/payment/list.php?leftmenu=tax_loan",$langs->trans("Payments"),2,$user->rights->loan->read);
                }
            }

            // Various payment
            if (!empty($conf->banque->enabled) && empty($conf->global->BANK_USE_OLD_VARIOUS_PAYMENT)) {
                $langs->load("banks");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/bank/various_payment/list.php?leftmenu=tax_various&amp;mainmenu=billing", $langs->trans("MenuVariousPayment"), 0, $user->rights->banque->lire, '', $mainmenu, 'tax_various', 0, '', '', '', img_picto('', 'payment', 'class="paddingright pictofixedwidth"'));
                if ($usemenuhider || empty($leftmenu) || preg_match('/^tax_various/i', $leftmenu)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/bank/various_payment/card.php?leftmenu=tax_various&action=create", $langs->trans("New"), 1, $user->rights->banque->modifier);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/bank/various_payment/list.php?leftmenu=tax_various", $langs->trans("List"), 1, $user->rights->banque->lire);
                }
            }
        }

        /*
         * Menu COMPTA-FINANCIAL
         */
        if ($mainmenu == 'accountancy') {
            $langs->load("companies");

            // Accounting (Double entries)
            if (!empty($conf->accounting->enabled)) {
                //$permtoshowmenu = (!empty($conf->accounting->enabled) || $user->rights->accounting->bind->write || $user->rights->compta->resultat->lire);
                //$newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/index.php?leftmenu=accountancy", $langs->trans("MenuAccountancy"), 0, $permtoshowmenu, '', $mainmenu, 'accountancy');

                // Configuration
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/index.php?leftmenu=accountancy_admin", $langs->trans("Setup"), 0, $user->rights->accounting->chartofaccount, '', $mainmenu, 'accountancy_admin', 1, '', '', '', img_picto('', 'technic', 'class="paddingright pictofixedwidth"'));
                if ($usemenuhider || empty($leftmenu) || preg_match('/accountancy_admin/', $leftmenu)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/admin/index.php?mainmenu=accountancy&leftmenu=accountancy_admin", $langs->trans("General"), 1, $user->rights->accounting->chartofaccount, '', $mainmenu, 'accountancy_admin_general', 10);

                    // Fiscal year - Not really yet used. In a future will lock some periods.
                    if ($conf->global->MAIN_FEATURES_LEVEL > 1) {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/admin/fiscalyear.php?mainmenu=accountancy&leftmenu=accountancy_admin", $langs->trans("FiscalPeriod"), 1, $user->rights->accounting->fiscalyear->write, '', $mainmenu, 'fiscalyear', 20);
                    }

                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/admin/journals_list.php?id=35&mainmenu=accountancy&leftmenu=accountancy_admin", $langs->trans("AccountingJournals"), 1, $user->rights->accounting->chartofaccount, '', $mainmenu, 'accountancy_admin_journal', 30);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/admin/accountmodel.php?id=31&mainmenu=accountancy&leftmenu=accountancy_admin", $langs->trans("Pcg_version"), 1, $user->rights->accounting->chartofaccount, '', $mainmenu, 'accountancy_admin_chartmodel', 40);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/admin/account.php?mainmenu=accountancy&leftmenu=accountancy_admin", $langs->trans("Chartofaccounts"), 1, $user->rights->accounting->chartofaccount, '', $mainmenu, 'accountancy_admin_chart', 41);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/admin/subaccount.php?mainmenu=accountancy&leftmenu=accountancy_admin", $langs->trans("ChartOfSubaccounts"), 1, $user->rights->accounting->chartofaccount, '', $mainmenu, 'accountancy_admin_chart', 41);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/admin/categories_list.php?id=32&search_country_id=" . $mysoc->country_id . "&mainmenu=accountancy&leftmenu=accountancy_admin", $langs->trans("AccountingCategory"), 1, $user->rights->accounting->chartofaccount, '', $mainmenu, 'accountancy_admin_chart', 50);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/admin/defaultaccounts.php?mainmenu=accountancy&leftmenu=accountancy_admin", $langs->trans("MenuDefaultAccounts"), 1, $user->rights->accounting->chartofaccount, '', $mainmenu, 'accountancy_admin_default', 60);
                    if (!empty($conf->banque->enabled)) {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/bank/list.php?mainmenu=accountancy&leftmenu=accountancy_admin&search_status=-1", $langs->trans("MenuBankAccounts"), 1, $user->rights->accounting->chartofaccount, '', $mainmenu, 'accountancy_admin_bank', 70);
                    }
                    if (!empty($conf->facture->enabled) || ((!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || !empty($conf->supplier_invoice->enabled))) {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/admin/dict.php?id=10&from=accountancy&search_country_id=" . $mysoc->country_id . "&mainmenu=accountancy&leftmenu=accountancy_admin", $langs->trans("MenuVatAccounts"), 1, $user->rights->accounting->chartofaccount, '', $mainmenu, 'accountancy_admin_default', 80);
                    }
                    if (!empty($conf->tax->enabled)) {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/admin/dict.php?id=7&from=accountancy&search_country_id=" . $mysoc->country_id . "&mainmenu=accountancy&leftmenu=accountancy_admin", $langs->trans("MenuTaxAccounts"), 1, $user->rights->accounting->chartofaccount, '', $mainmenu, 'accountancy_admin_default', 90);
                    }
                    if (!empty($conf->expensereport->enabled)) {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/admin/dict.php?id=17&from=accountancy&mainmenu=accountancy&leftmenu=accountancy_admin", $langs->trans("MenuExpenseReportAccounts"), 1, $user->rights->accounting->chartofaccount, '', $mainmenu, 'accountancy_admin_default', 100);
                    }
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/admin/productaccount.php?mainmenu=accountancy&leftmenu=accountancy_admin", $langs->trans("MenuProductsAccounts"), 1, $user->rights->accounting->chartofaccount, '', $mainmenu, 'accountancy_admin_product', 110);
                    if ($conf->global->MAIN_FEATURES_LEVEL > 1) {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/admin/closure.php?mainmenu=accountancy&leftmenu=accountancy_admin", $langs->trans("MenuClosureAccounts"), 1, $user->rights->accounting->chartofaccount, '', $mainmenu, 'accountancy_admin_closure', 120);
                    }
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/admin/export.php?mainmenu=accountancy&leftmenu=accountancy_admin", $langs->trans("ExportOptions"), 1, $user->rights->accounting->chartofaccount, '', $mainmenu, 'accountancy_admin_export', 130);
                }

                // Transfer in accounting
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/index.php?leftmenu=accountancy_transfer", $langs->trans("TransferInAccounting"), 0, $user->rights->accounting->bind->write, '', $mainmenu, 'transfer', 1, '', '', '', img_picto('', 'long-arrow-alt-right', 'class="paddingright pictofixedwidth"'));

                // Binding
                // $newmenu->add(constant('BASE_URI') . "", $langs->trans("Binding"), 0, $user->rights->accounting->bind->write, '', $mainmenu, 'dispatch');
                if (!empty($conf->facture->enabled) && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_SALES)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/customer/index.php?leftmenu=accountancy_dispatch_customer&amp;mainmenu=accountancy", $langs->trans("CustomersVentilation"), 1, $user->rights->accounting->bind->write, '', $mainmenu, 'dispatch_customer');
                    if ($usemenuhider || empty($leftmenu) || preg_match('/accountancy_dispatch_customer/', $leftmenu)) {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/customer/list.php?mainmenu=accountancy&amp;leftmenu=accountancy_dispatch_customer", $langs->trans("ToBind"), 2, $user->rights->accounting->bind->write);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/customer/lines.php?mainmenu=accountancy&amp;leftmenu=accountancy_dispatch_customer", $langs->trans("Binded"), 2, $user->rights->accounting->bind->write);
                    }
                }
                if (!empty($conf->supplier_invoice->enabled) && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_PURCHASES)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/supplier/index.php?leftmenu=accountancy_dispatch_supplier&amp;mainmenu=accountancy", $langs->trans("SuppliersVentilation"), 1, $user->rights->accounting->bind->write, '', $mainmenu, 'dispatch_supplier');
                    if ($usemenuhider || empty($leftmenu) || preg_match('/accountancy_dispatch_supplier/', $leftmenu)) {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/supplier/list.php?mainmenu=accountancy&amp;leftmenu=accountancy_dispatch_supplier", $langs->trans("ToBind"), 2, $user->rights->accounting->bind->write);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/supplier/lines.php?mainmenu=accountancy&amp;leftmenu=accountancy_dispatch_supplier", $langs->trans("Binded"), 2, $user->rights->accounting->bind->write);
                    }
                }
                if (!empty($conf->expensereport->enabled) && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_EXPENSEREPORTS)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/expensereport/index.php?leftmenu=accountancy_dispatch_expensereport&amp;mainmenu=accountancy", $langs->trans("ExpenseReportsVentilation"), 1, $user->rights->accounting->bind->write, '', $mainmenu, 'dispatch_expensereport');
                    if ($usemenuhider || empty($leftmenu) || preg_match('/accountancy_dispatch_expensereport/', $leftmenu)) {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/expensereport/list.php?mainmenu=accountancy&amp;leftmenu=accountancy_dispatch_expensereport", $langs->trans("ToBind"), 2, $user->rights->accounting->bind->write);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/expensereport/lines.php?mainmenu=accountancy&amp;leftmenu=accountancy_dispatch_expensereport", $langs->trans("Binded"), 2, $user->rights->accounting->bind->write);
                    }
                }

                // Journals
                if (!empty($conf->accounting->enabled) && !empty($user->rights->accounting->comptarapport->lire) && $mainmenu == 'accountancy') {
                    $newmenu->add('', $langs->trans("RegistrationInAccounting"), 1, $user->rights->accounting->comptarapport->lire, '', '', '');

                    // Multi journal
                    $sql = "SELECT rowid, code, label, nature";
                    $sql .= " FROM " . MAIN_DB_PREFIX . "accounting_journal";
                    $sql .= " WHERE entity = " . $conf->entity;
                    $sql .= " AND active = 1";
                    $sql .= " ORDER BY nature ASC, label DESC";

                    $resql = $db->query($sql);
                    if ($resql) {
                        $numr = $db->num_rows($resql);
                        $i = 0;

                        if ($numr > 0) {
                            while ($i < $numr) {
                                $objp = $db->fetch_object($resql);

                                $nature = '';

                                // Must match array $sourceList defined into journals_list.php
                                if ($objp->nature == 2 && !empty($conf->facture->enabled) && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_SALES)) {
                                    $nature = "sells";
                                }
                                if ($objp->nature == 3
                                    && ((!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || !empty($conf->supplier_invoice->enabled))
                                    && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_PURCHASES)) {
                                    $nature = "purchases";
                                }
                                if ($objp->nature == 4 && !empty($conf->banque->enabled)) {
                                    $nature = "bank";
                                }
                                if ($objp->nature == 5 && !empty($conf->expensereport->enabled) && empty($conf->global->ACCOUNTING_DISABLE_BINDING_ON_EXPENSEREPORTS)) {
                                    $nature = "expensereports";
                                }
                                if ($objp->nature == 1) {
                                    $nature = "various";
                                }
                                if ($objp->nature == 8) {
                                    $nature = "inventory";
                                }
                                if ($objp->nature == 9) {
                                    $nature = "hasnew";
                                }

                                // To enable when page exists
                                if (empty($conf->global->ACCOUNTANCY_SHOW_DEVELOP_JOURNAL)) {
                                    if ($nature == 'various' || $nature == 'hasnew' || $nature == 'inventory') {
                                        $nature = '';
                                    }
                                }

                                if ($nature) {
                                    $langs->load('accountancy');
                                    $journallabel = $langs->transnoentities($objp->label); // Labels in this table are set by loading llx_accounting_abc.sql. Label can be 'ACCOUNTING_SELL_JOURNAL', 'InventoryJournal', ...
                                    $newmenu->add('/Modules/Accountancy/journal/' . $nature . 'journal.php?mainmenu=accountancy&leftmenu=accountancy_journal&id_journal=' . $objp->rowid, $journallabel, 2, $user->rights->accounting->comptarapport->lire);
                                }
                                $i++;
                            }
                        } else {
                            // Should not happend. Entries are added
                            $newmenu->add('', $langs->trans("NoJournalDefined"), 2, $user->rights->accounting->comptarapport->lire);
                        }
                    } else {
                        dol_print_error($db);
                    }
                    $db->free($resql);
                }

                // Accounting
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/index.php?leftmenu=accountancy_accountancy", $langs->trans("MenuAccountancy"), 0, $user->rights->accounting->mouvements->lire || $user->rights->accounting->comptarapport->lire, '', $mainmenu, 'accountancy', 1, '', '', '', img_picto('', 'accountancy', 'class="paddingright pictofixedwidth"'));

                // General Ledger
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/bookkeeping/listbyaccount.php?mainmenu=accountancy&amp;leftmenu=accountancy_accountancy", $langs->trans("Bookkeeping"), 1, $user->rights->accounting->mouvements->lire);

                // Journals
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/bookkeeping/list.php?mainmenu=accountancy&amp;leftmenu=accountancy_accountancy", $langs->trans("Journals"), 1, $user->rights->accounting->mouvements->lire);

                // Account Balance
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/bookkeeping/balance.php?mainmenu=accountancy&amp;leftmenu=accountancy_accountancy", $langs->trans("AccountBalance"), 1, $user->rights->accounting->mouvements->lire);

                // Files
                if (empty($conf->global->ACCOUNTANCY_HIDE_EXPORT_FILES_MENU)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/accounting-files.php?mainmenu=accountancy&amp;leftmenu=accountancy_files", $langs->trans("AccountantFiles"), 1, $user->rights->accounting->mouvements->lire);
                }

                // Closure
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/closure/index.php?mainmenu=accountancy&amp;leftmenu=accountancy_closure", $langs->trans("MenuAccountancyClosure"), 1, $user->rights->accounting->fiscalyear->write, '', $mainmenu, 'closure');

                // Reports
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Accountancy/index.php?leftmenu=accountancy_report", $langs->trans("Reportings"), 1, $user->rights->accounting->comptarapport->lire, '', $mainmenu, 'ca');

                if ($usemenuhider || empty($leftmenu) || preg_match('/accountancy_report/', $leftmenu)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/resultat/index.php?leftmenu=accountancy_report", $langs->trans("MenuReportInOut"), 2, $user->rights->accounting->comptarapport->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/resultat/clientfourn.php?leftmenu=accountancy_report", $langs->trans("ByPredefinedAccountGroups"), 3, $user->rights->accounting->comptarapport->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/resultat/result.php?leftmenu=accountancy_report", $langs->trans("ByPersonalizedAccountGroups"), 3, $user->rights->accounting->comptarapport->lire);
                }

                $modecompta = 'CREANCES-DETTES';
                if (!empty($conf->accounting->enabled) && !empty($user->rights->accounting->comptarapport->lire) && $mainmenu == 'accountancy') {
                    $modecompta = 'BOOKKEEPING'; // Not yet implemented. Should be BOOKKEEPINGCOLLECTED
                }
                if ($modecompta) {
                    if ($usemenuhider || empty($leftmenu) || preg_match('/accountancy_report/', $leftmenu)) {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/index.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ReportTurnover"), 2, $user->rights->accounting->comptarapport->lire);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/casoc.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ByCompanies"), 3, $user->rights->accounting->comptarapport->lire);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/cabyuser.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ByUsers"), 3, $user->rights->accounting->comptarapport->lire);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/cabyprodserv.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ByProductsAndServices"), 3, $user->rights->accounting->comptarapport->lire);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/byratecountry.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ByVatRate"), 3, $user->rights->accounting->comptarapport->lire);
                    }
                }

                $modecompta = 'RECETTES-DEPENSES';
                //if (! empty($conf->accounting->enabled) && ! empty($user->rights->accounting->comptarapport->lire) && $mainmenu == 'accountancy') $modecompta='';	// Not yet implemented. Should be BOOKKEEPINGCOLLECTED
                if ($modecompta) {
                    if ($usemenuhider || empty($leftmenu) || preg_match('/accountancy_report/', $leftmenu)) {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/index.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ReportTurnoverCollected"), 2, $user->rights->accounting->comptarapport->lire);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/casoc.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ByCompanies"), 3, $user->rights->accounting->comptarapport->lire);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/cabyuser.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ByUsers"), 3, $user->rights->accounting->comptarapport->lire);
                        //$newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/cabyprodserv.php?leftmenu=accountancy_report&modecompta=".$modecompta, $langs->trans("ByProductsAndServices"),3,$user->rights->accounting->comptarapport->lire);
                        //$newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/byratecountry.php?leftmenu=accountancy_report&modecompta=".$modecompta, $langs->trans("ByVatRate"),3,$user->rights->accounting->comptarapport->lire);
                    }
                }

                $modecompta = 'CREANCES-DETTES';
                if (!empty($conf->accounting->enabled) && !empty($user->rights->accounting->comptarapport->lire) && $mainmenu == 'accountancy') {
                    $modecompta = 'BOOKKEEPING'; // Not yet implemented.
                }
                if ($modecompta && ((!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || !empty($conf->supplier_invoice->enabled))) {
                    if ($usemenuhider || empty($leftmenu) || preg_match('/accountancy_report/', $leftmenu)) {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/supplier_turnover.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ReportPurchaseTurnover"), 2, $user->rights->accounting->comptarapport->lire);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/supplier_turnover_by_thirdparty.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ByCompanies"), 3, $user->rights->accounting->comptarapport->lire);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/supplier_turnover_by_prodserv.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ByProductsAndServices"), 3, $user->rights->accounting->comptarapport->lire);
                    }
                }

                $modecompta = 'RECETTES-DEPENSES';
                if (!empty($conf->accounting->enabled) && !empty($user->rights->accounting->comptarapport->lire) && $mainmenu == 'accountancy') {
                    $modecompta = 'BOOKKEEPINGCOLLECTED'; // Not yet implemented.
                }
                if ($modecompta && ((!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || !empty($conf->supplier_invoice->enabled))) {
                    if ($usemenuhider || empty($leftmenu) || preg_match('/accountancy_report/', $leftmenu)) {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/supplier_turnover.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ReportPurchaseTurnoverCollected"), 2, $user->rights->accounting->comptarapport->lire);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/supplier_turnover_by_thirdparty.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ByCompanies"), 3, $user->rights->accounting->comptarapport->lire);
                    }
                }
            }

            // Accountancy (simple)
            if (!empty($conf->comptabilite->enabled)) {
                // Files
                if (empty($conf->global->ACCOUNTANCY_HIDE_EXPORT_FILES_MENU)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/accounting-files.php?mainmenu=accountancy&amp;leftmenu=accountancy_files", $langs->trans("AccountantFiles"), 0, $user->rights->compta->resultat->lire, '', $mainmenu, 'files');
                }

                // Bilan, resultats
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/resultat/index.php?leftmenu=report&amp;mainmenu=accountancy", $langs->trans("Reportings"), 0, $user->rights->compta->resultat->lire, '', $mainmenu, 'ca');

                if ($usemenuhider || empty($leftmenu) || preg_match('/report/', $leftmenu)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/resultat/index.php?leftmenu=report", $langs->trans("MenuReportInOut"), 1, $user->rights->compta->resultat->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/resultat/clientfourn.php?leftmenu=report", $langs->trans("ByCompanies"), 2, $user->rights->compta->resultat->lire);
                    /* On verra ca avec module compabilite expert
                    $newmenu->add(constant('BASE_URI') . "/Modules/Compta/resultat/compteres.php?leftmenu=report","Compte de resultat",2,$user->rights->compta->resultat->lire);
                    $newmenu->add(constant('BASE_URI') "/Modules/Compta/resultat/bilan.php?leftmenu=report","Bilan",2,$user->rights->compta->resultat->lire);
                    */

                    /*
                    $newmenu->add(constant('BASE_URI') . "/Modules/Compta/stats/cumul.php?leftmenu=report","Cumule",2,$user->rights->compta->resultat->lire);
                    if (! empty($conf->propal->enabled)) {
                        $newmenu->add(constant('BASE_URI') . "/Modules/Compta/stats/prev.php?leftmenu=report","Previsionnel",2,$user->rights->compta->resultat->lire);
                        $newmenu->add(constant('BASE_URI') . "/Modules/Compta/stats/comp.php?leftmenu=report","Transforme",2,$user->rights->compta->resultat->lire);
                    }
                    */

                    $modecompta = 'CREANCES-DETTES';
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/index.php?leftmenu=report&modecompta=" . $modecompta, $langs->trans("ReportTurnover"), 1, $user->rights->compta->resultat->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/casoc.php?leftmenu=report&modecompta=" . $modecompta, $langs->trans("ByCompanies"), 2, $user->rights->compta->resultat->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/cabyuser.php?leftmenu=report&modecompta=" . $modecompta, $langs->trans("ByUsers"), 2, $user->rights->compta->resultat->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/cabyprodserv.php?leftmenu=report&modecompta=" . $modecompta, $langs->trans("ByProductsAndServices"), 2, $user->rights->compta->resultat->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/byratecountry.php?leftmenu=report&modecompta=" . $modecompta, $langs->trans("ByVatRate"), 2, $user->rights->compta->resultat->lire);

                    $modecompta = 'RECETTES-DEPENSES';
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/index.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ReportTurnoverCollected"), 1, $user->rights->compta->resultat->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/casoc.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ByCompanies"), 2, $user->rights->compta->resultat->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/cabyuser.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ByUsers"), 2, $user->rights->compta->resultat->lire);

                    //Achats
                    $modecompta = 'CREANCES-DETTES';
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/supplier_turnover.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ReportPurchaseTurnover"), 1, $user->rights->compta->resultat->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/supplier_turnover_by_thirdparty.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ByCompanies"), 2, $user->rights->compta->resultat->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/stats/supplier_turnover_by_prodserv.php?leftmenu=accountancy_report&modecompta=" . $modecompta, $langs->trans("ByProductsAndServices"), 2, $user->rights->compta->resultat->lire);

                    /*
                    $modecompta = 'RECETTES-DEPENSES';
                    $newmenu->add(constant('BASE_URI') . "/Modules/Compta/stats/index.php?leftmenu=accountancy_report&modecompta=".$modecompta, $langs->trans("ReportPurchaseTurnoverCollected"), 1, $user->rights->compta->resultat->lire);
                    $newmenu->add(constant('BASE_URI') "/Modules/Compta/stats/casoc.php?leftmenu=accountancy_report&modecompta=".$modecompta, $langs->trans("ByCompanies"), 2, $user->rights->compta->resultat->lire);
                    $newmenu->add(constant('BASE_URI') "/Modules/Compta/stats/cabyuser.php?leftmenu=accountancy_report&modecompta=".$modecompta, $langs->trans("ByUsers"), 2, $user->rights->compta->resultat->lire);
                    */

                    // Journals
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/journal/sellsjournal.php?leftmenu=report", $langs->trans("SellsJournal"), 1, $user->rights->compta->resultat->lire, '', '', '', 50);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/journal/purchasesjournal.php?leftmenu=report", $langs->trans("PurchasesJournal"), 1, $user->rights->compta->resultat->lire, '', '', '', 51);
                }
                //if ($leftmenu=="ca") $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/journaux/index.php?leftmenu=ca",$langs->trans("Journals"),1,$user->rights->compta->resultat->lire||$user->rights->accounting->comptarapport->lire);
            }

            // Intracomm report
            if (!empty($conf->intracommreport->enabled)) {
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/intracommreport/list.php?leftmenu=intracommreport", $langs->trans("MenuIntracommReport"), 0, $user->rights->intracommreport->read, '', $mainmenu, 'intracommreport', 1);
                if ($usemenuhider || empty($leftmenu) || preg_match('/intracommreport/', $leftmenu)) {
                    // DEB / DES
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/intracommreport/card.php?action=create&leftmenu=intracommreport", $langs->trans("MenuIntracommReportNew"), 1, $user->rights->intracommreport->write, '', $mainmenu, 'intracommreport', 1);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/intracommreport/list.php?leftmenu=intracommreport", $langs->trans("MenuIntracommReportList"), 1, $user->rights->intracommreport->read, '', $mainmenu, 'intracommreport', 1);
                }
            }

            // Assets
            if (!empty($conf->asset->enabled)) {
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/asset/list.php?leftmenu=asset&amp;mainmenu=accountancy", $langs->trans("MenuAssets"), 0, $user->rights->asset->read, '', $mainmenu, 'asset', 100, '', '', '', img_picto('', 'payment', 'class="paddingright pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/asset/card.php?leftmenu=asset&amp;action=create", $langs->trans("MenuNewAsset"), 1, $user->rights->asset->write);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/asset/list.php?leftmenu=asset&amp;mainmenu=accountancy", $langs->trans("MenuListAssets"), 1, $user->rights->asset->read);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/asset/type.php?leftmenu=asset_type", $langs->trans("MenuTypeAssets"), 1, $user->rights->asset->read, '', $mainmenu, 'asset_type');
                if ($usemenuhider || empty($leftmenu) || preg_match('/asset_type/', $leftmenu)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/asset/type.php?leftmenu=asset_type&amp;action=create", $langs->trans("MenuNewTypeAssets"), 2, $user->rights->asset->setup_advance);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/asset/type.php?leftmenu=asset_type", $langs->trans("MenuListTypeAssets"), 2, $user->rights->asset->read);
                }
            }
        }

        /*
         * Menu BANK
         */
        if ($mainmenu == 'bank') {
            // Load translation files required by the page
            $langs->loadLangs(["withdrawals", "banks", "bills", "categories"]);

            // Bank-Cash account
            if (!empty($conf->banque->enabled)) {
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/bank/list.php?leftmenu=bank&amp;mainmenu=bank", $langs->trans("MenuBankCash"), 0, $user->rights->banque->lire, '', $mainmenu, 'bank', 0, '', '', '', img_picto('', 'bank_account', 'class="paddingright pictofixedwidth"'));

                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/bank/card.php?action=create", $langs->trans("MenuNewFinancialAccount"), 1, $user->rights->banque->configurer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/bank/list.php?leftmenu=bank&amp;mainmenu=bank", $langs->trans("List"), 1, $user->rights->banque->lire, '', $mainmenu, 'bank');
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/bank/bankentries_list.php", $langs->trans("ListTransactions"), 1, $user->rights->banque->lire);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/bank/budget.php", $langs->trans("ListTransactionsByCategory"), 1, $user->rights->banque->lire);

                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/bank/transfer.php", $langs->trans("MenuBankInternalTransfer"), 1, $user->rights->banque->transfer);
            }

            if (!empty($conf->categorie->enabled)) {
                $langs->load("categories");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Categories/index.php?type=5", $langs->trans("Rubriques"), 1, $user->rights->categorie->creer, '', $mainmenu, 'tags');
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/bank/categ.php", $langs->trans("RubriquesTransactions"), 1, $user->rights->banque->configurer, '', $mainmenu, 'tags');
            }

            // Direct debit order
            if (!empty($conf->prelevement->enabled)) {
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/prelevement/index.php?leftmenu=withdraw&amp;mainmenu=bank", $langs->trans("PaymentByDirectDebit"), 0, $user->rights->prelevement->bons->lire, '', $mainmenu, 'withdraw', 0, '', '', '', img_picto('', 'payment', 'class="paddingright pictofixedwidth"'));

                if ($usemenuhider || empty($leftmenu) || $leftmenu == "withdraw") {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/prelevement/create.php?mainmenu=bank", $langs->trans("NewStandingOrder"), 1, $user->rights->prelevement->bons->creer);

                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/prelevement/orders_list.php?mainmenu=bank", $langs->trans("WithdrawalsReceipts"), 1, $user->rights->prelevement->bons->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/prelevement/list.php?mainmenu=bank", $langs->trans("WithdrawalsLines"), 1, $user->rights->prelevement->bons->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/prelevement/rejets.php?mainmenu=bank", $langs->trans("Rejects"), 1, $user->rights->prelevement->bons->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/prelevement/stats.php?mainmenu=bank", $langs->trans("Statistics"), 1, $user->rights->prelevement->bons->lire);
                }
            }

            // Bank transfer order
            if (!empty($conf->paymentbybanktransfer->enabled)) {
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/paymentbybanktransfer/index.php?leftmenu=banktransfer&amp;mainmenu=bank", $langs->trans("PaymentByBankTransfer"), 0, $user->rights->paymentbybanktransfer->read, '', $mainmenu, 'banktransfer', 0, '', '', '', img_picto('', 'payment', 'class="paddingright pictofixedwidth"'));

                if ($usemenuhider || empty($leftmenu) || $leftmenu == "banktransfer") {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/prelevement/create.php?type=bank-transfer&mainmenu=bank", $langs->trans("NewPaymentByBankTransfer"), 1, $user->rights->paymentbybanktransfer->create);

                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/prelevement/orders_list.php?type=bank-transfer&mainmenu=bank", $langs->trans("PaymentByBankTransferReceipts"), 1, $user->rights->paymentbybanktransfer->read);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/prelevement/list.php?type=bank-transfer&mainmenu=bank", $langs->trans("PaymentByBankTransferLines"), 1, $user->rights->paymentbybanktransfer->read);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/prelevement/rejets.php?type=bank-transfer&mainmenu=bank", $langs->trans("Rejects"), 1, $user->rights->paymentbybanktransfer->read);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/prelevement/stats.php?type=bank-transfer&mainmenu=bank", $langs->trans("Statistics"), 1, $user->rights->paymentbybanktransfer->read);
                }
            }

            // Management of checks
            if (empty($conf->global->BANK_DISABLE_CHECK_DEPOSIT) && !empty($conf->banque->enabled) && (!empty($conf->facture->enabled) || !empty($conf->global->MAIN_MENU_CHEQUE_DEPOSIT_ON))) {
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/paiement/cheque/index.php?leftmenu=checks&amp;mainmenu=bank", $langs->trans("MenuChequeDeposits"), 0, $user->rights->banque->cheque, '', $mainmenu, 'checks', 0, '', '', '', img_picto('', 'payment', 'class="paddingright pictofixedwidth"'));
                if (preg_match('/checks/', $leftmenu)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/paiement/cheque/card.php?leftmenu=checks_bis&amp;action=new&amp;mainmenu=bank", $langs->trans("NewChequeDeposit"), 1, $user->rights->banque->cheque);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/paiement/cheque/list.php?leftmenu=checks_bis&amp;mainmenu=bank", $langs->trans("List"), 1, $user->rights->banque->cheque);
                }
            }

            // Cash Control
            if (!empty($conf->takepos->enabled) || !empty($conf->cashdesk->enabled)) {
                $permtomakecashfence = ($user->hasRight('cashdesk', 'run') || $user->hasRight('takepos', 'run'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/cashcontrol/cashcontrol_list.php?action=list", $langs->trans("POS"), 0, $permtomakecashfence, '', $mainmenu, 'cashcontrol', 0, '', '', '', img_picto('', 'pos', 'class="pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/cashcontrol/cashcontrol_card.php?action=create", $langs->trans("NewCashFence"), 1, $permtomakecashfence);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/cashcontrol/cashcontrol_list.php?action=list", $langs->trans("List"), 1, $permtomakecashfence);
            }
        }

        /*
         * Menu PRODUCTS-SERVICES
         */
        if ($mainmenu == 'products') {
            // Products
            if (!empty($conf->product->enabled)) {
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/index.php?leftmenu=product&amp;type=0", $langs->trans("Products"), 0, $user->rights->produit->lire, '', $mainmenu, 'product', 0, '', '', '', img_picto('', 'product', 'class="pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/card.php?leftmenu=product&amp;action=create&amp;type=0", $langs->trans("NewProduct"), 1, $user->rights->produit->creer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/list.php?leftmenu=product&amp;type=0", $langs->trans("List"), 1, $user->rights->produit->lire);
                if (!empty($conf->stock->enabled)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/reassort.php?type=0", $langs->trans("MenuStocks"), 1, $user->rights->produit->lire && $user->rights->stock->lire);
                }
                if (!empty($conf->productbatch->enabled)) {
                    $langs->load("stocks");
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/reassortlot.php?type=0", $langs->trans("StocksByLotSerial"), 1, $user->rights->produit->lire && $user->rights->stock->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/stock/productlot_list.php", $langs->trans("LotSerial"), 1, $user->rights->produit->lire && $user->rights->stock->lire);
                }
                if (!empty($conf->variants->enabled)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/variants/list.php", $langs->trans("VariantAttributes"), 1, $user->rights->produit->lire);
                }
                if (!empty($conf->propal->enabled) || (!empty($conf->commande->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || !empty($conf->facture->enabled) || !empty($conf->fournisseur->enabled) || !empty($conf->supplier_proposal->enabled) || !empty($conf->supplier_order->enabled) || !empty($conf->supplier_invoice->enabled)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/stats/card.php?id=all&leftmenu=stats&type=0", $langs->trans("Statistics"), 1, $user->rights->produit->lire && $user->rights->propale->lire);
                }

                // Categories
                if (!empty($conf->categorie->enabled)) {
                    $langs->load("categories");
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Categories/index.php?leftmenu=cat&amp;type=0", $langs->trans("Categories"), 1, $user->rights->categorie->lire, '', $mainmenu, 'cat');
                    //if ($usemenuhider || empty($leftmenu) || $leftmenu=="cat") $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Categories/list.php", $langs->trans("List"), 1, $user->rights->categorie->lire);
                }
            }

            // Services
            if (!empty($conf->service->enabled)) {
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/index.php?leftmenu=service&amp;type=1", $langs->trans("Services"), 0, $user->rights->service->lire, '', $mainmenu, 'service', 0, '', '', '', img_picto('', 'service', 'class="pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/card.php?leftmenu=service&amp;action=create&amp;type=1", $langs->trans("NewService"), 1, $user->rights->service->creer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/list.php?leftmenu=service&amp;type=1", $langs->trans("List"), 1, $user->rights->service->lire);
                if (!empty($conf->propal->enabled) || !empty($conf->commande->enabled) || !empty($conf->facture->enabled) || (!empty($conf->fournisseur->enabled) && empty($conf->global->MAIN_USE_NEW_SUPPLIERMOD)) || !empty($conf->supplier_proposal->enabled) || !empty($conf->supplier_oder->enabled) || !empty($conf->supplier_invoice->enabled)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/stats/card.php?id=all&leftmenu=stats&type=1", $langs->trans("Statistics"), 1, $user->rights->service->lire && $user->rights->propale->lire);
                }
                // Categories
                if (!empty($conf->categorie->enabled)) {
                    $langs->load("categories");
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Categories/index.php?leftmenu=cat&amp;type=0", $langs->trans("Categories"), 1, $user->rights->categorie->lire, '', $mainmenu, 'cat');
                    //if ($usemenuhider || empty($leftmenu) || $leftmenu=="cat") $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Categories/list.php", $langs->trans("List"), 1, $user->rights->categorie->lire);
                }
            }

            // Warehouse
            if (!empty($conf->stock->enabled)) {
                $langs->load("stocks");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/stock/index.php?leftmenu=stock", $langs->trans("Warehouses"), 0, $user->rights->stock->lire, '', $mainmenu, 'stock', 0, '', '', '', img_picto('', 'stock', 'class="pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/stock/card.php?action=create", $langs->trans("MenuNewWarehouse"), 1, $user->rights->stock->creer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/stock/list.php", $langs->trans("List"), 1, $user->rights->stock->lire);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/stock/movement_list.php", $langs->trans("Movements"), 1, $user->rights->stock->mouvement->lire);

                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/stock/massstockmove.php", $langs->trans("MassStockTransferShort"), 1, $user->rights->stock->mouvement->creer);
                if ($conf->supplier_order->enabled) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/stock/replenish.php", $langs->trans("Replenishment"), 1, $user->rights->stock->mouvement->creer && $user->rights->fournisseur->lire);
                }
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/stock/stockatdate.php", $langs->trans("StockAtDate"), 1, $user->rights->produit->lire && $user->rights->stock->lire);

                // Categories for warehouses
                if (!empty($conf->categorie->enabled)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Categories/index.php?leftmenu=stock&amp;type=9", $langs->trans("Categories"), 1, $user->rights->categorie->lire, '', $mainmenu, 'cat');
                }
            }

            // Inventory
            if (!empty($conf->stock->enabled)) {
                $langs->load("stocks");
                if (empty($conf->global->MAIN_USE_ADVANCED_PERMS)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/inventory/list.php?leftmenu=stock_inventories", $langs->trans("Inventories"), 0, $user->rights->stock->lire, '', $mainmenu, 'stock', 0, '', '', '', img_picto('', 'inventory', 'class="pictofixedwidth"'));
                    if ($usemenuhider || empty($leftmenu) || $leftmenu == "stock_inventories") {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/inventory/card.php?action=create&leftmenu=stock_inventories", $langs->trans("NewInventory"), 1, $user->rights->stock->creer);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/inventory/list.php?leftmenu=stock_inventories", $langs->trans("List"), 1, $user->rights->stock->lire);
                    }
                } else {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/inventory/list.php?leftmenu=stock_inventories", $langs->trans("Inventories"), 0, $user->rights->stock->inventory_advance->read, '', $mainmenu, 'stock', 0, '', '', '', img_picto('', 'inventory', 'class="pictofixedwidth"'));
                    if ($usemenuhider || empty($leftmenu) || $leftmenu == "stock_inventories") {
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/inventory/card.php?action=create&leftmenu=stock_inventories", $langs->trans("NewInventory"), 1, $user->rights->stock->inventory_advance->write);
                        $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Products/inventory/list.php?leftmenu=stock_inventories", $langs->trans("List"), 1, $user->rights->stock->inventory_advance->read);
                    }
                }
            }

            // Shipments
            if (!empty($conf->expedition->enabled)) {
                $langs->load("sendings");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/expedition/index.php?leftmenu=sendings", $langs->trans("Shipments"), 0, $user->rights->expedition->lire, '', $mainmenu, 'sendings', 0, '', '', '', img_picto('', 'shipment', 'class="pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/expedition/card.php?action=create2&amp;leftmenu=sendings", $langs->trans("NewSending"), 1, $user->rights->expedition->creer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/expedition/list.php?leftmenu=sendings", $langs->trans("List"), 1, $user->rights->expedition->lire);
                if ($usemenuhider || empty($leftmenu) || $leftmenu == "sendings") {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/expedition/list.php?leftmenu=sendings&search_status=0", $langs->trans("StatusSendingDraftShort"), 2, $user->rights->expedition->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/expedition/list.php?leftmenu=sendings&search_status=1", $langs->trans("StatusSendingValidatedShort"), 2, $user->rights->expedition->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/expedition/list.php?leftmenu=sendings&search_status=2", $langs->trans("StatusSendingProcessedShort"), 2, $user->rights->expedition->lire);
                }
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/expedition/stats/index.php?leftmenu=sendings", $langs->trans("Statistics"), 1, $user->rights->expedition->lire);
            }

            // Receptions
            if (!empty($conf->reception->enabled)) {
                $langs->load("receptions");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/reception/index.php?leftmenu=receptions", $langs->trans("Receptions"), 0, $user->rights->reception->lire, '', $mainmenu, 'receptions', 0, '', '', '', img_picto('', 'dollyrevert', 'class="pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/reception/card.php?action=create2&amp;leftmenu=receptions", $langs->trans("NewReception"), 1, $user->rights->reception->creer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/reception/list.php?leftmenu=receptions", $langs->trans("List"), 1, $user->rights->reception->lire);
                if ($usemenuhider || empty($leftmenu) || $leftmenu == "receptions") {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/reception/list.php?leftmenu=receptions&search_status=0", $langs->trans("StatusReceptionDraftShort"), 2, $user->rights->reception->lire);
                }
                if ($usemenuhider || empty($leftmenu) || $leftmenu == "receptions") {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/reception/list.php?leftmenu=receptions&search_status=1", $langs->trans("StatusReceptionValidatedShort"), 2, $user->rights->reception->lire);
                }
                if ($usemenuhider || empty($leftmenu) || $leftmenu == "receptions") {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/reception/list.php?leftmenu=receptions&search_status=2", $langs->trans("StatusReceptionProcessedShort"), 2, $user->rights->reception->lire);
                }
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/reception/stats/index.php?leftmenu=receptions", $langs->trans("Statistics"), 1, $user->rights->reception->lire);
            }
        }

        /*
         * Menu PRODUCTS-SERVICES MRP - GPAO
         */
        if ($mainmenu == 'mrp') {
            // BOM
            if (!empty($conf->bom->enabled) || !empty($conf->mrp->enabled)) {
                $langs->load("mrp");

                $newmenu->add(constant('BASE_URI') . "", $langs->trans("MenuBOM"), 0, $user->rights->bom->read, '', $mainmenu, 'bom', 0, '', '', '', img_picto('', 'bom', 'class="paddingrightonly pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/bom/bom_card.php?leftmenu=bom&amp;action=create", $langs->trans("NewBOM"), 1, $user->rights->bom->write, '', $mainmenu, 'bom');
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/bom/bom_list.php?leftmenu=bom", $langs->trans("List"), 1, $user->rights->bom->read, '', $mainmenu, 'bom');
            }

            if (!empty($conf->mrp->enabled)) {
                $langs->load("mrp");

                $newmenu->add(constant('BASE_URI') . "", $langs->trans("MenuMRP"), 0, $user->rights->mrp->read, '', $mainmenu, 'mo', 0, '', '', '', img_picto('', 'mrp', 'class="paddingrightonly pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/mrp/mo_card.php?leftmenu=mo&amp;action=create", $langs->trans("NewMO"), 1, $user->rights->mrp->write, '', $mainmenu, 'mo');
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/mrp/mo_list.php?leftmenu=mo", $langs->trans("List"), 1, $user->rights->mrp->read, '', $mainmenu, 'mo');
            }
        }

        /*
         * Menu PROJECTS
         */
        if ($mainmenu == 'project') {
            if (!empty($conf->projet->enabled)) {
                $langs->load("projects");

                $search_project_user = GETPOST('search_project_user', 'int');

                $tmpentry = [
                    'enabled' => (!empty($conf->projet->enabled)),
                    'perms' => (!empty($user->rights->projet->lire)),
                    'module' => 'projet',
                ];
                $showmode = isVisibleToUserType($type_user, $tmpentry, $listofmodulesforexternal);

                $titleboth = $langs->trans("LeadsOrProjects");
                $titlenew = $langs->trans("NewLeadOrProject"); // Leads and opportunities by default
                if (empty($conf->global->PROJECT_USE_OPPORTUNITIES)) {
                    $titleboth = $langs->trans("Projects");
                    $titlenew = $langs->trans("NewProject");
                }
                if (isset($conf->global->PROJECT_USE_OPPORTUNITIES) && $conf->global->PROJECT_USE_OPPORTUNITIES == 2) {    // 2 = leads only
                    $titleboth = $langs->trans("Leads");
                    $titlenew = $langs->trans("NewLead");
                }

                // Project assigned to user
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Projects/index.php?leftmenu=projects" . ($search_project_user ? '&search_project_user=' . $search_project_user : ''), $titleboth, 0, $user->rights->projet->lire, '', $mainmenu, 'projects', 0, '', '', '', img_picto('', 'project', 'class="pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Projects/card.php?leftmenu=projects&action=create" . ($search_project_user ? '&search_project_user=' . $search_project_user : ''), $titlenew, 1, $user->rights->projet->creer);

                if (empty($conf->global->PROJECT_USE_OPPORTUNITIES)) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Projects/list.php?leftmenu=projets" . ($search_project_user ? '&search_project_user=' . $search_project_user : '') . '&search_status=99', $langs->trans("List"), 1, $showmode, '', 'project', 'list');
                } elseif (isset($conf->global->PROJECT_USE_OPPORTUNITIES) && $conf->global->PROJECT_USE_OPPORTUNITIES == 1) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Projects/list.php?leftmenu=projets" . ($search_project_user ? '&search_project_user=' . $search_project_user : ''), $langs->trans("List"), 1, $showmode, '', 'project', 'list');
                    $newmenu->add('/Modules/Projects/list.php?mainmenu=project&amp;leftmenu=list&search_usage_opportunity=1&search_status=99&search_opp_status=openedopp&contextpage=lead', $langs->trans("ListOpenLeads"), 2, $showmode);
                    $newmenu->add('/Modules/Projects/list.php?mainmenu=project&amp;leftmenu=list&search_opp_status=notopenedopp&search_status=99&contextpage=project', $langs->trans("ListOpenProjects"), 2, $showmode);
                } elseif (isset($conf->global->PROJECT_USE_OPPORTUNITIES) && $conf->global->PROJECT_USE_OPPORTUNITIES == 2) {    // 2 = leads only
                    $newmenu->add('/Modules/Projects/list.php?mainmenu=project&amp;leftmenu=list&search_usage_opportunity=1&search_status=99', $langs->trans("List"), 2, $showmode);
                }

                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Projects/stats/index.php?leftmenu=projects", $langs->trans("Statistics"), 1, $user->rights->projet->lire);

                // Categories
                if (!empty($conf->categorie->enabled)) {
                    $langs->load("categories");
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Categories/index.php?leftmenu=cat&amp;type=6", $langs->trans("Categories"), 1, $user->rights->categorie->lire, '', $mainmenu, 'cat');
                }

                if (empty($conf->global->PROJECT_HIDE_TASKS)) {
                    // Project affected to user
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Projects/activity/index.php?leftmenu=tasks" . ($search_project_user ? '&search_project_user=' . $search_project_user : ''), $langs->trans("Activities"), 0, $user->rights->projet->lire, '', 'project', 'tasks', 0, '', '', '', img_picto('', 'projecttask', 'class="pictofixedwidth"'));
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Projects/tasks.php?leftmenu=tasks&action=create", $langs->trans("NewTask"), 1, $user->rights->projet->creer);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Projects/tasks/list.php?leftmenu=tasks" . ($search_project_user ? '&search_project_user=' . $search_project_user : ''), $langs->trans("List"), 1, $user->rights->projet->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Projects/tasks/stats/index.php?leftmenu=projects", $langs->trans("Statistics"), 1, $user->rights->projet->lire);

                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Projects/activity/perweek.php?leftmenu=tasks" . ($search_project_user ? '&search_project_user=' . $search_project_user : ''), $langs->trans("NewTimeSpent"), 0, $user->rights->projet->lire, '', 'project', 'timespent', 0, '', '', '', img_picto('', 'timespent', 'class="pictofixedwidth"'));
                }
            }
        }

        /*
         * Menu HRM
        */
        if ($mainmenu == 'hrm') {
            // HRM module
            if (!empty($conf->hrm->enabled)) {
                $langs->load("hrm");

                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Users/list.php?mainmenu=hrm&leftmenu=hrm&mode=employee", $langs->trans("Employees"), 0, $user->rights->user->user->lire, '', $mainmenu, 'hrm', 0, '', '', '', img_picto('', 'user', 'class="pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Users/card.php?mainmenu=hrm&leftmenu=hrm&action=create&employee=1", $langs->trans("NewEmployee"), 1, $user->rights->user->user->creer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Users/list.php?mainmenu=hrm&leftmenu=hrm&mode=employee&contextpage=employeelist", $langs->trans("List"), 1, $user->rights->user->user->lire);
            }

            // Leave/Holiday/Vacation module
            if (!empty($conf->holiday->enabled)) {
                // Load translation files required by the page
                $langs->loadLangs(["holiday", "trips"]);

                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Holiday/list.php?mainmenu=hrm&leftmenu=hrm", $langs->trans("CPTitreMenu"), 0, $user->rights->holiday->read, '', $mainmenu, 'hrm', 0, '', '', '', img_picto('', 'holiday', 'class="pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Holiday/card.php?mainmenu=hrm&leftmenu=holiday&action=create", $langs->trans("New"), 1, $user->rights->holiday->write);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Holiday/list.php?mainmenu=hrm&leftmenu=hrm", $langs->trans("List"), 1, $user->rights->holiday->read);
                if ($usemenuhider || empty($leftmenu) || $leftmenu == "hrm") {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Holiday/list.php?search_status=1&mainmenu=hrm&leftmenu=hrm", $langs->trans("DraftCP"), 2, $user->rights->holiday->read);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Holiday/list.php?search_status=2&mainmenu=hrm&leftmenu=hrm", $langs->trans("ToReviewCP"), 2, $user->rights->holiday->read);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Holiday/list.php?search_status=3&mainmenu=hrm&leftmenu=hrm", $langs->trans("ApprovedCP"), 2, $user->rights->holiday->read);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Holiday/list.php?search_status=4&mainmenu=hrm&leftmenu=hrm", $langs->trans("CancelCP"), 2, $user->rights->holiday->read);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Holiday/list.php?search_status=5&mainmenu=hrm&leftmenu=hrm", $langs->trans("RefuseCP"), 2, $user->rights->holiday->read);
                }
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Holiday/define_holiday.php?mainmenu=hrm&action=request", $langs->trans("MenuConfCP"), 1, $user->rights->holiday->read);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Holiday/month_report.php?mainmenu=hrm&leftmenu=holiday", $langs->trans("MenuReportMonth"), 1, $user->rights->holiday->readall);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Holiday/view_log.php?mainmenu=hrm&leftmenu=holiday&action=request", $langs->trans("MenuLogCP"), 1, $user->rights->holiday->define_holiday);
            }

            // Trips and expenses (old module)
            if (!empty($conf->deplacement->enabled)) {
                $langs->load("trips");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/deplacement/index.php?leftmenu=tripsandexpenses&amp;mainmenu=hrm", $langs->trans("TripsAndExpenses"), 0, $user->rights->deplacement->lire, '', $mainmenu, 'tripsandexpenses', 0, '', '', '', img_picto('', 'trip', 'class="pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/deplacement/card.php?action=create&amp;leftmenu=tripsandexpenses&amp;mainmenu=hrm", $langs->trans("New"), 1, $user->rights->deplacement->creer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/deplacement/list.php?leftmenu=tripsandexpenses&amp;mainmenu=hrm", $langs->trans("List"), 1, $user->rights->deplacement->lire);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Compta/deplacement/stats/index.php?leftmenu=tripsandexpenses&amp;mainmenu=hrm", $langs->trans("Statistics"), 1, $user->rights->deplacement->lire);
            }

            // Expense report
            if (!empty($conf->expensereport->enabled)) {
                $langs->load("trips");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/ExpenseReports/index.php?leftmenu=expensereport&amp;mainmenu=hrm", $langs->trans("TripsAndExpenses"), 0, $user->rights->expensereport->lire, '', $mainmenu, 'expensereport', 0, '', '', '', img_picto('', 'trip', 'class="pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/ExpenseReports/card.php?action=create&amp;leftmenu=expensereport&amp;mainmenu=hrm", $langs->trans("New"), 1, $user->rights->expensereport->creer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/ExpenseReports/list.php?leftmenu=expensereport&amp;mainmenu=hrm", $langs->trans("List"), 1, $user->rights->expensereport->lire);
                if ($usemenuhider || empty($leftmenu) || $leftmenu == "expensereport") {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/ExpenseReports/list.php?search_status=0&amp;leftmenu=expensereport&amp;mainmenu=hrm", $langs->trans("Draft"), 2, $user->rights->expensereport->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/ExpenseReports/list.php?search_status=2&amp;leftmenu=expensereport&amp;mainmenu=hrm", $langs->trans("Validated"), 2, $user->rights->expensereport->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/ExpenseReports/list.php?search_status=5&amp;leftmenu=expensereport&amp;mainmenu=hrm", $langs->trans("Approved"), 2, $user->rights->expensereport->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/ExpenseReports/list.php?search_status=6&amp;leftmenu=expensereport&amp;mainmenu=hrm", $langs->trans("Paid"), 2, $user->rights->expensereport->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/ExpenseReports/list.php?search_status=4&amp;leftmenu=expensereport&amp;mainmenu=hrm", $langs->trans("Canceled"), 2, $user->rights->expensereport->lire);
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/ExpenseReports/list.php?search_status=99&amp;leftmenu=expensereport&amp;mainmenu=hrm", $langs->trans("Refused"), 2, $user->rights->expensereport->lire);
                }
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/ExpenseReports/stats/index.php?leftmenu=expensereport&amp;mainmenu=hrm", $langs->trans("Statistics"), 1, $user->rights->expensereport->lire);
            }

            if (!empty($conf->projet->enabled)) {
                if (empty($conf->global->PROJECT_HIDE_TASKS)) {
                    $langs->load("projects");

                    $search_project_user = GETPOST('search_project_user', 'int');

                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Projects/activity/perweek.php?leftmenu=tasks" . ($search_project_user ? '&search_project_user=' . $search_project_user : ''), $langs->trans("NewTimeSpent"), 0, $user->rights->projet->lire, '', $mainmenu, 'timespent', 0, '', '', '', img_picto('', 'timespent', 'class="pictofixedwidth"'));
                }
            }
        }

        /*
         * Menu TOOLS
         */
        if ($mainmenu == 'tools') {
            if (empty($user->socid)) { // limit to internal users
                $langs->load("mails");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/admin/mails_templates.php?leftmenu=email_templates", $langs->trans("EMailTemplates"), 0, 1, '', $mainmenu, 'email_templates', 0, '', '', '', img_picto('', 'email', 'class="paddingright pictofixedwidth"'));
            }

            if (!empty($conf->mailing->enabled)) {
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Comm/mailing/index.php?leftmenu=mailing", $langs->trans("EMailings"), 0, $user->rights->mailing->lire, '', $mainmenu, 'mailing', 0, '', '', '', img_picto('', 'email', 'class="paddingright pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Comm/mailing/card.php?leftmenu=mailing&amp;action=create", $langs->trans("NewMailing"), 1, $user->rights->mailing->creer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Comm/mailing/list.php?leftmenu=mailing", $langs->trans("List"), 1, $user->rights->mailing->lire);
            }

            if (!empty($conf->export->enabled)) {
                $langs->load("exports");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/exports/index.php?leftmenu=export", $langs->trans("FormatedExport"), 0, $user->rights->export->lire, '', $mainmenu, 'export', 0, '', '', '', img_picto('', 'technic', 'class="paddingright pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/exports/export.php?leftmenu=export", $langs->trans("NewExport"), 1, $user->rights->export->creer);
                //$newmenu->add(constant('BASE_URI') . /* TODO */ "/exports/export.php?leftmenu=export",$langs->trans("List"),1, $user->rights->export->lire);
            }

            if (!empty($conf->import->enabled)) {
                $langs->load("exports");
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/imports/index.php?leftmenu=import", $langs->trans("FormatedImport"), 0, $user->rights->import->run, '', $mainmenu, 'import', 0, '', '', '', img_picto('', 'technic', 'class="paddingright pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/imports/import.php?leftmenu=import", $langs->trans("NewImport"), 1, $user->rights->import->run);
            }
        }

        /*
         * Menu MEMBERS
         */
        if ($mainmenu == 'members') {
            if (!empty($conf->adherent->enabled)) {
                // Load translation files required by the page
                $langs->loadLangs(["members", "compta"]);

                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/index.php?leftmenu=members&amp;mainmenu=members", $langs->trans("Members"), 0, $user->rights->adherent->lire, '', $mainmenu, 'members', 0, '', '', '', img_picto('', 'member', 'class="paddingright pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/card.php?leftmenu=members&amp;action=create", $langs->trans("NewMember"), 1, $user->rights->adherent->creer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/list.php?leftmenu=members", $langs->trans("List"), 1, $user->rights->adherent->lire);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/list.php?leftmenu=members&amp;statut=-1", $langs->trans("MenuMembersToValidate"), 2, $user->rights->adherent->lire);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/list.php?leftmenu=members&amp;statut=1", $langs->trans("MenuMembersValidated"), 2, $user->rights->adherent->lire);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/list.php?leftmenu=members&amp;statut=1&amp;filter=withoutsubscription", $langs->trans("WithoutSubscription"), 3, $user->rights->adherent->lire);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/list.php?leftmenu=members&amp;statut=1&amp;filter=uptodate", $langs->trans("UpToDate"), 3, $user->rights->adherent->lire);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/list.php?leftmenu=members&amp;statut=1&amp;filter=outofdate", $langs->trans("OutOfDate"), 3, $user->rights->adherent->lire);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/list.php?leftmenu=members&amp;statut=0", $langs->trans("MenuMembersResiliated"), 2, $user->rights->adherent->lire);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/stats/index.php?leftmenu=members", $langs->trans("MenuMembersStats"), 1, $user->rights->adherent->lire);

                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/cartes/carte.php?leftmenu=export", $langs->trans("MembersCards"), 1, $user->rights->adherent->export);
                if (!empty($conf->global->MEMBER_LINK_TO_HTPASSWDFILE) && ($usemenuhider || empty($leftmenu) || $leftmenu == 'none' || $leftmenu == "members" || $leftmenu == "export")) {
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/htpasswd.php?leftmenu=export", $langs->trans("Filehtpasswd"), 1, $user->rights->adherent->export);
                }

                if (!empty($conf->categorie->enabled)) {
                    $langs->load("categories");
                    $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Categories/index.php?leftmenu=cat&amp;type=3", $langs->trans("Categories"), 1, $user->rights->categorie->lire, '', $mainmenu, 'cat');
                }

                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/index.php?leftmenu=members&amp;mainmenu=members", $langs->trans("Subscriptions"), 0, $user->rights->adherent->cotisation->lire, '', $mainmenu, 'members', 0, '', '', '', img_picto('', 'payment', 'class="paddingright pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/list.php?leftmenu=members&amp;statut=-1,1&amp;mainmenu=members", $langs->trans("NewSubscription"), 1, $user->rights->adherent->cotisation->creer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/subscription/list.php?leftmenu=members", $langs->trans("List"), 1, $user->rights->adherent->cotisation->lire);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/stats/index.php?leftmenu=members", $langs->trans("MenuMembersStats"), 1, $user->rights->adherent->lire);

                //$newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/index.php?leftmenu=export&amp;mainmenu=members",$langs->trans("Tools"),0,$user->rights->adherent->export, '', $mainmenu, 'export');
                //if (! empty($conf->export->enabled) && ($usemenuhider || empty($leftmenu) || $leftmenu=="export")) $newmenu->add(constant('BASE_URI') . /* TODO */ "/exports/index.php?leftmenu=export",$langs->trans("Datas"),1,$user->rights->adherent->export);

                // Type
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/type.php?leftmenu=setup&amp;mainmenu=members", $langs->trans("MembersTypes"), 0, $user->rights->adherent->configurer, '', $mainmenu, 'setup', 0, '', '', '', img_picto('', 'members', 'class="paddingright pictofixedwidth"'));
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/type.php?leftmenu=setup&amp;mainmenu=members&amp;action=create", $langs->trans("New"), 1, $user->rights->adherent->configurer);
                $newmenu->add(constant('BASE_URI') . /* TODO */ "/Modules/Adherents/type.php?leftmenu=setup&amp;mainmenu=members", $langs->trans("List"), 1, $user->rights->adherent->configurer);
            }
        }

        // Add personalized menus and modules menus
        //var_dump($newmenu->liste);    //
        $menuArbo = new Menubase($db, 'eldy');
        $newmenu = $menuArbo->menuLeftCharger($newmenu, $mainmenu, $leftmenu, (empty($user->socid) ? 0 : 1), 'eldy', $tabMenu);
        //var_dump($newmenu->liste);    //

        if (!empty($conf->ftp->enabled) && $mainmenu == 'ftp') {    // Entry for FTP
            $MAXFTP = 20;
            $i = 1;
            while ($i <= $MAXFTP) {
                $paramkey = 'FTP_NAME_' . $i;
                //print $paramkey;
                if (!empty($conf->global->$paramkey)) {
                    $link = "/ftp/index.php?idmenu=" . $_SESSION["idmenu"] . "&numero_ftp=" . $i;
                    $newmenu->add($link, dol_trunc($conf->global->$paramkey, 24));
                }
                $i++;
            }
        }
    }

    //var_dump($tabMenu);    //
    //var_dump($newmenu->liste);

    // Build final $menu_array = $menu_array_before +$newmenu->liste + $menu_array_after
    //var_dump($menu_array_before);exit;
    //var_dump($menu_array_after);exit;
    $menu_array = $newmenu->liste;
    if (is_array($menu_array_before)) {
        $menu_array = array_merge($menu_array_before, $menu_array);
    }
    if (is_array($menu_array_after)) {
        $menu_array = array_merge($menu_array, $menu_array_after);
    }
    //var_dump($menu_array);exit;
    if (!is_array($menu_array)) {
        return 0;
    }

    // Allow the $menu_array of the menu to be manipulated by modules
    $parameters = [
        'mainmenu' => $mainmenu,
    ];
    $hook_items = $menu_array;
    $reshook = $hookmanager->executeHooks('menuLeftMenuItems', $parameters, $hook_items); // Note that $action and $object may have been modified by some hooks

    if (is_numeric($reshook)) {
        if ($reshook == 0 && !empty($hookmanager->results)) {
            $menu_array[] = $hookmanager->results; // add
        } elseif ($reshook == 1) {
            $menu_array = $hookmanager->results; // replace
        }

        // @todo Sort menu items by 'position' value
        //      $position = array();
        //      foreach ($menu_array as $key => $row) {
        //          $position[$key] = $row['position'];
        //      }
        //      array_multisort($position, SORT_ASC, $menu_array);
    }

    // TODO Use the position property in menu_array to reorder the $menu_array
    //var_dump($menu_array);
    /*$new_menu_array = array();
    $level=0; $cusor=0; $position=0;
    $nbentry = count($menu_array);
    while (findNextEntryForLevel($menu_array, $cursor, $position, $level))
    {

        $cursor++;
    }*/

    // Show menu
    $invert = empty($conf->global->MAIN_MENU_INVERT) ? "" : "invert";
    if (empty($noout)) {
        $altok = 0;
        $blockvmenuopened = false;
        $lastlevel0 = '';
        $num = count($menu_array);
        for ($i = 0; $i < $num; $i++) {     // Loop on each menu entry
            $showmenu = true;
            if (!empty($conf->global->MAIN_MENU_HIDE_UNAUTHORIZED) && empty($menu_array[$i]['enabled'])) {
                $showmenu = false;
            }

            // Begin of new left menu block
            if (empty($menu_array[$i]['level']) && $showmenu) {
                $altok++;
                $blockvmenuopened = true;
                $lastopened = true;
                for ($j = ($i + 1); $j < $num; $j++) {
                    if (empty($menu_array[$j]['level'])) {
                        $lastopened = false;
                    }
                }
                if ($altok % 2 == 0) {
                    print '<div class="blockvmenu blockvmenuimpair' . $invert . ($lastopened ? ' blockvmenulast' : '') . ($altok == 1 ? ' blockvmenufirst' : '') . '">' . "\n";
                } else {
                    print '<div class="blockvmenu blockvmenupair' . $invert . ($lastopened ? ' blockvmenulast' : '') . ($altok == 1 ? ' blockvmenufirst' : '') . '">' . "\n";
                }
            }

            // Add tabulation
            $tabstring = '';
            $tabul = ($menu_array[$i]['level'] - 1);
            if ($tabul > 0) {
                for ($j = 0; $j < $tabul; $j++) {
                    $tabstring .= '&nbsp;&nbsp;&nbsp;';
                }
            }

            // $menu_array[$i]['url'] can be a relative url, a full external url. We try substitution

            $menu_array[$i]['url'] = make_substitutions($menu_array[$i]['url'], $substitarray);

            $url = $shorturl = $shorturlwithoutparam = $menu_array[$i]['url'];
            if (!preg_match("/^(http:\/\/|https:\/\/)/i", $menu_array[$i]['url'])) {
                $tmp = explode('?', $menu_array[$i]['url'], 2);
                $url = $shorturl = $tmp[0];
                $param = (isset($tmp[1]) ? $tmp[1] : ''); // params in url of the menu link

                // Complete param to force leftmenu to '' to close open menu when we click on a link with no leftmenu defined.
                if ((!preg_match('/mainmenu/i', $param)) && (!preg_match('/leftmenu/i', $param)) && !empty($menu_array[$i]['mainmenu'])) {
                    $param .= ($param ? '&' : '') . 'mainmenu=' . $menu_array[$i]['mainmenu'] . '&leftmenu=';
                }
                if ((!preg_match('/mainmenu/i', $param)) && (!preg_match('/leftmenu/i', $param)) && empty($menu_array[$i]['mainmenu'])) {
                    $param .= ($param ? '&' : '') . 'leftmenu=';
                }
                //$url.="idmenu=".$menu_array[$i]['rowid'];    // Already done by menuLoad
                $url = dol_buildpath($url, 1) . ($param ? '?' . $param : '');
                $shorturlwithoutparam = $shorturl;
                $shorturl = $shorturl . ($param ? '?' . $param : '');
            }

            print '<!-- Process menu entry with mainmenu=' . $menu_array[$i]['mainmenu'] . ', leftmenu=' . $menu_array[$i]['leftmenu'] . ', level=' . $menu_array[$i]['level'] . ' enabled=' . $menu_array[$i]['enabled'] . ', position=' . $menu_array[$i]['position'] . ' -->' . "\n";

            // Menu level 0
            if ($menu_array[$i]['level'] == 0) {
                if ($menu_array[$i]['enabled']) {     // Enabled so visible
                    print '<div class="menu_titre">' . $tabstring;
                    if ($shorturlwithoutparam) {
                        print '<a class="vmenu" title="' . dol_escape_htmltag(dol_string_nohtmltag($menu_array[$i]['titre'])) . '" href="' . $url . '"' . ($menu_array[$i]['target'] ? ' target="' . $menu_array[$i]['target'] . '"' : '') . '>';
                    } else {
                        print '<span class="vmenu">';
                    }
                    print ($menu_array[$i]['prefix'] ? $menu_array[$i]['prefix'] : '') . $menu_array[$i]['titre'];
                    if ($shorturlwithoutparam) {
                        print '</a>';
                    } else {
                        print '</span>';
                    }
                    print '</div>' . "\n";
                    $lastlevel0 = 'enabled';
                } elseif ($showmenu) {                 // Not enabled but visible (so greyed)
                    print '<div class="menu_titre">' . $tabstring . '<font class="vmenudisabled">' . $menu_array[$i]['titre'] . '</font></div>' . "\n";
                    $lastlevel0 = 'greyed';
                } else {
                    $lastlevel0 = 'hidden';
                }
                if ($showmenu) {
                    print '<div class="menu_top"></div>' . "\n";
                }
            }

            // Menu level > 0
            if ($menu_array[$i]['level'] > 0) {
                $cssmenu = '';
                if ($menu_array[$i]['url']) {
                    $cssmenu = ' menu_contenu' . dol_string_nospecial(preg_replace('/\.php.*$/', '', $menu_array[$i]['url']));
                }

                if ($menu_array[$i]['enabled'] && $lastlevel0 == 'enabled') {
                    // Enabled so visible, except if parent was not enabled.
                    print '<div class="menu_contenu' . $cssmenu . '">';
                    print $tabstring;
                    if ($shorturlwithoutparam) {
                        print '<a class="vsmenu" title="' . dol_escape_htmltag(dol_string_nohtmltag($menu_array[$i]['titre'])) . '" href="' . $url . '"' . ($menu_array[$i]['target'] ? ' target="' . $menu_array[$i]['target'] . '"' : '') . '>';
                    } else {
                        print '<span class="vsmenu" title="' . dol_escape_htmltag($menu_array[$i]['titre']) . '">';
                    }
                    print $menu_array[$i]['titre'];
                    if ($shorturlwithoutparam) {
                        print '</a>';
                    } else {
                        print '</span>';
                    }
                    // If title is not pure text and contains a table, no carriage return added
                    if (!strstr($menu_array[$i]['titre'], '<table')) {
                        print '<br>';
                    }
                    print '</div>' . "\n";
                } elseif ($showmenu && $lastlevel0 == 'enabled') {
                    // Not enabled but visible (so greyed), except if parent was not enabled.
                    print '<div class="menu_contenu' . $cssmenu . '">';
                    print $tabstring;
                    print '<font class="vsmenudisabled vsmenudisabledmargin">' . $menu_array[$i]['titre'] . '</font><br></div>' . "\n";
                }
            }

            // If next is a new block or if there is nothing after
            if (empty($menu_array[$i + 1]['level'])) {               // End menu block
                if ($showmenu) {
                    print '<div class="menu_end"></div>' . "\n";
                }
                if ($blockvmenuopened) {
                    print '</div>' . "\n";
                    $blockvmenuopened = false;
                }
            }
        }

        if ($altok) {
            print '<div class="blockvmenuend"></div>'; // End menu block
        }
    }

    return count($menu_array);
}
