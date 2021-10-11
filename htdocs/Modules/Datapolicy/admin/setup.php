<?php
/* Copyright (C) 2004-2017 Laurent Destailleur  <eldy@users.sourceforge.net>
 * Copyright (C) 2018      Nicolas ZABOURI      <info@inovea-conseil.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

/**
 * \file    htdocs/datapolicy/admin/setup.php
 * \ingroup datapolicy
 * \brief   datapolicy setup page.
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

require_once DOL_DOCUMENT_ROOT . "/core/lib/admin.lib.php";
require_once '../lib/datapolicy.lib.php';

// Translations
$langs->loadLangs(['admin', 'companies', 'members', 'datapolicy@datapolicy']);

// Parameters
$action = GETPOST('action', 'aZ09');
$backtopage = GETPOST('backtopage', 'alpha');

$arrayofparameters = [];
$arrayofparameters['ThirdParty'] = [
    'DATAPOLICY_TIERS_CLIENT' => ['css' => 'minwidth200', 'picto' => img_picto('', 'company', 'class="pictofixedwidth"')],
    'DATAPOLICY_TIERS_PROSPECT' => ['css' => 'minwidth200', 'picto' => img_picto('', 'company', 'class="pictofixedwidth"')],
    'DATAPOLICY_TIERS_PROSPECT_CLIENT' => ['css' => 'minwidth200', 'picto' => img_picto('', 'company', 'class="pictofixedwidth"')],
    'DATAPOLICY_TIERS_NIPROSPECT_NICLIENT' => ['css' => 'minwidth200', 'picto' => img_picto('', 'company', 'class="pictofixedwidth"')],
    'DATAPOLICY_TIERS_FOURNISSEUR' => ['css' => 'minwidth200', 'picto' => img_picto('', 'supplier', 'class="pictofixedwidth"')],
];
if (!empty($conf->global->DATAPOLICY_USE_SPECIFIC_DELAY_FOR_CONTACT)) {
    $arrayofparameters['Contact'] = [
        'DATAPOLICY_CONTACT_CLIENT' => ['css' => 'minwidth200', 'picto' => img_picto('', 'contact', 'class="pictofixedwidth"')],
        'DATAPOLICY_CONTACT_PROSPECT' => ['css' => 'minwidth200', 'picto' => img_picto('', 'contact', 'class="pictofixedwidth"')],
        'DATAPOLICY_CONTACT_PROSPECT_CLIENT' => ['css' => 'minwidth200', 'picto' => img_picto('', 'contact', 'class="pictofixedwidth"')],
        'DATAPOLICY_CONTACT_NIPROSPECT_NICLIENT' => ['css' => 'minwidth200', 'picto' => img_picto('', 'contact', 'class="pictofixedwidth"')],
        'DATAPOLICY_CONTACT_FOURNISSEUR' => ['css' => 'minwidth200', 'picto' => img_picto('', 'contact', 'class="pictofixedwidth"')],
    ];
}
if (!empty($conf->adherent->enabled)) {
    $arrayofparameters['Member'] = [
        'DATAPOLICY_ADHERENT' => ['css' => 'minwidth200', 'picto' => img_picto('', 'member', 'class="pictofixedwidth"')],
    ];
}

$valTab = [
    '' => $langs->trans('Never'),
    '6' => $langs->trans('NB_MONTHS', 6),
    '12' => $langs->trans('ONE_YEAR'),
    '24' => $langs->trans('NB_YEARS', 2),
    '36' => $langs->trans('NB_YEARS', 3),
    '48' => $langs->trans('NB_YEARS', 4),
    '60' => $langs->trans('NB_YEARS', 5),
    '120' => $langs->trans('NB_YEARS', 10),
    '180' => $langs->trans('NB_YEARS', 15),
    '240' => $langs->trans('NB_YEARS', 20),
];

// Access control
if (!$user->admin) {
    accessforbidden();
}

/*
 * Actions
 */

foreach ($arrayofparameters as $title => $tab) {
    foreach ($tab as $key => $val) {
        // Modify constant only if key was posted (avoid resetting key to the null value)
        if (GETPOSTISSET($key)) {
            if (preg_match('/category:/', $val['type'])) {
                if (GETPOST($key, 'int') == '-1') {
                    $val_const = '';
                } else {
                    $val_const = GETPOST($key, 'int');
                }
            } else {
                $val_const = GETPOST($key, 'alpha');
            }

            $result = dolibarr_set_const($db, $key, $val_const, 'chaine', 0, '', $conf->entity);
            if ($result < 0) {
                $error++;
                break;
            }
        }
    }
}

/*
 * View
 */

$page_name = "datapolicySetup";
llxHeader('', $langs->trans($page_name));

// Subheader
$linkback = '<a href="' . ($backtopage ? $backtopage : DOL_URL_ROOT . '/admin/modules.php?restore_lastsearch_values=1') . '">' . $langs->trans("BackToModuleList") . '</a>';

print load_fiche_titre($langs->trans($page_name), $linkback, 'generic');

// Configuration header
$head = datapolicyAdminPrepareHead();
print dol_get_fiche_head($head, 'settings', '', -1, '');

// Setup page goes here
echo '<span class="opacitymedium">' . $langs->trans("datapolicySetupPage") . '</span><br><br>';

if ($action == 'edit') {
    print '<form method="POST" action="' . $_SERVER["PHP_SELF"] . '">';
    print '<input type="hidden" name="token" value="' . newToken() . '">';
    print '<input type="hidden" name="action" value="update">';

    print '<table class="noborder centpercent">';
    print '<tr class="liste_titre"><td class="titlefield">' . $langs->trans("Parameter") . '</td><td>' . $langs->trans("Value") . '</td></tr>';

    foreach ($arrayofparameters as $title => $tab) {
        print '<tr class="trforbreak"><td class="titlefield trforbreak" colspan="2">' . $langs->trans($title) . '</td></tr>';
        foreach ($tab as $key => $val) {
            print '<tr class="oddeven"><td>';
            print $val['picto'];
            print $form->textwithpicto($langs->trans($key), $langs->trans($key . 'Tooltip'));
            print '</td><td>';
            print '<select name="' . $key . '"  class="flat ' . (empty($val['css']) ? 'minwidth200' : $val['css']) . '">';
            foreach ($valTab as $key1 => $val1) {
                print '<option value="' . $key1 . '" ' . ($conf->global->$key == $key1 ? 'selected="selected"' : '') . '>';
                print $val1;
                print '</option>';
            }
            print '</select>';
            print '</td></tr>';
        }
    }

    print '</table>';

    print '<br><div class="center">';
    print '<input class="button button-save" type="submit" value="' . $langs->trans("Save") . '">';
    print '</div>';

    print '</form>';
    print '<br>';
} else {
    print '<table class="noborder centpercent">';
    print '<tr class="liste_titre"><td class="titlefield">' . $langs->trans("Parameter") . '</td><td>' . $langs->trans("Value") . '</td></tr>';

    foreach ($arrayofparameters as $title => $tab) {
        print '<tr class="trforbreak"><td class="titlefield trforbreak" colspan="2">' . $langs->trans($title) . '</td></tr>';
        foreach ($tab as $key => $val) {
            print '<tr class="oddeven"><td>';
            print $val['picto'];
            print $form->textwithpicto($langs->trans($key), $langs->trans('DATAPOLICY_Tooltip_SETUP'));
            print '</td><td>' . ($conf->global->$key == '' ? $langs->trans('None') : $valTab[$conf->global->$key]) . '</td></tr>';
        }
    }

    print '</table>';

    print '<div class="tabsAction">';
    print '<a class="butAction" href="' . $_SERVER["PHP_SELF"] . '?action=edit&token=' . newToken() . '">' . $langs->trans("Modify") . '</a>';
    print '</div>';
}

// Page end
print dol_get_fiche_end();

llxFooter();
$db->close();
