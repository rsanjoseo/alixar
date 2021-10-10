<?php
/* Copyright (C) 2001-2007  Rodolphe Quiedeville    <rodolphe@quiedeville.org>
 * Copyright (C) 2003       Brian Fraval            <brian@fraval.org>
 * Copyright (C) 2004-2015  Laurent Destailleur     <eldy@users.sourceforge.net>
 * Copyright (C) 2005       Eric Seigne             <eric.seigne@ryxeo.com>
 * Copyright (C) 2005-2012  Regis Houssin           <regis.houssin@inodbox.com>
 * Copyright (C) 2008       Patrick Raguin          <patrick.raguin@auguria.net>
 * Copyright (C) 2010-2016  Juanjo Menent           <jmenent@2byte.es>
 * Copyright (C) 2011-2013  Alexandre Spangaro      <aspangaro@open-dsi.fr>
 * Copyright (C) 2015       Jean-François Ferry     <jfefe@aternatik.fr>
 * Copyright (C) 2015       Marcos García           <marcosgdf@gmail.com>
 * Copyright (C) 2015       Raphaël Doursenaud      <rdoursenaud@gpcsolutions.fr>
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
 *  \file       htdocs/societe/contact.php
 *  \ingroup    societe
 *  \brief      Page of contacts of thirdparties
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
require_once DOL_DOCUMENT_ROOT . '/core/lib/images.lib.php';
require_once DOL_DOCUMENT_ROOT . '/core/lib/files.lib.php';
require_once DOL_DOCUMENT_ROOT . '/core/lib/functions.lib.php';
require_once DOL_DOCUMENT_ROOT . '/core/class/html.formadmin.class.php';
require_once DOL_DOCUMENT_ROOT . '/core/class/html.formcompany.class.php';
require_once DOL_DOCUMENT_ROOT . '/core/class/html.formfile.class.php';
require_once DOL_DOCUMENT_ROOT . '/core/class/extrafields.class.php';
require_once DOL_DOCUMENT_ROOT . '/Modules/Contacts/class/contact.class.php';
require_once DOL_DOCUMENT_ROOT . '/Modules/Categories/class/categorie.class.php';
if (!empty($conf->adherent->enabled)) {
    require_once DOL_DOCUMENT_ROOT . '/Modules/Adherents/class/adherent.class.php';
}

$langs->loadLangs(["companies", "commercial", "bills", "banks", "users"]);
if (!empty($conf->categorie->enabled)) {
    $langs->load("categories");
}
if (!empty($conf->incoterm->enabled)) {
    $langs->load("incoterm");
}
if (!empty($conf->notification->enabled)) {
    $langs->load("mails");
}

$mesg = '';
$error = 0;
$errors = [];

$action = (GETPOST('action', 'aZ09') ? GETPOST('action', 'aZ09') : 'view');
$cancel = GETPOST('cancel', 'alpha');
$backtopage = GETPOST('backtopage', 'alpha');
$confirm = GETPOST('confirm');
$socid = GETPOST('socid', 'int') ? GETPOST('socid', 'int') : GETPOST('id', 'int');
if ($user->socid) {
    $socid = $user->socid;
}
if (empty($socid) && $action == 'view') {
    $action = 'create';
}

$object = new Societe($db);
$extrafields = new ExtraFields($db);

// fetch optionals attributes and labels
$extrafields->fetch_name_optionals_label($object->table_element);

// Initialize technical object to manage hooks of page. Note that conf->hooks_modules contains array of hook context
$hookmanager->initHooks(['thirdpartycontact', 'globalcard']);

if ($object->fetch($socid) <= 0 && $action == 'view') {
    $langs->load("errors");
    print($langs->trans('ErrorRecordNotFound'));
    exit;
}

// Get object canvas (By default, this is not defined, so standard usage of dolibarr)
$canvas = $object->canvas ? $object->canvas : GETPOST("canvas");
$objcanvas = null;
if (!empty($canvas)) {
    require_once DOL_DOCUMENT_ROOT . '/core/class/canvas.class.php';
    $objcanvas = new Canvas($db, $action);
    $objcanvas->getCanvas('thirdparty', 'card', $canvas);
}

// Security check
$result = restrictedArea($user, 'societe', $socid, '&societe', '', 'fk_soc', 'rowid', 0);
if (empty($user->rights->societe->contact->lire)) {
    accessforbidden();
}

/*
 * Actions
 */

$parameters = ['id' => $socid, 'objcanvas' => $objcanvas];
$reshook = $hookmanager->executeHooks('doActions', $parameters, $object, $action); // Note that $action and $object may have been modified by some hooks
if ($reshook < 0) {
    setEventMessages($hookmanager->error, $hookmanager->errors, 'errors');
}

if (empty($reshook)) {
    if ($cancel) {
        $action = '';
        if (!empty($backtopage)) {
            header("Location: " . $backtopage);
            exit;
        }
    }

    // Selection of new fields
    include DOL_DOCUMENT_ROOT . '/core/actions_changeselectedfields.inc.php';
}

require_once DOL_DOCUMENT_ROOT . '/Modules/Societes/Views/contact.php';
