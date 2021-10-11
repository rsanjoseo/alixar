<?php
/* Copyright (C) 2003      Rodolphe Quiedeville <rodolphe@quiedeville.org>
 * Copyright (C) 2003      Eric Seigne          <erics@rycks.com>
 * Copyright (C) 2004-2010 Laurent Destailleur  <eldy@users.sourceforge.net>
 * Copyright (C) 2004      Sebastien Di Cintio  <sdicintio@ressource-toi.org>
 * Copyright (C) 2004      Benoit Mortier       <benoit.mortier@opensides.be>
 * Copyright (C) 2011-2012 Juanjo Menent		<jmenent@2byte.es>
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
 *    \file       htdocs/externalsite/admin/index.php
 *    \ingroup    externalsite
 *    \brief      Page to setup module external site
 */

if (!defined('NOSCANPOSTFORINJECTION')) {
    define('NOSCANPOSTFORINJECTION', '1'); // Do not check anti CSRF attack test
}

// Descend to the htdocs folder
chdir('../../..');
define('BASE_FOLDER', getcwd());

const MAIN_HIDE_TOP_MENU = 0;
const MAIN_HIDE_LEFT_MENU = 0;
const NOREQUIREHTML = 0;
const NOREQUIREDB = 0;      // Si aparece el mensaje: "Call to member function useLocalTax() on null"
const NOREQUIRESOC = 0;     // Es que no se ha asignado a $mysoc el valor correspondiente.

require 'main.php';

require_once DOL_DOCUMENT_ROOT . '/core/lib/admin.lib.php';

if (!$user->admin) {
    accessforbidden();
}

// Load translation files required by the page
$langs->loadLangs(['admin', 'other', 'externalsite']);

$action = GETPOST('action', 'aZ09');

/*
 * Actions
 */

// Sauvegardes parametres
if ($action == 'update') {
    $i = 0;

    $db->begin();

    $label = GETPOST('EXTERNALSITE_LABEL', 'alphanohtml');

    $exturl = GETPOST('EXTERNALSITE_URL', 'none');
    $exturl = dol_string_onlythesehtmltags($exturl, 1, 1, 0, 1);
    $exturl = trim(dol_string_onlythesehtmlattributes($exturl));

    $i += dolibarr_set_const($db, 'EXTERNALSITE_LABEL', trim($label), 'chaine', 0, '', $conf->entity);
    $i += dolibarr_set_const($db, 'EXTERNALSITE_URL', trim($exturl), 'chaine', 0, '', $conf->entity);

    if ($i >= 2) {
        $db->commit();
        setEventMessages($langs->trans("SetupSaved"), null, 'mesgs');
    } else {
        $db->rollback();
        setEventMessages($db->lasterror(), null, 'errors');
    }
}

/**
 * View
 */

llxHeader();

$linkback = '<a href="' . DOL_URL_ROOT . '/admin/modules.php?restore_lastsearch_values=1">' . $langs->trans("BackToModuleList") . '</a>';
print load_fiche_titre($langs->trans("ExternalSiteSetup"), $linkback, 'title_setup');
print '<br>';

print '<span class="opacitymedium">' . $langs->trans("Module100Desc") . "</span><br>\n";
print '<br>';

print '<form name="externalsiteconfig" action="' . $_SERVER["PHP_SELF"] . '" method="POST">';
print '<input type="hidden" name="token" value="' . newToken() . '">';
print '<input type="hidden" name="action" value="update">';
print "<table class=\"noborder\" width=\"100%\">";

print "<tr class=\"liste_titre\">";
print "<td width=\"30%\">" . $langs->trans("Parameter") . "</td>";
print "<td>" . $langs->trans("Value") . "</td>";
print "<td>" . $langs->trans("Examples") . "</td>";
print "</tr>";

print '<tr class="oddeven">';
print '<td class="fieldrequired">' . $langs->trans("Label") . "</td>";
print "<td><input type=\"text\" class=\"flat\" name=\"EXTERNALSITE_LABEL\" value=\"" . (GETPOST('EXTERNALSITE_LABEL', 'alpha') ? GETPOST('EXTERNALSITE_LABEL', 'alpha') : ((empty($conf->global->EXTERNALSITE_LABEL) || $conf->global->EXTERNALSITE_LABEL == 'ExternalSite') ? '' : $conf->global->EXTERNALSITE_LABEL)) . "\" size=\"12\"></td>";
print "<td>" . $langs->trans("ExampleMyMenuEntry") . "</td>";
print "</tr>";

print '<tr class="oddeven">';
print '<td class="fieldrequired">' . $langs->trans("ExternalSiteURL") . "</td>";
print '<td><textarea class="flat minwidth500" name="EXTERNALSITE_URL">';

$exturl = GETPOST('EXTERNALSITE_URL', 'none');
$exturl = dol_string_onlythesehtmltags($exturl, 1, 1, 0, 1);
$exturl = trim(dol_string_onlythesehtmlattributes($exturl));

print (GETPOSTISSET('EXTERNALSITE_URL') ? $exturl : (empty($conf->global->EXTERNALSITE_URL) ? '' : $conf->global->EXTERNALSITE_URL));
print '</textarea></td>';
print "<td>http://localhost/myurl/";
print "<br>https://wikipedia.org/";
print "<br>&lt;iframe&gt;...&lt;/iframe&gt;";
print "</td>";
print "</tr>";

print "</table>";

print $form->buttonsSaveCancel("Save", '');

print "</form>\n";

llxFooter();

$db->close();
