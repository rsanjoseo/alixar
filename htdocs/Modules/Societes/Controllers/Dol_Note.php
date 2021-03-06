<?php
/* Copyright (C) 2001-2005 Rodolphe Quiedeville <rodolphe@quiedeville.org>
 * Copyright (C) 2004-2011 Laurent Destailleur  <eldy@users.sourceforge.net>
 * Copyright (C) 2005-2012 Regis Houssin        <regis.houssin@inodbox.com>
 * Copyright (C) 2010      Juanjo Menent        <jmenent@2byte.es>
 * Copyright (C) 2013      Florian Henry	  	<florian.henry@open-concept.pro>
 * Copyright (C) 2015      Marcos García        <marcosgdf@gmail.com>
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
 *   \file       htdocs/societe/note.php
 *   \brief      Tab for notes on third party
 *   \ingroup    societe
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

require_once DOL_DOCUMENT_ROOT . '/core/lib/company.lib.php';

$action = GETPOST('action', 'aZ09');

$langs->load("companies");

$id = GETPOST('id') ? GETPOST('id', 'int') : GETPOST('socid', 'int');

$object = new Societe($db);
if ($id > 0) {
    $object->fetch($id);
}

$permissionnote = $user->rights->societe->creer; // Used by the include of actions_setnotes.inc.php

// Initialize technical object to manage hooks of page. Note that conf->hooks_modules contains array of hook context
$hookmanager->initHooks(['thirdpartynote', 'globalcard']);

// Security check
if ($user->socid > 0) {
    unset($action);
    $socid = $user->socid;
}
$result = restrictedArea($user, 'societe', $object->id, '&societe');

/*
 * Actions
 */
$reshook = $hookmanager->executeHooks('doActions', [], $object, $action); // Note that $action and $object may have been modified by some hooks
if ($reshook < 0) {
    setEventMessages($hookmanager->error, $hookmanager->errors, 'errors');
}
if (empty($reshook)) {
    include DOL_DOCUMENT_ROOT . '/core/actions_setnotes.inc.php'; // Must be include, not include_once
}

/*
 *	View
 */

$form = new Form($db);

$title = $langs->trans("ThirdParty") . ' - ' . $langs->trans("Notes");
if (!empty($conf->global->MAIN_HTML_TITLE) && preg_match('/thirdpartynameonly/', $conf->global->MAIN_HTML_TITLE) && $object->name) {
    $title = $object->name . ' - ' . $langs->trans("Notes");
}
$help_url = 'EN:Module_Third_Parties|FR:Module_Tiers|ES:Empresas';
llxHeader('', $title, $help_url);

if ($object->id > 0) {
    /*
     * Affichage onglets
     */
    if (!empty($conf->notification->enabled)) {
        $langs->load("mails");
    }

    $head = societe_prepare_head($object);

    print dol_get_fiche_head($head, 'note', $langs->trans("ThirdParty"), -1, 'company');

    $linkback = '<a href="' . DOL_URL_ROOT . '/Modules/Societes/list.php?restore_lastsearch_values=1">' . $langs->trans("BackToList") . '</a>';

    dol_banner_tab($object, 'socid', $linkback, ($user->socid ? 0 : 1), 'rowid', 'nom');

    $cssclass = 'titlefield';
    //if ($action == 'editnote_public') $cssclass='titlefieldcreate';
    //if ($action == 'editnote_private') $cssclass='titlefieldcreate';

    print '<div class="fichecenter">';

    print '<div class="underbanner clearboth"></div>';
    print '<table class="border centpercent tableforfield">';

    // Type Prospect/Customer/Supplier
    print '<tr><td class="titlefield">' . $langs->trans('NatureOfThirdParty') . '</td><td>';
    print $object->getTypeUrl(1);
    print '</td></tr>';

    if (!empty($conf->global->SOCIETE_USEPREFIX)) {  // Old not used prefix field
        print '<tr><td class="' . $cssclass . '">' . $langs->trans('Prefix') . '</td><td colspan="3">' . $object->prefix_comm . '</td></tr>';
    }

    if ($object->client) {
        print '<tr><td class="' . $cssclass . '">';
        print $langs->trans('CustomerCode') . '</td><td colspan="3">';
        print showValueWithClipboardCPButton(dol_escape_htmltag($object->code_client));
        $tmpcheck = $object->check_codeclient();
        if ($tmpcheck != 0 && $tmpcheck != -5) {
            print ' <font class="error">(' . $langs->trans("WrongCustomerCode") . ')</font>';
        }
        print '</td></tr>';
    }

    if ($object->fournisseur) {
        print '<tr><td class="' . $cssclass . '">';
        print $langs->trans('SupplierCode') . '</td><td colspan="3">';
        print showValueWithClipboardCPButton(dol_escape_htmltag($object->code_fournisseur));
        $tmpcheck = $object->check_codefournisseur();
        if ($tmpcheck != 0 && $tmpcheck != -5) {
            print ' <font class="error">(' . $langs->trans("WrongSupplierCode") . ')</font>';
        }
        print '</td></tr>';
    }

    print "</table>";

    print '</div>';

    //print '<br>';

    //print '<div class="underbanner clearboth"></div>';
    include DOL_DOCUMENT_ROOT . '/core/tpl/notes.tpl.php';

    print dol_get_fiche_end();
} else {
    $langs->load("errors");
    print $langs->trans("ErrorRecordNotFound");
}

// End of page
llxFooter();
$db->close();
