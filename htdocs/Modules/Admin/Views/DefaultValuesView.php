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
use Alxarafe\Core\Singletons\Config;
use Alxarafe\Dolibarr\Base\DolibarrView;
use Alxarafe\Dolibarr\Classes\DefaultValuesClass;
use Alxarafe\Dolibarr\Classes\Form;
use Alxarafe\Dolibarr\Classes\FormAdmin;
use Alxarafe\Dolibarr\Libraries\DolibarrAdmin;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;
use Sabre\DAV\Exception;

/**
 * Class Login
 *
 * @package Alxarafe\Views
 */
class DefaultValuesView extends DolibarrView
{
    public $object;

    public function __construct(BasicController $controller)
    {
        parent::__construct($controller);
        $this->object = new DefaultValuesClass();
    }

    function printPage(): string
    {
        $db = Config::getInstance()->getEngine();
        //        $langs = Translator::getInstance();
        //        $conf = DolibarrConfig::getInstance()->getConf();

        $form = new Form($db);
        $formadmin = new FormAdmin($db);

        $wikihelp = 'EN:First_setup|FR:Premiers_paramétrages|ES:Primeras_configuraciones';
        $this->llxHeader('', $this->langs->trans("Setup"), $wikihelp);

        $param = '&mode=' . $mode;

        $enabledisablehtml = $this->langs->trans("EnableDefaultValues") . ' ';
        if (empty($conf->global->MAIN_ENABLE_DEFAULT_VALUES)) {
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
        if ($limit > 0 && $limit != $conf->liste_limit) {
            $param .= '&limit=' . urlencode($limit);
        }
        if ($optioncss != '') {
            $param .= '&optioncss=' . urlencode($optioncss);
        }
        if ($defaulturl) {
            $param .= '&defaulturl=' . urlencode($defaulturl);
        }
        if ($defaultkey) {
            $param .= '&defaultkey=' . urlencode($defaultkey);
        }
        if ($defaultvalue) {
            $param .= '&defaultvalue=' . urlencode($defaultvalue);
        }

        print '<form action="' . $_SERVER["PHP_SELF"] . '" method="POST">';
        if ($optioncss != '') {
            print '<input type="hidden" name="optioncss" value="' . $optioncss . '">';
        }
        print '<input type="hidden" name="token" value="' . DolibarrFunctions::newToken() . '">';
        print '<input type="hidden" name="formfilteraction" id="formfilteraction" value="list">';
        print '<input type="hidden" name="action" value="list">';
        print '<input type="hidden" name="sortfield" value="' . $sortfield . '">';
        print '<input type="hidden" name="sortorder" value="' . $sortorder . '">';
        print '<input type="hidden" name="page" value="' . $page . '">';

        $head = DolibarrAdmin::defaultvalues_prepare_head();

        print DolibarrFunctions::dol_get_fiche_head($head, $mode, '', -1, '');

        if ($mode == 'sortorder') {
            print DolibarrFunctions::info_admin($this->langs->trans("WarningSettingSortOrder")) . '<br>';
        }
        if ($mode == 'mandatory') {
            print DolibarrFunctions::info_admin($this->langs->trans("FeatureSupportedOnTextFieldsOnly")) . '<br>';
        }

        print '<input type="hidden" name="token" value="' . DolibarrFunctions::newToken() . '">';
        print '<input type="hidden" id="action" name="action" value="">';
        print '<input type="hidden" id="mode" name="mode" value="' . DolibarrFunctions::dol_escape_htmltag($mode) . '">';

        print '<div class="div-table-responsive-no-min">';
        print '<table class="noborder centpercent">';
        print '<tr class="liste_titre">';
        // Page
        $texthelp = $this->langs->trans("PageUrlForDefaultValues");
        if ($mode == 'createform') {
            $texthelp .= $this->langs->trans("PageUrlForDefaultValuesCreate", 'societe/card.php', 'societe/card.php?abc=val1&def=val2');
        } else {
            $texthelp .= $this->langs->trans("PageUrlForDefaultValuesList", 'societe/list.php', 'societe/list.php?abc=val1&def=val2');
        }
        $texthelp .= '<br><br>' . $this->langs->trans("AlsoDefaultValuesAreEffectiveForActionCreate");
        $texturl = $form->textwithpicto($this->langs->trans("RelativeURL"), $texthelp);
        DolibarrFunctions::print_liste_field_titre($texturl, $_SERVER["PHP_SELF"], 'page,param', '', $param, '', $sortfield, $sortorder);
        // Field
        $texthelp = $this->langs->trans("TheKeyIsTheNameOfHtmlField");
        if ($mode != 'sortorder') {
            $textkey = $form->textwithpicto($this->langs->trans("Field"), $texthelp);
        } else {
            $texthelp = 'field or alias.field';
            $textkey = $form->textwithpicto($this->langs->trans("Field"), $texthelp);
        }
        DolibarrFunctions::print_liste_field_titre($textkey, $_SERVER["PHP_SELF"], 'param', '', $param, '', $sortfield, $sortorder);
        // Value
        if ($mode != 'focus' && $mode != 'mandatory') {
            if ($mode != 'sortorder') {
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
            DolibarrFunctions::print_liste_field_titre($textvalue, $_SERVER["PHP_SELF"], 'value', '', $param, '', $sortfield, $sortorder);
        }

        // Entity
        if (!empty($conf->multicompany->enabled) && !$user->entity) {
            DolibarrFunctions::print_liste_field_titre("Entity", $_SERVER["PHP_SELF"], 'entity,page', '', $param, '', $sortfield, $sortorder);
        } else {
            DolibarrFunctions::print_liste_field_titre("", $_SERVER["PHP_SELF"], '', '', $param, '', $sortfield, $sortorder);
        }
        // Actions
        DolibarrFunctions::print_liste_field_titre("", $_SERVER["PHP_SELF"], '', '', $param, '', $sortfield, $sortorder);
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
        if ($mode != 'focus' && $mode != 'mandatory') {
            print '<td>';
            print '<input type="text" class="flat maxwidth100onsmartphone" name="defaultvalue" value="">';
            print '</td>';
        }
        // Limit to superadmin
        if (!empty($conf->multicompany->enabled) && !$user->entity) {
            print '<td>';
            print '<input type="text" class="flat" size="1" disabled name="entity" value="' . $conf->entity . '">'; // We see environment, but to change it we must switch on other entity
            print '</td>';
        } else {
            print '<td class="center">';
            print '<input type="hidden" name="entity" value="' . $conf->entity . '">';
            print '</td>';
        }
        print '<td class="center">';
        $disabled = '';
        if (empty($conf->global->MAIN_ENABLE_DEFAULT_VALUES)) {
            $disabled = ' disabled="disabled"';
        }
        print '<input type="submit" class="button"' . $disabled . ' value="' . $this->langs->trans("Add") . '" name="add">';
        print "</td>\n";
        print '</tr>';

        $result = $this->object->fetchAll($sortorder, $sortfield, 0, 0, ['t.type' => $mode, 't.entity' => [$this->user->entity, $this->conf->entity]]);

        if (!is_array($result) && $result < 0) {
            setEventMessages($this->object->error, $this->object->errors, 'errors');
        } elseif (count($result) > 0) {
            foreach ($result as $key => $defaultvalue) {
                print "\n";

                print '<tr class="oddeven">';

                // Page
                print '<td>';
                if ($action != 'edit' || DolibarrFunctions::GETPOST('rowid', 'int') != $defaultvalue->id) {
                    print $defaultvalue->page;
                } else {
                    print '<input type="text" name="urlpage" value="' . DolibarrFunctions::dol_escape_htmltag($defaultvalue->page) . '">';
                }
                print '</td>' . "\n";

                // Field
                print '<td>';
                if ($action != 'edit' || DolibarrFunctions::GETPOST('rowid') != $defaultvalue->id) {
                    print $defaultvalue->param;
                } else {
                    print '<input type="text" name="key" value="' . DolibarrFunctions::dol_escape_htmltag($defaultvalue->param) . '">';
                }
                print '</td>' . "\n";

                // Value
                if ($mode != 'focus' && $mode != 'mandatory') {
                    print '<td>';
                    /*print '<input type="hidden" name="const['.$i.'][rowid]" value="'.$obj->rowid.'">';
                    print '<input type="hidden" name="const['.$i.'][lang]" value="'.$obj->lang.'">';
                    print '<input type="hidden" name="const['.$i.'][name]" value="'.$obj->transkey.'">';
                    print '<input type="text" id="value_'.$i.'" class="flat inputforupdate" size="30" name="const['.$i.'][value]" value="'.DolibarrFunctions::dol_escape_htmltag($obj->transvalue).'">';
                    */
                    if ($action != 'edit' || DolibarrFunctions::GETPOST('rowid') != $defaultvalue->id) {
                        print DolibarrFunctions::dol_escape_htmltag($defaultvalue->value);
                    } else {
                        print '<input type="text" name="value" value="' . DolibarrFunctions::dol_escape_htmltag($defaultvalue->value) . '">';
                    }
                    print '</td>';
                }

                print '<td></td>';

                // Actions
                print '<td class="center">';
                if ($action != 'edit' || DolibarrFunctions::GETPOST('rowid') != $defaultvalue->id) {
                    print '<a class="editfielda marginleftonly marginrightonly" href="' . $_SERVER['PHP_SELF'] . '?rowid=' . $defaultvalue->id . '&entity=' . $defaultvalue->entity . '&mode=' . $mode . '&action=edit&token=' . DolibarrFunctions::newToken() . '">' . img_edit() . '</a>';
                    print '<a class="marginleftonly marginrightonly" href="' . $_SERVER['PHP_SELF'] . '?rowid=' . $defaultvalue->id . '&entity=' . $defaultvalue->entity . '&mode=' . $mode . '&action=delete&token=' . DolibarrFunctions::newToken() . '">' . img_delete() . '</a>';
                } else {
                    print '<input type="hidden" name="page" value="' . $page . '">';
                    print '<input type="hidden" name="rowid" value="' . $id . '">';
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
        $db->close();

        return parent::printPage();
    }
}
