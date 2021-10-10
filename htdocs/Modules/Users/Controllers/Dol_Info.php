<?php
/* Copyright (C) 2004-2007 Laurent Destailleur  <eldy@users.sourceforge.net>
 * Copyright (C) 2005-2015 Regis Houssin        <regis.houssin@inodbox.com>
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
 *      \file       htdocs/user/info.php
 *      \ingroup    core
 *        \brief      Page des informations d'un utilisateur
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
require_once DOL_DOCUMENT_ROOT . '/core/lib/usergroups.lib.php';
require_once DOL_DOCUMENT_ROOT . '/Modules/Users/class/user.class.php';

// Load translation files required by page
$langs->load("users");

// Security check
$id = GETPOST('id', 'int');
$ref = GETPOST('ref', 'alpha');

$object = new User($db);
if ($id > 0 || !empty($ref)) {
    $result = $object->fetch($id, $ref, '', 1);
    $object->getrights();
}

// Security check
$socid = 0;
if ($user->socid > 0) {
    $socid = $user->socid;
}
$feature2 = (($socid && $user->rights->user->self->creer) ? '' : 'user');

$result = restrictedArea($user, 'user', $id, 'user&user', $feature2);

// If user is not user that read and no permission to read other users, we stop
if (($object->id != $user->id) && (!$user->rights->user->user->lire)) {
    accessforbidden();
}

/*
 * View
 */

$form = new Form($db);

llxHeader();

$head = user_prepare_head($object);

$title = $langs->trans("User");
print dol_get_fiche_head($head, 'info', $title, -1, 'user');

$linkback = '';

if ($user->rights->user->user->lire || $user->admin) {
    $linkback = '<a href="' . DOL_URL_ROOT . '/Modules/Users/list.php?restore_lastsearch_values=1">' . $langs->trans("BackToList") . '</a>';
}

dol_banner_tab($object, 'id', $linkback, $user->rights->user->user->lire || $user->admin);

$object->info($id); // This overwrite ->ref with login instead of id

print '<div class="fichecenter">';
print '<div class="underbanner clearboth"></div>';

print '<br>';

dol_print_object_info($object);

print '</div>';

print dol_get_fiche_end();

// End of page
llxFooter();
$db->close();
