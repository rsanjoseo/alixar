<?php
/**
 * Copyright (C) 2021-2021  Rafael San José Tovar   <info@rsanjoseo.com>
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

namespace Alxarafe\Modules\Admin\Views;

use Alxarafe\Core\Base\BasicController;
use Alxarafe\Dolibarr\Base\DolibarrView;
use Alxarafe\Dolibarr\Classes\Form;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;

class InitView extends DolibarrView
{
    public $object;

    public function __construct(BasicController $controller)
    {
        parent::__construct($controller);
        $this->object = $controller->object;
    }

    function printPage(): string
    {
        $form = new Form();

        $wikihelp = 'EN:First_setup|FR:Premiers_paramétrages|ES:Primeras_configuraciones';
        $this->llxHeader('', $this->langs->trans("Setup"), $wikihelp);

        print DolibarrFunctions::load_fiche_titre($this->langs->trans("SetupArea"), '', 'tools');

        if (!empty($this->conf->global->MAIN_MOTD_SETUPPAGE)) {
            $this->conf->global->MAIN_MOTD_SETUPPAGE = preg_replace('/<br(\s[\sa-zA-Z_="]*)?\/?>/i', '<br>', $this->conf->global->MAIN_MOTD_SETUPPAGE);
            if (!empty($this->conf->global->MAIN_MOTD_SETUPPAGE)) {
                $i = 0;
                $reg = [];
                while (preg_match('/__\(([a-zA-Z|@]+)\)__/i', $this->conf->global->MAIN_MOTD_SETUPPAGE, $reg) && $i < 100) {
                    $tmp = explode('|', $reg[1]);
                    if (!empty($tmp[1])) {
                        $this->langs->load($tmp[1]);
                    }
                    $this->conf->global->MAIN_MOTD_SETUPPAGE = preg_replace('/__\(' . preg_quote($reg[1]) . '\)__/i', $this->langs->trans($tmp[0]), $this->conf->global->MAIN_MOTD_SETUPPAGE);
                    $i++;
                }

                print "\n<!-- Start of welcome text for setup page -->\n";
                print '<table width="100%" class="notopnoleftnoright"><tr><td>';
                print dol_htmlentitiesbr($this->conf->global->MAIN_MOTD_SETUPPAGE);
                print '</td></tr></table><br>';
                print "\n<!-- End of welcome text for setup page -->\n";
            }
        }

        print '<span class="opacitymedium hideonsmartphone">';
        print $this->langs->trans("SetupDescription1") . ' ';
        print $this->langs->trans("AreaForAdminOnly") . ' ';
        print $this->langs->trans("SetupDescription2", $this->langs->transnoentities("MenuCompanySetup"), $this->langs->transnoentities("Modules"));
        print "<br><br>";
        print '</span>';

        print '<br><br>';

        // Show info setup company
        if (empty($this->conf->global->MAIN_INFO_SOCIETE_NOM) || empty($this->conf->global->MAIN_INFO_SOCIETE_COUNTRY)) {
            $setupcompanynotcomplete = 1;
        }
        print DolibarrFunctions::img_picto('', 'company', 'class="paddingright valignmiddle double"') . ' ' . $this->langs->trans("SetupDescriptionLink", BASE_URI . '?module=Admin&controller=company&mainmenu=home' . (empty($setupcompanynotcomplete) ? '' : '&action=edit&token=' . DolibarrFunctions::newToken()), $this->langs->transnoentities("Setup"), $this->langs->transnoentities("MenuCompanySetup"));
        print '<br><br>' . $this->langs->trans("SetupDescription3b");
        if (!empty($setupcompanynotcomplete)) {
            $this->langs->load("errors");
            $warnpicto = DolibarrFunctions::img_warning($this->langs->trans("WarningMandatorySetupNotComplete"), 'style="padding-right: 6px;"');
            print '<br><div class="warning"><a href="' . BASE_URI . '?module=Admin&controller=company&mainmenu=home' . (empty($setupcompanynotcomplete) ? '' : '&action=edit') . '">' . $warnpicto . $this->langs->trans("WarningMandatorySetupNotComplete") . '</a></div>';
        }
        print '<br>';
        print '<br>';
        print '<br>';

        // Show info setup module
        print DolibarrFunctions::img_picto('', 'cog', 'class="paddingright valignmiddle double"') . ' ' . $this->langs->trans("SetupDescriptionLink", DOL_URL_ROOT . '/admin/modules.php?mainmenu=home', $this->langs->transnoentities("Setup"), $this->langs->transnoentities("Modules"));
        print '<br><br>' . $this->langs->trans("SetupDescription4b");
        if (count($this->conf->modules) <= (empty($this->conf->global->MAIN_MIN_NB_ENABLED_MODULE_FOR_WARNING) ? 1 : $this->conf->global->MAIN_MIN_NB_ENABLED_MODULE_FOR_WARNING)) {    // If only minimal initial modules enabled
            $this->langs->load("errors");
            $warnpicto = DolibarrFunctions::img_warning($this->langs->trans("WarningEnableYourModulesApplications"), 'style="padding-right: 6px;"');
            print '<br><div class="warning"><a href="' . DOL_URL_ROOT . '/admin/modules.php?mainmenu=home">' . $warnpicto . $this->langs->trans("WarningEnableYourModulesApplications") . '</a></div>';
        }
        print '<br>';
        print '<br>';
        print '<br>';
        print '<br>';

        // Add hook to add information
        $parameters = [];
        $reshook = $this->hookmanager->executeHooks('addHomeSetup', $parameters, $object, $action); // Note that $action and $object may have been modified by some hooks
        print $this->hookmanager->resPrint;
        if (empty($reshook)) {
            // Show into other
            print '<span class="opacitymedium">' . $this->langs->trans("SetupDescription5") . "</span><br>";
            print "<br>";

            // Show logo
            print '<div class="center"><div class="logo_setup"></div></div>';
        }

        // End of page
        $this->llxFooter();
        //$db->close();

        return parent::printPage();
    }
}
