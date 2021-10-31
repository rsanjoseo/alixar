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
 * Copyright (C) 2001-2004 Rodolphe Quiedeville <rodolphe@quiedeville.org>
 * Copyright (C) 2004-2012 Laurent Destailleur  <eldy@users.sourceforge.net>
 * Copyright (C) 2015      Jean-François Ferry    <jfefe@aternatik.fr>
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
use Alxarafe\Dolibarr\Classes\FormAdmin;
use Alxarafe\Dolibarr\Libraries\DolibarrAdmin;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;

class TranslationView extends DolibarrView
{
    public $object;

    public function __construct(BasicController $controller)
    {
        parent::__construct($controller);
        $this->object = $controller->object;
    }

    function printPage(): string
    {
        $url = $_SERVER['PHP_SELF'] .
            '?' . self::MODULE_GET_VAR . '=' . $_GET[self::MODULE_GET_VAR] .
            '&' . self::CONTROLLER_GET_VAR . '=' . $_GET[self::CONTROLLER_GET_VAR];

        $form = new Form($db);
        $formadmin = new FormAdmin($db);

        $wikihelp = 'EN:Setup_Translation|FR:Paramétrage_Traduction|ES:Configuración_Traducción';
        $this->llxHeader('', $this->langs->trans("Setup"), $wikihelp);

        $param = '&mode=' . urlencode($mode);

        $enabledisablehtml = '';
        $enabledisablehtml .= $this->langs->trans("EnableOverwriteTranslation") . ' ';
        if (empty($conf->global->MAIN_ENABLE_OVERWRITE_TRANSLATION)) {
            // Button off, click to enable
            $enabledisablehtml .= '<a class="reposition valignmiddle" href="' . $url . '&action=setMAIN_ENABLE_OVERWRITE_TRANSLATION&token=' . DolibarrFunctions::newToken() . '&value=1' . $param . '">';
            $enabledisablehtml .= DolibarrFunctions::img_picto($this->langs->trans("Disabled"), 'switch_off');
            $enabledisablehtml .= '</a>';
        } else {
            // Button on, click to disable
            $enabledisablehtml .= '<a class="reposition valignmiddle" href="' . $url . '&action=setMAIN_ENABLE_OVERWRITE_TRANSLATION&token=' . DolibarrFunctions::newToken() . '&value=0' . $param . '">';
            $enabledisablehtml .= DolibarrFunctions::img_picto($this->langs->trans("Activated"), 'switch_on');
            $enabledisablehtml .= '</a>';
        }

        print DolibarrFunctions::load_fiche_titre($this->langs->trans("Translation"), $enabledisablehtml, 'title_setup');

        $current_language_code = $this->langs->defaultlang;
        $s = DolibarrFunctions::picto_from_langcode($current_language_code);
        print $form->textwithpicto('<span class="opacitymedium">' . $this->langs->trans("CurrentUserLanguage") . ':</span> <strong>' . $s . ' ' . $current_language_code . '</strong>', $this->langs->trans("TranslationDesc")) . '</span><br>';

        print '<br>';

        if (!empty($contextpage) && $contextpage != $_SERVER["PHP_SELF"]) {
            $param .= '&contextpage=' . urlencode($contextpage);
        }
        if ($this->controller->limit > 0 && $this->controller->limit != $conf->liste_limit) {
            $param .= '&limit=' . urlencode($this->controller->limit);
        }
        if (isset($optioncss) && $optioncss != '') {
            $param .= '&optioncss=' . urlencode($optioncss);
        }
        if ($langcode) {
            $param .= '&langcode=' . urlencode($langcode);
        }
        if ($transkey) {
            $param .= '&transkey=' . urlencode($transkey);
        }
        if ($transvalue) {
            $param .= '&transvalue=' . urlencode($transvalue);
        }

        print '<form action="' . $url . ((empty($user->entity) && !empty($debug)) ? '?debug=1' : '') . '" method="POST">';
        if (isset($optioncss) && $optioncss != '') {
            print '<input type="hidden" name="optioncss" value="' . $optioncss . '">';
        }
        print '<input type="hidden" name="token" value="' . DolibarrFunctions::newToken() . '">';
        print '<input type="hidden" name="formfilteraction" id="formfilteraction" value="list">';
        print '<input type="hidden" name="sortfield" value="' . $this->controller->sortfield . '">';
        print '<input type="hidden" name="sortorder" value="' . $this->controller->sortorder . '">';

        $head = DolibarrAdmin::translation_prepare_head();

        print DolibarrFunctions::dol_get_fiche_head($head, $mode, '', -1, '');

        if ($mode == 'overwrite') {
            print '<input type="hidden" name="page" value="' . $page . '">';

            $disabled = '';
            if ($action == 'edit' || empty($conf->global->MAIN_ENABLE_OVERWRITE_TRANSLATION)) {
                $disabled = ' disabled="disabled"';
            }
            $disablededit = '';
            if ($action == 'edit' || empty($conf->global->MAIN_ENABLE_OVERWRITE_TRANSLATION)) {
                $disablededit = ' disabled';
            }

            print '<div class="justify"><span class="opacitymedium">';
            print img_info() . ' ' . $this->langs->trans("SomeTranslationAreUncomplete");
            $urlwikitranslatordoc = 'https://wiki.dolibarr.org/index.php/Translator_documentation';
            print ' (' . str_replace('{s1}', '<a href="' . $urlwikitranslatordoc . '" target="_blank">' . $this->langs->trans("Here") . '</a>', $this->langs->trans("SeeAlso", '{s1}')) . ')<br>';
            print $this->langs->trans("TranslationOverwriteDesc", $this->langs->transnoentitiesnoconv("Language"), $this->langs->transnoentitiesnoconv("Key"), $this->langs->transnoentitiesnoconv("NewTranslationStringToShow")) . "\n";
            print ' (' . $this->langs->trans("TranslationOverwriteDesc2") . ').' . "<br>\n";
            print '</span></div>';

            print '<br>';

            print '<input type="hidden" name="action" value="' . ($action == 'edit' ? 'update' : 'add') . '">';
            print '<input type="hidden" id="mode" name="mode" value="' . $mode . '">';

            print '<div class="div-table-responsive-no-min">';
            print '<table class="noborder centpercent">';
            print '<tr class="liste_titre">';
            print_liste_field_titre("Language_en_US_es_MX_etc", $_SERVER["PHP_SELF"], 'lang,transkey', '', $param, '', $this->controller->sortfield, $this->controller->sortorder);
            print_liste_field_titre("Key", $_SERVER["PHP_SELF"], 'transkey', '', $param, '', $this->controller->sortfield, $this->controller->sortorder);
            print_liste_field_titre("NewTranslationStringToShow", $_SERVER["PHP_SELF"], 'transvalue', '', $param, '', $this->controller->sortfield, $this->controller->sortorder);
            //if (! empty($conf->multicompany->enabled) && !$user->entity) print_liste_field_titre("Entity", $_SERVER["PHP_SELF"], 'entity,transkey', '', $param, '', $this->controller->sortfield, $this->controller->sortorder);
            print '<td align="center"></td>';
            print "</tr>\n";

            // Line to add new record
            print "\n";

            print '<tr class="oddeven"><td>';
            print $formadmin->select_language(GETPOST('langcode'), 'langcode', 0, null, 1, 0, $disablededit ? 1 : 0, 'maxwidth250', 1);
            print '</td>' . "\n";
            print '<td>';
            print '<input type="text" class="flat maxwidthonsmartphone"' . $disablededit . ' name="transkey" id="transkey" value="' . (!empty($transkey) ? $transkey : "") . '">';
            print '</td><td>';
            print '<input type="text" class="quatrevingtpercent"' . $disablededit . ' name="transvalue" id="transvalue" value="' . (!empty($transvalue) ? $transvalue : "") . '">';
            print '</td>';
            print '<td class="center">';
            print '<input type="hidden" name="entity" value="' . $conf->entity . '">';
            print '<input type="submit" class="button"' . $disabled . ' value="' . $this->langs->trans("Add") . '" name="add" title="' . dol_escape_htmltag($this->langs->trans("YouMustEnabledTranslationOverwriteBefore")) . '">';
            print "</td>\n";
            print '</tr>';

            // Show constants
            $sql = "SELECT rowid, entity, lang, transkey, transvalue";
            $sql .= " FROM " . MAIN_DB_PREFIX . "overwrite_trans";
            $sql .= " WHERE 1 = 1";
            $sql .= " AND entity IN (" . getEntity('overwrite_trans') . ")";
            $sql .= $db->order($this->controller->sortfield, $this->controller->sortorder);

            dol_syslog("translation::select from table", LOG_DEBUG);

            $result = $db->query($sql);
            if ($result) {
                $num = $db->num_rows($result);
                $i = 0;

                while ($i < $num) {
                    $obj = $db->fetch_object($result);

                    print "\n";

                    print '<tr class="oddeven">';

                    print '<td>' . $obj->lang . '</td>' . "\n";
                    print '<td>';
                    if ($action == 'edit' && $obj->rowid == GETPOST('rowid', 'int')) {
                        print '<input type="text" class="quatrevingtpercent" name="transkey" value="' . dol_escape_htmltag($obj->transkey) . '">';
                    } else {
                        print $obj->transkey;
                    }
                    print '</td>' . "\n";

                    // Value
                    print '<td class="small">';
                    /*print '<input type="hidden" name="const['.$i.'][rowid]" value="'.$obj->rowid.'">';
                    print '<input type="hidden" name="const['.$i.'][lang]" value="'.$obj->lang.'">';
                    print '<input type="hidden" name="const['.$i.'][name]" value="'.$obj->transkey.'">';
                    print '<input type="text" id="value_'.$i.'" class="flat inputforupdate" size="30" name="const['.$i.'][value]" value="'.dol_escape_htmltag($obj->transvalue).'">';
                    */
                    if ($action == 'edit' && $obj->rowid == GETPOST('rowid', 'int')) {
                        print '<input type="text" class="quatrevingtpercent" name="transvalue" value="' . dol_escape_htmltag($obj->transvalue) . '">';
                    } else {
                        print dol_escape_htmltag($obj->transvalue);
                    }
                    print '</td>';

                    print '<td class="center">';
                    if ($action == 'edit' && $obj->rowid == GETPOST('rowid', 'int')) {
                        print '<input type="hidden" class="button" name="rowid" value="' . $obj->rowid . '">';
                        print '<input type="submit" class="button buttongen button-save" name="save" value="' . dol_escape_htmltag($this->langs->trans("Save")) . '">';
                        print ' &nbsp; ';
                        print '<input type="submit" class="button buttongen button-cancel" name="cancel" value="' . dol_escape_htmltag($this->langs->trans("Cancel")) . '">';
                    } else {
                        print '<a class="reposition editfielda paddingrightonly" href="' . $_SERVER['PHP_SELF'] . '?rowid=' . $obj->rowid . '&entity=' . $obj->entity . '&mode=' . urlencode($mode) . '&action=edit&token=' . DolibarrFunctions::newToken() . '' . ((empty($user->entity) && $debug) ? '&debug=1' : '') . '">' . img_edit() . '</a>';
                        print ' &nbsp; ';
                        print '<a class="reposition" href="' . $_SERVER['PHP_SELF'] . '?rowid=' . $obj->rowid . '&entity=' . $obj->entity . '&mode=' . urlencode($mode) . '&action=delete&token=' . DolibarrFunctions::newToken() . ((empty($user->entity) && $debug) ? '&debug=1' : '') . '">' . img_delete() . '</a>';
                    }
                    print '</td>';

                    print "</tr>\n";
                    print "\n";
                    $i++;
                }
            }

            print '</table>';
            print '</div>';
        }

        if ($mode == 'searchkey') {
            $langcode = GETPOSTISSET('langcode') ? GETPOST('langcode') : $this->langs->defaultlang;

            $newlang = new Translate('', $conf);
            $newlang->setDefaultLang($langcode);

            $newlangfileonly = new Translate('', $conf);
            $newlangfileonly->setDefaultLang($langcode);

            $recordtoshow = [];

            // Search modules dirs
            $modulesdir = dolGetModulesDirs();

            $nbtotaloffiles = 0;
            $nbempty = 0;
            /*var_dump($langcode);
             var_dump($transkey);
             var_dump($transvalue);*/
            if (empty($langcode) || $langcode == '-1') {
                $nbempty++;
            }
            if (empty($transkey)) {
                $nbempty++;
            }
            if (empty($transvalue)) {
                $nbempty++;
            }
            if ($action == 'search' && ($nbempty > 999)) {    // 999 to disable this
                setEventMessages($this->langs->trans("WarningAtLeastKeyOrTranslationRequired"), null, 'warnings');
            } else {
                // Search into dir of modules (the $modulesdir is already a list that loop on $conf->file->dol_document_root)
                $i = 0;
                foreach ($modulesdir as $keydir => $tmpsearchdir) {
                    $searchdir = $tmpsearchdir; // $searchdir can be '.../htdocs/core/modules/' or '.../htdocs/custom/mymodule/core/modules/'

                    // Directory of translation files
                    $dir_lang = dirname(dirname($searchdir)) . "/langs/" . $langcode; // The 2 dirname is to go up in dir for 2 levels
                    $dir_lang_osencoded = dol_osencode($dir_lang);

                    $filearray = dol_dir_list($dir_lang_osencoded, 'files', 0, '', '', $this->controller->sortfield, (strtolower($this->controller->sortorder) == 'asc' ? SORT_ASC : SORT_DESC), 1);
                    foreach ($filearray as $file) {
                        $tmpfile = preg_replace('/.lang/i', '', basename($file['name']));
                        $moduledirname = (basename(dirname(dirname($dir_lang))));

                        $langkey = $tmpfile;
                        if ($i > 0) {
                            $langkey .= '@' . $moduledirname;
                        }
                        //var_dump($i.' - '.$keydir.' - '.$dir_lang_osencoded.' -> '.$moduledirname . ' / ' . $tmpfile.' -> '.$langkey);

                        $result = $newlang->load($langkey, 0, 0, '', 0); // Load translation files + database overwrite
                        $result = $newlangfileonly->load($langkey, 0, 0, '', 1); // Load translation files only
                        if ($result < 0) {
                            print 'Failed to load language file ' . $tmpfile . '<br>' . "\n";
                        } else {
                            $nbtotaloffiles++;
                        }
                        //print 'After loading lang '.$langkey.', newlang has '.count($newlang->tab_translate).' records<br>'."\n";
                    }
                    $i++;
                }

                // Now search into translation array
                foreach ($newlang->tab_translate as $key => $val) {
                    if ($transkey && !preg_match('/' . preg_quote($transkey, '/') . '/i', $key)) {
                        continue;
                    }
                    if ($transvalue && !preg_match('/' . preg_quote($transvalue, '/') . '/i', $val)) {
                        continue;
                    }
                    $recordtoshow[$key] = $val;
                }
            }

            //print '<br>';
            $nbtotalofrecordswithoutfilters = count($newlang->tab_translate);
            $nbtotalofrecords = count($recordtoshow);
            $num = $this->controller->limit + 1;
            if (($offset + $num) > $nbtotalofrecords) {
                $num = $this->controller->limit;
            }

            //print 'param='.$param.' $_SERVER["PHP_SELF"]='.$_SERVER["PHP_SELF"].' num='.$num.' page='.$page.' nbtotalofrecords='.$nbtotalofrecords." sortfield=".$this->controller->sortfield." sortorder=".$this->controller->sortorder;
            $title = $this->langs->trans("TranslationKeySearch");
            if ($nbtotalofrecords > 0) {
                $title .= ' <span class="opacitymedium colorblack paddingleft">(' . $nbtotalofrecords . ' / ' . $nbtotalofrecordswithoutfilters . ' - ' . $nbtotaloffiles . ' ' . $this->langs->trans("Files") . ')</span>';
            }
            print_barre_liste($title, $page, $_SERVER["PHP_SELF"], $param, $this->controller->sortfield, $this->controller->sortorder, '', $num, -1 * $nbtotalofrecords, '', 0, '', '', $this->controller->limit, 0, 0, 1);

            $massactionbutton = '';

            print '<input type="hidden" id="action" name="action" value="search">';
            print '<input type="hidden" id="mode" name="mode" value="' . $mode . '">';

            print '<div class="div-table-responsive-no-min">';
            print '<table class="noborder centpercent">';

            print '<tr class="liste_titre_filter"><td>';
            //print $formadmin->select_language($langcode,'langcode',0,null,$this->langs->trans("All"),0,0,'',1);
            print $formadmin->select_language($langcode, 'langcode', 0, null, 0, 0, 0, 'maxwidth250', 1);
            print '</td>' . "\n";
            print '<td>';
            print '<input type="text" class="flat maxwidthonsmartphone" name="transkey" value="' . $transkey . '">';
            print '</td><td>';
            print '<input type="text" class="quatrevingtpercent" name="transvalue" value="' . $transvalue . '">';
            // Limit to superadmin
            /*if (! empty($conf->multicompany->enabled) && !$user->entity)
            {
                print '</td><td>';
                print '<input type="text" class="flat" size="1" name="entitysearch" value="'.$conf->entity.'">';
            }
            else
            {*/
            print '<input type="hidden" name="entitysearch" value="' . $conf->entity . '">';
            //}
            print '</td>';
            // Action column
            print '<td class="right nowraponall">';
            $searchpicto = $form->showFilterAndCheckAddButtons(!empty($massactionbutton) ? 1 : 0, 'checkforselect', 1);
            print $searchpicto;
            print '</td>';
            print '</tr>';

            print '<tr class="liste_titre">';
            print_liste_field_titre("Language_en_US_es_MX_etc", $_SERVER["PHP_SELF"], 'lang,transkey', '', $param, '', $this->controller->sortfield, $this->controller->sortorder);
            print_liste_field_titre("Key", $_SERVER["PHP_SELF"], 'transkey', '', $param, '', $this->controller->sortfield, $this->controller->sortorder);
            print_liste_field_titre("CurrentTranslationString", $_SERVER["PHP_SELF"], 'transvalue', '', $param, '', $this->controller->sortfield, $this->controller->sortorder);
            //if (! empty($conf->multicompany->enabled) && !$user->entity) print_liste_field_titre("Entity", $_SERVER["PHP_SELF"], 'entity,transkey', '', $param, '', $this->controller->sortfield, $this->controller->sortorder);
            print '<td align="center"></td>';
            print "</tr>\n";

            if ($this->controller->sortfield == 'transkey' && strtolower($this->controller->sortorder) == 'asc') {
                ksort($recordtoshow);
            }
            if ($this->controller->sortfield == 'transkey' && strtolower($this->controller->sortorder) == 'desc') {
                krsort($recordtoshow);
            }
            if ($this->controller->sortfield == 'transvalue' && strtolower($this->controller->sortorder) == 'asc') {
                asort($recordtoshow);
            }
            if ($this->controller->sortfield == 'transvalue' && strtolower($this->controller->sortorder) == 'desc') {
                arsort($recordtoshow);
            }

            // Show result
            $i = 0;
            foreach ($recordtoshow as $key => $val) {
                $i++;
                if ($i <= $offset) {
                    continue;
                }
                if ($i > ($offset + $this->controller->limit)) {
                    break;
                }
                print '<tr class="oddeven"><td>' . $langcode . '</td><td>' . $key . '</td><td class="small">';
                print dol_escape_htmltag($val);
                print '</td><td class="right nowraponall">';
                if (!empty($newlangfileonly->tab_translate[$key])) {
                    if ($val != $newlangfileonly->tab_translate[$key]) {
                        // retrieve rowid
                        $sql = "SELECT rowid";
                        $sql .= " FROM " . MAIN_DB_PREFIX . "overwrite_trans";
                        $sql .= " WHERE entity IN (" . getEntity('overwrite_trans') . ")";
                        $sql .= " AND transkey = '" . $db->escape($key) . "'";
                        dol_syslog("translation::select from table", LOG_DEBUG);
                        $result = $db->query($sql);
                        if ($result) {
                            $obj = $db->fetch_object($result);
                        }
                        print '<a class="editfielda reposition marginrightonly" href="' . $_SERVER['PHP_SELF'] . '?rowid=' . $obj->rowid . '&entity=' . $conf->entity . '&mode=overwrite&action=edit&token=' . DolibarrFunctions::newToken() . '">' . img_edit() . '</a>';
                        print ' ';
                        print '<a class="marginleftonly marginrightonly" href="' . $_SERVER['PHP_SELF'] . '?rowid=' . $obj->rowid . '&entity=' . $conf->entity . '&mode=' . urlencode($mode) . '&action=delete&token=' . DolibarrFunctions::newToken() . '&mode=' . urlencode($mode) . '">' . img_delete() . '</a>';
                        print '&nbsp;&nbsp;';
                        $htmltext = $this->langs->trans("OriginalValueWas", '<i>' . $newlangfileonly->tab_translate[$key] . '</i>');
                        print $form->textwithpicto('', $htmltext, 1, 'info');
                    } elseif (!empty($conf->global->MAIN_ENABLE_OVERWRITE_TRANSLATION)) {
                        //print $key.'-'.$val;
                        print '<a class="reposition paddingrightonly" href="' . $_SERVER['PHP_SELF'] . '?mode=overwrite&langcode=' . urlencode($langcode) . '&transkey=' . urlencode($key) . '">' . img_edit_add($this->langs->trans("TranslationOverwriteKey")) . '</a>';
                    }

                    if (!empty($conf->global->MAIN_FEATURES_LEVEL)) {
                        $transifexlangfile = '$'; // $ means 'All'
                        //$transifexurl = 'https://www.transifex.com/dolibarr-association/dolibarr/translate/#'.$langcode.'/'.$transifexlangfile.'?key='.$key;
                        $transifexurl = 'https://www.transifex.com/dolibarr-association/dolibarr/translate/#' . $langcode . '/' . $transifexlangfile . '?q=key%3A' . $key;

                        print ' &nbsp; <a href="' . $transifexurl . '" target="transifex">' . img_picto($this->langs->trans('FixOnTransifex'), 'globe') . '</a>';
                    }
                } else {
                    // retrieve rowid
                    $sql = "SELECT rowid";
                    $sql .= " FROM " . MAIN_DB_PREFIX . "overwrite_trans";
                    $sql .= " WHERE entity IN (" . getEntity('overwrite_trans') . ")";
                    $sql .= " AND transkey = '" . $db->escape($key) . "'";
                    dol_syslog("translation::select from table", LOG_DEBUG);
                    $result = $db->query($sql);
                    if ($result) {
                        $obj = $db->fetch_object($result);
                    }
                    print '<a class="editfielda reposition marginrightonly" href="' . $_SERVER['PHP_SELF'] . '?rowid=' . $obj->rowid . '&entity=' . $conf->entity . '&mode=overwrite&action=edit&token=' . DolibarrFunctions::newToken() . '">' . img_edit() . '</a>';
                    print ' ';
                    print '<a class="marginleftonly marginrightonly" href="' . $_SERVER['PHP_SELF'] . '?rowid=' . $obj->rowid . '&entity=' . $conf->entity . '&mode=' . urlencode($mode) . '&action=delete&token=' . DolibarrFunctions::newToken() . '&mode=' . urlencode($mode) . '">' . img_delete() . '</a>';
                    print '&nbsp;&nbsp;';

                    $htmltext = $this->langs->trans("TransKeyWithoutOriginalValue", $key);
                    print $form->textwithpicto('', $htmltext, 1, 'warning');
                }
                /*if (! empty($conf->multicompany->enabled) && !$user->entity)
                {
                    print '<td>'.$val.'</td>';
                }*/
                print '</td></tr>' . "\n";
            }

            print '</table>';
            print '</div>';
        }

        print DolibarrFunctions::dol_get_fiche_end();

        print "</form>\n";

        if (!empty($langcode)) {
            dol_set_focus('#transvalue');
        }

        // End of page
        $this->llxFooter();
        // $db->close();

        return parent::printPage();
    }
}
