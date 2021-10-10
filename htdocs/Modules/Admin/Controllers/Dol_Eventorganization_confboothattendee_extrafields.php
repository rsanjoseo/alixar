<?php
/* Copyright (C) 2001-2002	Rodolphe Quiedeville	<rodolphe@quiedeville.org>
 * Copyright (C) 2003		Jean-Louis Bergamo		<jlb@j1b.org>
 * Copyright (C) 2004-2011	Laurent Destailleur		<eldy@users.sourceforge.net>
 * Copyright (C) 2012		Regis Houssin			<regis.houssin@inodbox.com>
 * Copyright (C) 2014		Florian Henry			<florian.henry@open-concept.pro>
 * Copyright (C) 2015		Jean-François Ferry		<jfefe@aternatik.fr>
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
 *      \file       admin/conferenceorboothattendee_extrafields.php
 *        \ingroup    eventorganization
 *        \brief      Page to setup extra fields of conferenceorboothattendee
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

require_once DOL_DOCUMENT_ROOT . '/core/lib/eventorganization.lib.php';
require_once DOL_DOCUMENT_ROOT . '/core/class/extrafields.class.php';

// Load translation files required by the page
$langs->loadLangs(['eventorganization', 'admin']);

$extrafields = new ExtraFields($db);
$form = new Form($db);

// List of supported format
$tmptype2label = ExtraFields::$type2label;
$type2label = [''];
foreach ($tmptype2label as $key => $val) {
    $type2label[$key] = $langs->transnoentitiesnoconv($val);
}

$action = GETPOST('action', 'aZ09');
$attrname = GETPOST('attrname', 'alpha');
$elementtype = 'eventorganization_conferenceorboothattendee'; //Must be the $table_element of the class that manage extrafield

if (!$user->admin) {
    accessforbidden();
}

/*
 * Actions
 */

require DOL_DOCUMENT_ROOT . '/core/actions_extrafields.inc.php';

/*
 * View
 */

$help_url = '';
$page_name = 'EventOrganizationSetup';

llxHeader('', $langs->trans($page_name), $help_url);

$linkback = '<a href="' . DOL_URL_ROOT . '/admin/modules.php?restore_lastsearch_values=1">' . $langs->trans("BackToModuleList") . '</a>';
print load_fiche_titre($langs->trans($page_name), $linkback, 'title_setup');

$head = eventorganizationAdminPrepareHead();

print dol_get_fiche_head($head, 'conferenceorboothattendee_extrafields', $langs->trans("ConferenceOrBoothAttendeeExtraFields"), -1, 'eventorganization');

require DOL_DOCUMENT_ROOT . '/core/tpl/admin_extrafields_view.tpl.php';

print dol_get_fiche_end();

// Buttons
if ($action != 'create' && $action != 'edit') {
    print '<div class="tabsAction">';
    print "<a class=\"butAction\" href=\"" . $_SERVER["PHP_SELF"] . "?action=create#newattrib\">" . $langs->trans("NewAttribute") . "</a>";
    print "</div>";
}

/*
 * Creation of an optional field
 */
if ($action == 'create') {
    print '<br><div id="newattrib"></div>';
    print load_fiche_titre($langs->trans('NewAttribute'));

    require DOL_DOCUMENT_ROOT . '/core/tpl/admin_extrafields_add.tpl.php';
}

/*
 * Edition of an optional field
 */
if ($action == 'edit' && !empty($attrname)) {
    print "<br>";
    print load_fiche_titre($langs->trans("FieldEdition", $attrname));

    require DOL_DOCUMENT_ROOT . '/core/tpl/admin_extrafields_edit.tpl.php';
}

// End of page
llxFooter();
$db->close();
