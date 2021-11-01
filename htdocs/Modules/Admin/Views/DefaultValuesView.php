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
 *
 * ---
 *
 * Copyright (C) 2017-2020    Laurent Destailleur    <eldy@users.sourceforge.net>
 * Copyright (C) 2017-2018    Regis Houssin        <regis.houssin@inodbox.com>
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
 *
 */

namespace Alxarafe\Modules\Admin\Views;

use Alxarafe\Core\Base\BasicController;
use Alxarafe\Dolibarr\Base\DolibarrListView;
use Alxarafe\Dolibarr\Classes\Form;
use Alxarafe\Dolibarr\Classes\FormAdmin;
use Alxarafe\Dolibarr\Libraries\DolibarrAdmin;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;

/**
 * Class Login
 *
 * @package Alxarafe\Views
 */
class DefaultValuesView extends DolibarrListView
{
    public $object;

    public function __construct(BasicController $controller)
    {
        parent::__construct($controller);
        $this->object = $controller->object;
    }

    function printPage(): string
    {
        // $db = Config::getInstance()->getEngine();
        //        $langs = Translator::getInstance();
        //        $this->conf = DolibarrConfig::getInstance()->getConf();

        $form = new Form();
        $formadmin = new FormAdmin();

        $wikihelp = 'EN:First_setup|FR:Premiers_paramétrages|ES:Primeras_configuraciones';
        $this->llxHeader('', $this->langs->trans("Setup"), $wikihelp);

        $param = '&mode=' . $this->controller->mode;

        $enabledisablehtml = $this->langs->trans("EnableDefaultValues") . ' ';
        if (empty($this->conf->global->MAIN_ENABLE_DEFAULT_VALUES)) {
            // Button off, click to enable
            $enabledisablehtml .= '<a class="reposition valignmiddle" href="' . $_SERVER["PHP_SELF"] . '?action=setMAIN_ENABLE_DEFAULT_VALUES&token=' . DolibarrFunctions::newToken() . '&value=1' . $param . '">';
            $enabledisablehtml .= DolibarrFunctions::img_picto($this->langs->trans("Disabled"), 'switch_off');
            $enabledisablehtml .= '</a>';
        } else {
            // Button on, click to disable
            $enabledisablehtml .= '<a class="reposition valignmiddle" href="' . $_SERVER["PHP_SELF"] . '?action=setMAIN_ENABLE_DEFAULT_VALUES&token=' . DolibarrFunctions::newToken() . '&value=0' . $param . '">';
            $enabledisablehtml .= DolibarrFunctions::img_picto($this->langs->trans("Activated"), 'switch_on');
            $enabledisablehtml .= '</a>';
        }

        print DolibarrFunctions::load_fiche_titre($this->langs->trans("DefaultValues"), $enabledisablehtml, 'title_setup');

        print '<span class="opacitymedium">' . $this->langs->trans("DefaultValuesDesc") . "</span><br>\n";
        print "<br>\n";

        if (!empty($contextpage) && $contextpage != $_SERVER["PHP_SELF"]) {
            $param .= '&contextpage=' . urlencode($contextpage);
        }
        if ($this->controller->limit > 0 && $this->controller->limit != $this->conf->liste_limit) {
            $param .= '&limit=' . urlencode($this->controller->limit);
        }
        if ($this->controller->optioncss != '') {
            $param .= '&optioncss=' . urlencode($this->controller->optioncss);
        }
        if ($this->controller->defaulturl) {
            $param .= '&defaulturl=' . urlencode($this->controller->defaulturl);
        }
        if ($this->controller->defaultkey) {
            $param .= '&defaultkey=' . urlencode($this->controller->defaultkey);
        }
        if ($this->controller->defaultvalue) {
            $param .= '&defaultvalue=' . urlencode($this->controller->defaultvalue);
        }

        $url = $_SERVER['PHP_SELF'] .
            '?' . self::MODULE_GET_VAR . '=' . $_GET[self::MODULE_GET_VAR] .
            '&' . self::CONTROLLER_GET_VAR . '=' . $_GET[self::CONTROLLER_GET_VAR];
        print '<form action="' . $url . '" method="POST">';

        if ($this->controller->optioncss != '') {
            print '<input type="hidden" name="optioncss" value="' . $this->controller->optioncss . '">';
        }
        print '<input type="hidden" name="token" value="' . DolibarrFunctions::newToken() . '">';
        print '<input type="hidden" name="formfilteraction" id="formfilteraction" value="list">';
        print '<input type="hidden" name="action" value="list">';
        print '<input type="hidden" name="sortfield" value="' . $this->controller->sortfield . '">';
        print '<input type="hidden" name="sortorder" value="' . $this->controller->sortorder . '">';
        print '<input type="hidden" name="page" value="' . $this->controller->page . '">';

        $head = DolibarrAdmin::defaultvalues_prepare_head();

        print DolibarrFunctions::dol_get_fiche_head($head, $this->controller->mode, '', -1, '');

        if ($this->controller->mode == 'sortorder') {
            print DolibarrFunctions::info_admin($this->langs->trans("WarningSettingSortOrder")) . '<br>';
        }
        if ($this->controller->mode == 'mandatory') {
            print DolibarrFunctions::info_admin($this->langs->trans("FeatureSupportedOnTextFieldsOnly")) . '<br>';
        }

        print '<input type="hidden" name="token" value="' . DolibarrFunctions::newToken() . '">';
        print '<input type="hidden" id="action" name="action" value="">';
        print '<input type="hidden" id="mode" name="mode" value="' . DolibarrFunctions::dol_escape_htmltag($this->controller->mode) . '">';

        print '<div class="div-table-responsive-no-min">';
        print '<table class="noborder centpercent">';
        print '<tr class="liste_titre">';
        // Page
        $texthelp = $this->langs->trans("PageUrlForDefaultValues");
        if ($this->controller->mode == 'createform') {
            $texthelp .= $this->langs->trans("PageUrlForDefaultValuesCreate", 'societe/card.php', 'societe/card.php?abc=val1&def=val2');
        } else {
            $texthelp .= $this->langs->trans("PageUrlForDefaultValuesList", 'societe/list.php', 'societe/list.php?abc=val1&def=val2');
        }
        $texthelp .= '<br><br>' . $this->langs->trans("AlsoDefaultValuesAreEffectiveForActionCreate");
        $texturl = $form->textwithpicto($this->langs->trans("RelativeURL"), $texthelp);
        DolibarrFunctions::print_liste_field_titre($texturl, $_SERVER["PHP_SELF"], 'page,param', '', $param, '', $this->controller->sortfield, $this->controller->sortorder);
        // Field
        $texthelp = $this->langs->trans("TheKeyIsTheNameOfHtmlField");
        if ($this->controller->mode != 'sortorder') {
            $textkey = $form->textwithpicto($this->langs->trans("Field"), $texthelp);
        } else {
            $texthelp = 'field or alias.field';
            $textkey = $form->textwithpicto($this->langs->trans("Field"), $texthelp);
        }
        DolibarrFunctions::print_liste_field_titre($textkey, $_SERVER["PHP_SELF"], 'param', '', $param, '', $this->controller->sortfield, $this->controller->sortorder);
        // Value
        if ($this->controller->mode != 'focus' && $this->controller->mode != 'mandatory') {
            if ($this->controller->mode != 'sortorder') {
                $substitutionarray = DolibarrFunctions::getCommonSubstitutionArray($this->langs, 2, ['object', 'objectamount']); // Must match list into DolibarrFunctions::GETPOST
                unset($substitutionarray['__USER_SIGNATURE__']);
                $texthelp = $this->langs->trans("FollowingConstantsWillBeSubstituted") . '<br>';
                foreach ($substitutionarray as $key => $val) {
                    $texthelp .= $key . ' -> ' . $val . '<br>';
                }
                $textvalue = $form->textwithpicto($this->langs->trans("Value"), $texthelp, 1, 'help', '', 0, 2, 'subsitutiontooltip');
            } else {
                $texthelp = 'ASC or DESC';
                $textvalue = $form->textwithpicto($this->langs->trans("SortOrder"), $texthelp);
            }
            DolibarrFunctions::print_liste_field_titre($textvalue, $_SERVER["PHP_SELF"], 'value', '', $param, '', $this->controller->sortfield, $this->controller->sortorder);
        }

        // Entity
        if (!empty($this->conf->multicompany->enabled) && !$this->controller->user->entity) {
            DolibarrFunctions::print_liste_field_titre("Entity", $_SERVER["PHP_SELF"], 'entity,page', '', $param, '', $this->controller->sortfield, $this->controller->sortorder);
        } else {
            DolibarrFunctions::print_liste_field_titre("", $_SERVER["PHP_SELF"], '', '', $param, '', $this->controller->sortfield, $this->controller->sortorder);
        }

        // Actions
        DolibarrFunctions::print_liste_field_titre("", $_SERVER["PHP_SELF"], '', '', $param, '', $this->controller->sortfield, $this->controller->sortorder);
        print "</tr>\n";

        // Line to add new record
        print "\n";

        print '<tr class="oddeven">';
        // Page
        print '<td>';
        print '<input type="text" class="flat minwidth200 maxwidthonsmartphone" name="defaulturl" value="' . DolibarrFunctions::dol_escape_htmltag(DolibarrFunctions::GETPOST('defaulturl', 'alphanohtml')) . '">';
        print '</td>' . "\n";
        // Field
        print '<td>';
        print '<input type="text" class="flat maxwidth100onsmartphone" name="defaultkey" value="' . DolibarrFunctions::dol_escape_htmltag(DolibarrFunctions::GETPOST('defaultkey', 'alphanohtml')) . '">';
        print '</td>';
        // Value
        if ($this->controller->mode != 'focus' && $this->controller->mode != 'mandatory') {
            print '<td>';
            print '<input type="text" class="flat maxwidth100onsmartphone" name="defaultvalue" value="">';
            print '</td>';
        }
        // Limit to superadmin
        if (!empty($this->conf->multicompany->enabled) && !$this->controller->user->entity) {
            print '<td>';
            print '<input type="text" class="flat" size="1" disabled name="entity" value="' . $this->conf->entity . '">'; // We see environment, but to change it we must switch on other entity
            print '</td>';
        } else {
            print '<td class="center">';
            print '<input type="hidden" name="entity" value="' . $this->conf->entity . '">';
            print '</td>';
        }
        print '<td class="center">';
        $disabled = '';
        if (empty($this->conf->global->MAIN_ENABLE_DEFAULT_VALUES)) {
            $disabled = ' disabled="disabled"';
        }
        print '<input type="submit" class="button"' . $disabled . ' value="' . $this->langs->trans("Add") . '" name="add">';
        print "</td>\n";
        print '</tr>';

        $result = $this->object->fetchAll($this->controller->sortorder, $this->controller->sortfield, 0, 0, ['t.type' => $this->controller->mode, 't.entity' => [$this->controller->user->entity, $this->conf->entity]]);

        if (!is_array($result) && $result < 0) {
            DolibarrFunctions::setEventMessages($this->object->error, $this->object->errors, 'errors');
        } elseif (count($result) > 0) {
            foreach ($result as $key => $defaultvalue) {
                print "\n";

                print '<tr class="oddeven">';

                // Page
                print '<td>';
                if ($this->controller->action != 'edit' || DolibarrFunctions::GETPOST('rowid', 'int') != $defaultvalue->id) {
                    print $defaultvalue->page;
                } else {
                    print '<input type="text" name="urlpage" value="' . DolibarrFunctions::dol_escape_htmltag($defaultvalue->page) . '">';
                }
                print '</td>' . "\n";

                // Field
                print '<td>';
                if ($this->controller->action != 'edit' || DolibarrFunctions::GETPOST('rowid') != $defaultvalue->id) {
                    print $defaultvalue->param;
                } else {
                    print '<input type="text" name="key" value="' . DolibarrFunctions::dol_escape_htmltag($defaultvalue->param) . '">';
                }
                print '</td>' . "\n";

                // Value
                if ($this->controller->mode != 'focus' && $this->controller->mode != 'mandatory') {
                    print '<td>';
                    /*print '<input type="hidden" name="const['.$i.'][rowid]" value="'.$obj->rowid.'">';
                    print '<input type="hidden" name="const['.$i.'][lang]" value="'.$obj->lang.'">';
                    print '<input type="hidden" name="const['.$i.'][name]" value="'.$obj->transkey.'">';
                    print '<input type="text" id="value_'.$i.'" class="flat inputforupdate" size="30" name="const['.$i.'][value]" value="'.DolibarrFunctions::dol_escape_htmltag($obj->transvalue).'">';
                    */
                    if ($this->controller->action != 'edit' || DolibarrFunctions::GETPOST('rowid') != $defaultvalue->id) {
                        print DolibarrFunctions::dol_escape_htmltag($defaultvalue->value);
                    } else {
                        print '<input type="text" name="value" value="' . DolibarrFunctions::dol_escape_htmltag($defaultvalue->value) . '">';
                    }
                    print '</td>';
                }

                print '<td></td>';

                // Actions
                print '<td class="center">';
                if ($this->controller->action != 'edit' || DolibarrFunctions::GETPOST('rowid') != $defaultvalue->id) {
                    print '<a class="editfielda marginleftonly marginrightonly" href="' . $_SERVER['PHP_SELF'] . '?rowid=' . $defaultvalue->id . '&entity=' . $defaultvalue->entity . '&mode=' . $this->controller->mode . '&action=edit&token=' . DolibarrFunctions::newToken() . '">' . DolibarrFunctions::img_edit() . '</a>';
                    print '<a class="marginleftonly marginrightonly" href="' . $_SERVER['PHP_SELF'] . '?rowid=' . $defaultvalue->id . '&entity=' . $defaultvalue->entity . '&mode=' . $this->controller->mode . '&action=delete&token=' . DolibarrFunctions::newToken() . '">' . DolibarrFunctions::img_delete() . '</a>';
                } else {
                    print '<input type="hidden" name="page" value="' . $this->controller->page . '">';
                    print '<input type="hidden" name="rowid" value="' . $this->controller->id . '">';
                    print '<div name="' . (!empty($defaultvalue->id) ? $defaultvalue->id : 'none') . '"></div>';
                    print '<input type="submit" class="button button-edit" name="actionmodify" value="' . $this->langs->trans("Modify") . '">';
                    print '<input type="submit" class="button button-cancel" name="actioncancel" value="' . $this->langs->trans("Cancel") . '">';
                }
                print '</td>';

                print "</tr>\n";
                print "\n";
                $i++;
            }
        }

        print '</table>';
        print '</div>';

        print DolibarrFunctions::dol_get_fiche_end();

        print "</form>\n";

        // End of page
        $this->llxFooter();
        // $db->close();

        return parent::printPage();
    }
}
