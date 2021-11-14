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
 * Copyright (C) 2003-2007    Rodolphe Quiedeville    <rodolphe@quiedeville.org>
 * Copyright (C) 2003        Jean-Louis Bergamo        <jlb@j1b.org>
 * Copyright (C) 2004-2017    Laurent Destailleur        <eldy@users.sourceforge.net>
 * Copyright (C) 2004        Eric Seigne                <eric.seigne@ryxeo.com>
 * Copyright (C) 2005-2017    Regis Houssin            <regis.houssin@inodbox.com>
 * Copyright (C) 2011        Juanjo Menent            <jmenent@2byte.es>
 * Copyright (C) 2015        Jean-François Ferry        <jfefe@aternatik.fr>
 * Copyright (C) 2015        Raphaël Doursenaud        <rdoursenaud@gpcsolutions.fr>
 * Copyright (C) 2018        Nicolas ZABOURI        <info@inovea-conseil.com>
 * Copyright (C) 2021       Frédéric France         <frederic.france@netlogic.fr>
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
use Alxarafe\Dolibarr\Libraries\DolibarrAdmin;
use Alxarafe\Dolibarr\Libraries\DolibarrFiles;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions2;
use stdClass;

/**
 * Class Modules
 *
 * @package Alxarafe\Views
 */
class ModulesView extends DolibarrView
{
    public $object;
    public $dirins;
    public $mode;

    public function __construct(BasicController $controller)
    {
        parent::__construct($controller);
        $this->object = $controller->object;
        $this->dirins = $controller->dirins;
        $this->mode = $controller->mode;
    }

    function printPage(): string
    {
        /*
         * View
         */

        $form = new Form();

        $morejs = [];
        $morecss = ["/admin/dolistore/css/dolistore.css"];

        // Set dir where external modules are installed
        if (!DolibarrFiles::dol_is_dir($this->dirins)) {
            DolibarrFunctions::dol_mkdir($this->dirins);
        }
        $this->dirins_ok = (DolibarrFiles::dol_is_dir($this->dirins));

        $help_url = 'EN:First_setup|FR:Premiers_paramétrages|ES:Primeras_configuraciones';
        $this->llxHeader('', $this->langs->trans("Setup"), $help_url, '', '', '', $morejs, $morecss, 0, 0);

        // Search modules dirs
        $modulesdir = DolibarrFunctions2::dolGetModulesDirs();

        $arrayofnatures = ['core' => $this->langs->transnoentitiesnoconv("Core"), 'external' => $this->langs->transnoentitiesnoconv("External") . ' - [' . $this->langs->trans("AllPublishers") . ']'];
        $arrayofwarnings = []; // Array of warning each module want to show when activated
        $arrayofwarningsext = []; // Array of warning each module want to show when we activate an external module
        $filename = [];
        $modules = [];
        $orders = [];
        $categ = [];

        $i = 0; // is a sequencer of modules found
        $j = 0; // j is module number. Automatically affected if module number not defined.
        $modNameLoaded = [];
        foreach ($modulesdir as $dir) {
            // Load modules attributes in arrays (name, numero, orders) from dir directory
            //print $dir."\n<br>";
            DolibarrFunctions::dol_syslog("Scan directory " . $dir . " for module descriptor files (modXXX.class.php)");
            $handle = @opendir($dir);
            if (is_resource($handle)) {
                while (($file = readdir($handle)) !== false) {
                    //print "$i ".$file."\n<br>";
                    if (is_readable($dir . $file) && substr($file, 0, 3) == 'mod' && substr($file, DolibarrFunctions::dol_strlen($file) - 10) == '.class.php') {
                        $modName = substr($file, 0, DolibarrFunctions::dol_strlen($file) - 10);

                        if ($modName) {
                            if (!empty($modNameLoaded[$modName])) {   // In cache of already loaded modules ?
                                $mesg = "Error: Module " . $modName . " was found twice: Into " . $modNameLoaded[$modName] . " and " . $dir . ". You probably have an old file on your disk.<br>";
                                DolibarrFunctions::setEventMessages($mesg, null, 'warnings');
                                DolibarrFunctions::dol_syslog($mesg, LOG_ERR);
                                continue;
                            }

                            try {
                                // TODO
                                $res = include_once $dir . $file; // A class already exists in a different file will send a non catchable fatal error.
                                if (class_exists($modName)) {
                                    try {
                                        $objMod = new $modName();
                                        $modNameLoaded[$modName] = $dir;
                                        if (!$objMod->numero > 0 && $modName != 'modUser') {
                                            DolibarrFunctions::dol_syslog('The module descriptor ' . $modName . ' must have a numero property', LOG_ERR);
                                        }
                                        $j = $objMod->numero;

                                        $modulequalified = 1;

                                        // We discard modules according to features level (PS: if module is activated we always show it)
                                        $const_name = 'MAIN_MODULE_' . strtoupper(preg_replace('/^mod/i', '', get_class($objMod)));
                                        if ($objMod->version == 'development' && (empty($this->conf->global->$const_name) && ($this->conf->global->MAIN_FEATURES_LEVEL < 2))) {
                                            $modulequalified = 0;
                                        }
                                        if ($objMod->version == 'experimental' && (empty($this->conf->global->$const_name) && ($this->conf->global->MAIN_FEATURES_LEVEL < 1))) {
                                            $modulequalified = 0;
                                        }
                                        if (preg_match('/deprecated/', $objMod->version) && (empty($this->conf->global->$const_name) && ($this->conf->global->MAIN_FEATURES_LEVEL >= 0))) {
                                            $modulequalified = 0;
                                        }

                                        // We discard modules according to property ->hidden
                                        if (!empty($objMod->hidden)) {
                                            $modulequalified = 0;
                                        }

                                        if ($modulequalified > 0) {
                                            $publisher = DolibarrFunctions::dol_escape_htmltag($objMod->getPublisher());
                                            $external = ($objMod->isCoreOrExternalModule() == 'external');
                                            if ($external) {
                                                if ($publisher) {
                                                    $arrayofnatures['external_' . $publisher] = $this->langs->trans("External") . ' - ' . $publisher;
                                                } else {
                                                    $arrayofnatures['external_'] = $this->langs->trans("External") . ' - ' . $this->langs->trans("UnknownPublishers");
                                                }
                                            }
                                            ksort($arrayofnatures);

                                            // Define array $categ with categ with at least one qualified module
                                            $filename[$i] = $modName;
                                            $modules[$modName] = $objMod;

                                            // Gives the possibility to the module, to provide his own family info and position of this family
                                            if (is_array($objMod->familyinfo) && !empty($objMod->familyinfo)) {
                                                $this->familyinfo = array_merge($this->familyinfo, $objMod->familyinfo);
                                                $familykey = key($objMod->familyinfo);
                                            } else {
                                                $familykey = $objMod->family;
                                            }

                                            $moduleposition = ($objMod->module_position ? $objMod->module_position : '50');
                                            if ($objMod->isCoreOrExternalModule() == 'external' && $moduleposition < 100000) {
                                                // an external module should never return a value lower than '80'.
                                                $moduleposition = '80'; // External modules at end by default
                                            }

                                            // Add list of warnings to show into arrayofwarnings and arrayofwarningsext
                                            if (!empty($objMod->warnings_activation)) {
                                                $arrayofwarnings[$modName] = $objMod->warnings_activation;
                                            }
                                            if (!empty($objMod->warnings_activation_ext)) {
                                                $arrayofwarningsext[$modName] = $objMod->warnings_activation_ext;
                                            }

                                            $familyposition = (empty($this->familyinfo[$familykey]['position']) ? 0 : $this->familyinfo[$familykey]['position']);
                                            $listOfOfficialModuleGroups = ['hr', 'technic', 'interface', 'technic', 'portal', 'financial', 'crm', 'base', 'products', 'srm', 'ecm', 'projects', 'other'];
                                            if ($external && !in_array($familykey, $listOfOfficialModuleGroups)) {
                                                // If module is extern and into a custom group (not into an official predefined one), it must appear at end (custom groups should not be before official groups).
                                                if (is_numeric($familyposition)) {
                                                    $familyposition = sprintf("%03d", (int) $familyposition + 100);
                                                }
                                            }

                                            $orders[$i] = $familyposition . "_" . $familykey . "_" . $moduleposition . "_" . $j; // Sort by family, then by module position then number

                                            // Set categ[$i]
                                            $specialstring = 'unknown';
                                            if ($objMod->version == 'development' || $objMod->version == 'experimental') {
                                                $specialstring = 'expdev';
                                            }
                                            if (isset($categ[$specialstring])) {
                                                $categ[$specialstring]++; // Array of all different modules categories
                                            } else {
                                                $categ[$specialstring] = 1;
                                            }
                                            $j++;
                                            $i++;
                                        } else {
                                            DolibarrFunctions::dol_syslog("Module " . get_class($objMod) . " not qualified");
                                        }
                                    } catch (Exception $e) {
                                        DolibarrFunctions::dol_syslog("Failed to load " . $dir . $file . " " . $e->getMessage(), LOG_ERR);
                                    }
                                } else {
                                    print "Warning bad descriptor file : " . $dir . $file . " (Class " . $modName . " not found into file)<br>";
                                }
                            } catch (Exception $e) {
                                DolibarrFunctions::dol_syslog("Failed to load " . $dir . $file . " " . $e->getMessage(), LOG_ERR);
                            }
                        }
                    }
                }
                closedir($handle);
            } else {
                DolibarrFunctions::dol_syslog("htdocs/admin/modules.php: Failed to open directory " . $dir . ". See permission and open_basedir option.", LOG_WARNING);
            }
        }

        $formconfirm = '';
        if ($this->action == 'reset_confirm' && $this->user->admin) {
            if (!empty($modules[$this->value])) {
                $objMod = $modules[$this->value];

                if (!empty($objMod->langfiles)) {
                    $this->langs->loadLangs($objMod->langfiles);
                }

                $form = new Form();
                $formconfirm = $form->formconfirm($_SERVER["PHP_SELF"] . '?value=' . $this->value . '&mode=' . $this->mode . $this->param, $this->langs->trans('ConfirmUnactivation'), $this->langs->trans(DolibarrFunctions::GETPOST('confirm_message_code')), 'reset', '', 'no', 1);
            }
        }

        print $formconfirm;

        asort($orders);
        //var_dump($orders);
        //var_dump($categ);
        //var_dump($modules);

        $nbofactivatedmodules = count($this->conf->modules);

        //$this->conf->global->MAIN_MIN_NB_ENABLED_MODULE_FOR_WARNING = 1000;
        /*$moreinfo = $this->langs->trans("TitleNumberOfActivatedModules");
        $moreinfo2 = '<b class="largenumber">'.($nbofactivatedmodules - 1).'</b> / <b class="largenumber">'.count($modules).'</b>';
        if ($nbofactivatedmodules <= (empty($this->conf->global->MAIN_MIN_NB_ENABLED_MODULE_FOR_WARNING) ? 1 : $this->conf->global->MAIN_MIN_NB_ENABLED_MODULE_FOR_WARNING)) {
            $moreinfo2 .= ' '.DolibarrFunctions::ig($this->langs->trans("YouMustEnableOneModule"));
        }*/

        print DolibarrFunctions::load_fiche_titre($this->langs->trans("ModulesSetup"), '', 'title_setup');

        // Start to show page
        $deschelp = '';
        if ($this->mode == 'common' || $this->mode == 'commonkanban') {
            $desc = $this->langs->trans("ModulesDesc", '{picto}');
            $desc .= ' ' . $this->langs->trans("ModulesDesc2", '{picto2}');
            $desc = str_replace('{picto}', DolibarrFunctions::img_picto('', 'switch_off'), $desc);
            $desc = str_replace('{picto2}', DolibarrFunctions::img_picto('', 'setup'), $desc);
            if (count($this->conf->modules) <= (empty($this->conf->global->MAIN_MIN_NB_ENABLED_MODULE_FOR_WARNING) ? 1 : $this->conf->global->MAIN_MIN_NB_ENABLED_MODULE_FOR_WARNING)) {    // If only minimal initial modules enabled
                $deschelp = '<div class="info hideonsmartphone">' . $desc . "<br></div><br>\n";
            }
        }
        if ($this->mode == 'marketplace') {
            //$deschelp = '<div class="info hideonsmartphone">'.$this->langs->trans("ModulesMarketPlaceDesc")."<br></div><br>\n";
        }
        if ($this->mode == 'deploy') {
            $deschelp = '<div class="info hideonsmartphone">' . $this->langs->trans("ModulesDeployDesc", $this->langs->transnoentitiesnoconv("AvailableModules")) . "<br></div><br>\n";
        }
        if ($this->mode == 'develop') {
            $deschelp = '<div class="info hideonsmartphone">' . $this->langs->trans("ModulesDevelopDesc") . "<br></div><br>\n";
        }

        $head = DolibarrAdmin::modules_prepare_head($nbofactivatedmodules, count($modules));

        if ($this->mode == 'common' || $this->mode == 'commonkanban') {
            DolibarrFunctions::dol_set_focus('#search_keyword');

            $url = $_SERVER['PHP_SELF'] .
                '?' . self::MODULE_GET_VAR . '=' . $_GET[self::MODULE_GET_VAR] .
                '&' . self::CONTROLLER_GET_VAR . '=' . $_GET[self::CONTROLLER_GET_VAR];

            print '<form method="POST" id="searchFormList" action="' . $url . '">';
            print '<input type="hidden" name="token" value="' . DolibarrFunctions::newToken() . '">';
            if (isset($optioncss) && $optioncss != '') {
                print '<input type="hidden" name="optioncss" value="' . $optioncss . '">';
            }
            if (isset($sortfield) && $sortfield != '') {
                print '<input type="hidden" name="sortfield" value="' . $sortfield . '">';
            }
            if (isset($sortorder) && $sortorder != '') {
                print '<input type="hidden" name="sortorder" value="' . $sortorder . '">';
            }
            if (isset($page) && $page != '') {
                print '<input type="hidden" name="page" value="' . $page . '">';
            }
            print '<input type="hidden" name="mode" value="' . $this->mode . '">';

            print DolibarrFunctions::dol_get_fiche_head($head, 'modules', '', -1);

            print $deschelp;

            $moreforfilter = '<div class="valignmiddle">';

            $moreforfilter .= '<div class="floatright right pagination --module-list"><ul><li>';
            $moreforfilter .= DolibarrFunctions::dolGetButtonTitle($this->langs->trans('CheckForModuleUpdate'), $this->langs->trans('CheckForModuleUpdate') . '<br>' . $this->langs->trans('CheckForModuleUpdateHelp'), 'fa fa-sync', $_SERVER["PHP_SELF"] . '?action=checklastversion&token=' . DolibarrFunctions::newToken() . '&mode=' . $this->mode . $this->param, '', 1, ['morecss' => 'reposition']);
            $moreforfilter .= DolibarrFunctions::dolGetButtonTitleSeparator();
            $moreforfilter .= DolibarrFunctions::dolGetButtonTitle($this->langs->trans('ViewKanban'), '', 'fa fa-th-list imgforviewmode', $_SERVER["PHP_SELF"] . '?mode=commonkanban' . $this->param, '', ($this->mode == 'commonkanban' ? 2 : 1), ['morecss' => 'reposition']);
            $moreforfilter .= DolibarrFunctions::dolGetButtonTitle($this->langs->trans('ViewList'), '', 'fa fa-list-alt imgforviewmode', $_SERVER["PHP_SELF"] . '?mode=common' . $this->param, '', ($this->mode == 'common' ? 2 : 1), ['morecss' => 'reposition']);
            $moreforfilter .= '</li></ul></div>';

            //$moreforfilter .= '<div class="floatright center marginrightonly hideonsmartphone" style="padding-top: 3px"><span class="paddingright">'.$moreinfo.'</span> '.$moreinfo2.'</div>';

            $moreforfilter .= '<div class="colorbacktimesheet float valignmiddle">';
            $moreforfilter .= '<div class="divsearchfield paddingtop">';
            $moreforfilter .= DolibarrFunctions::img_picto($this->langs->trans("Filter"), 'filter', 'class="paddingright opacityhigh hideonsmartphone"') . '<input type="text" id="search_keyword" name="search_keyword" class="maxwidth125" value="' . DolibarrFunctions::dol_escape_htmltag($this->search_keyword) . '" placeholder="' . DolibarrFunctions::dol_escape_htmltag($this->langs->trans('Keyword')) . '">';
            $moreforfilter .= '</div>';
            $moreforfilter .= '<div class="divsearchfield paddingtop">';
            $moreforfilter .= $form->selectarray('search_nature', $arrayofnatures, DolibarrFunctions::dol_escape_htmltag($this->search_nature), $this->langs->trans('Origin'), 0, 0, '', 0, 0, 0, '', 'maxwidth200', 1);
            $moreforfilter .= '</div>';
            if (!empty($this->conf->global->MAIN_FEATURES_LEVEL)) {
                $array_version = ['stable' => $this->langs->transnoentitiesnoconv("Stable")];
                if ($this->conf->global->MAIN_FEATURES_LEVEL < 0) {
                    $array_version['deprecated'] = $this->langs->trans("Deprecated");
                }
                if ($this->conf->global->MAIN_FEATURES_LEVEL > 0) {
                    $array_version['experimental'] = $this->langs->trans("Experimental");
                }
                if ($this->conf->global->MAIN_FEATURES_LEVEL > 1) {
                    $array_version['development'] = $this->langs->trans("Development");
                }
                $moreforfilter .= '<div class="divsearchfield paddingtop">';
                $moreforfilter .= $form->selectarray('search_version', $array_version, $this->search_version, $this->langs->trans('Version'), 0, 0, '', 0, 0, 0, '', 'maxwidth150', 1);
                $moreforfilter .= '</div>';
            }
            $moreforfilter .= '<div class="divsearchfield paddingtop">';
            $moreforfilter .= $form->selectarray('search_status', ['active' => $this->langs->transnoentitiesnoconv("Enabled"), 'disabled' => $this->langs->transnoentitiesnoconv("Disabled")], $this->search_status, $this->langs->trans('Status'), 0, 0, '', 0, 0, 0, '', 'maxwidth150', 1);
            $moreforfilter .= '</div>';
            $moreforfilter .= ' ';
            $moreforfilter .= '<div class="divsearchfield">';
            $moreforfilter .= '<input type="submit" name="buttonsubmit" class="button" value="' . DolibarrFunctions::dol_escape_htmltag($this->langs->trans("Refresh")) . '">';
            $moreforfilter .= ' ';
            $moreforfilter .= '<input type="submit" name="buttonreset" class="butActionDelete noborderbottom" value="' . DolibarrFunctions::dol_escape_htmltag($this->langs->trans("Reset")) . '">';
            $moreforfilter .= '</div>';
            $moreforfilter .= '</div>';

            $moreforfilter .= '</div>';

            if (!empty($moreforfilter)) {
                print $moreforfilter;
                $this->parameters = [];
                $reshook = $this->hookmanager->executeHooks('printFieldPreListTitle', $this->parameters); // Note that $this->action and $object may have been modified by hook
                print $this->hookmanager->resPrint;
            }

            $moreforfilter = '';

            print '<div class="clearboth"></div><br>';

            $object = new stdClass();
            $this->parameters = [];
            $reshook = $this->hookmanager->executeHooks('insertExtraHeader', $this->parameters, $object, $this->action); // Note that $this->action and $object may have been modified by some hooks
            if ($reshook < 0) {
                DolibarrFunctions::setEventMessages($this->hookmanager->error, $this->hookmanager->errors, 'errors');
            }

            $disabled_modules = [];
            if (!empty($_SESSION["disablemodules"])) {
                $disabled_modules = explode(',', $_SESSION["disablemodules"]);
            }

            // Show list of modules
            $oldfamily = '';
            $foundoneexternalmodulewithupdate = 0;
            $linenum = 0;
            foreach ($orders as $key => $this->value) {
                $linenum++;
                $tab = explode('_', $this->value);
                $familykey = $tab[1];
                $module_position = $tab[2];

                $modName = $filename[$key];

                /** @var DolibarrModules $objMod */
                $objMod = $modules[$modName];

                //print $objMod->name." - ".$key." - ".$objMod->version."<br>";
                if ($this->mode == 'expdev' && $objMod->version != 'development' && $objMod->version != 'experimental') {
                    continue; // Discard if not for current tab
                }

                if (!$objMod->getName()) {
                    DolibarrFunctions::dol_syslog("Error for module " . $key . " - Property name of module looks empty", LOG_WARNING);
                    continue;
                }

                $modulenameshort = strtolower(preg_replace('/^mod/i', '', get_class($objMod)));
                $const_name = 'MAIN_MODULE_' . strtoupper(preg_replace('/^mod/i', '', get_class($objMod)));

                // Check filters
                $modulename = $objMod->getName();
                $moduletechnicalname = $objMod->name;
                $moduledesc = $objMod->getDesc();
                $moduledesclong = $objMod->getDescLong();
                $moduleauthor = $objMod->getPublisher();

                // We discard showing according to filters
                if ($this->search_keyword) {
                    $qualified = 0;
                    if (preg_match('/' . preg_quote($this->search_keyword) . '/i', $modulename)
                        || preg_match('/' . preg_quote($this->search_keyword) . '/i', $moduletechnicalname)
                        || preg_match('/' . preg_quote($this->search_keyword) . '/i', $moduledesc)
                        || preg_match('/' . preg_quote($this->search_keyword) . '/i', $moduledesclong)
                        || preg_match('/' . preg_quote($this->search_keyword) . '/i', $moduleauthor)
                    ) {
                        $qualified = 1;
                    }
                    if (!$qualified) {
                        continue;
                    }
                }
                if ($this->search_status) {
                    if ($this->search_status == 'active' && empty($this->conf->global->$const_name)) {
                        continue;
                    }
                    if ($this->search_status == 'disabled' && !empty($this->conf->global->$const_name)) {
                        continue;
                    }
                }
                if ($this->search_nature) {
                    if (preg_match('/^external/', $this->search_nature) && $objMod->isCoreOrExternalModule() != 'external') {
                        continue;
                    }
                    $reg = [];
                    if (preg_match('/^external_(.*)$/', $this->search_nature, $reg)) {
                        //print $reg[1].'-'.DolibarrFunctions::dol_escape_htmltag($objMod->getPublisher());
                        $publisher = DolibarrFunctions::dol_escape_htmltag($objMod->getPublisher());
                        if ($reg[1] && DolibarrFunctions::dol_escape_htmltag($reg[1]) != $publisher) {
                            continue;
                        }
                        if (!$reg[1] && !empty($publisher)) {
                            continue;
                        }
                    }
                    if ($this->search_nature == 'core' && $objMod->isCoreOrExternalModule() == 'external') {
                        continue;
                    }
                }
                if ($this->search_version) {
                    if (($objMod->version == 'development' || $objMod->version == 'experimental' || preg_match('/deprecated/', $objMod->version)) && $this->search_version == 'stable') {
                        continue;
                    }
                    if ($objMod->version != 'development' && ($this->search_version == 'development')) {
                        continue;
                    }
                    if ($objMod->version != 'experimental' && ($this->search_version == 'experimental')) {
                        continue;
                    }
                    if (!preg_match('/deprecated/', $objMod->version) && ($this->search_version == 'deprecated')) {
                        continue;
                    }
                }

                // Load all lang files of module
                if (isset($objMod->langfiles) && is_array($objMod->langfiles)) {
                    foreach ($objMod->langfiles as $domain) {
                        $this->langs->load($domain);
                    }
                }

                // Print a separator if we change family
                if ($familykey != $oldfamily) {
                    if ($oldfamily) {
                        print '</table></div><br>';
                    }

                    $familytext = empty($this->familyinfo[$familykey]['label']) ? $familykey : $this->familyinfo[$familykey]['label'];

                    print DolibarrFunctions::load_fiche_titre($familytext, '', '', 0, '', 'modulefamilygroup');

                    if ($this->mode == 'commonkanban') {
                        print '<div class="box-flex-container">';
                    } else {
                        print '<div class="div-table-responsive">';
                        print '<table class="tagtable liste" summary="list_of_modules">' . "\n";
                    }

                    $atleastoneforfamily = 0;
                }

                $atleastoneforfamily++;

                if ($familykey != $oldfamily) {
                    $familytext = empty($this->familyinfo[$familykey]['label']) ? $familykey : $this->familyinfo[$familykey]['label'];
                    $oldfamily = $familykey;
                }

                // Version (with picto warning or not)
                $version = $objMod->getVersion(0);
                $versiontrans = '';
                if (preg_match('/development/i', $version)) {
                    $versiontrans .= DolibarrFunctions::img_warning($this->langs->trans("Development"), '', 'floatleft paddingright');
                }
                if (preg_match('/experimental/i', $version)) {
                    $versiontrans .= DolibarrFunctions::img_warning($this->langs->trans("Experimental"), '', 'floatleft paddingright');
                }
                if (preg_match('/deprecated/i', $version)) {
                    $versiontrans .= DolibarrFunctions::img_warning($this->langs->trans("Deprecated"), '', 'floatleft paddingright');
                }
                if ($objMod->isCoreOrExternalModule() == 'external' || preg_match('/development|experimental|deprecated/i', $version)) {
                    $versiontrans .= $objMod->getVersion(1);
                }

                if ($objMod->isCoreOrExternalModule() == 'external'
                    && (
                        $this->action == 'checklastversion'
                        // This is a bad practice to activate a synch external access during building of a page. 1 external module can hang the application.
                        // Adding a cron job could be a good idea see DolibarrModules::checkForUpdate()
                        || !empty($this->conf->global->CHECKLASTVERSION_EXTERNALMODULE)
                    )
                ) {
                    $checkRes = $objMod->checkForUpdate();
                    if ($checkRes > 0) {
                        setEventMessage($objMod->getName() . ' : ' . $versiontrans . ' -> ' . $objMod->lastVersion);
                    } elseif ($checkRes < 0) {
                        setEventMessage($objMod->getName() . ' ' . $this->langs->trans('CheckVersionFail'), 'warnings');
                    }
                }

                // Define imginfo
                $imginfo = "info";
                if ($objMod->isCoreOrExternalModule() == 'external') {
                    $imginfo = "info_black";
                }

                $codeenabledisable = '';
                $codetoconfig = '';

                // Force disable of module disabled into session (for demo for example)
                if (in_array($modulenameshort, $disabled_modules)) {
                    $objMod->disabled = true;
                }

                // Activate/Disable and Setup (2 columns)
                if (!empty($this->conf->global->$const_name)) {    // If module is already activated
                    // Set $codeenabledisable
                    $disableSetup = 0;
                    if (!empty($arrayofwarnings[$modName])) {
                        $codeenabledisable .= '<!-- This module has a warning to show when we activate it (note: your country is ' . $mysoc->country_code . ') -->' . "\n";
                    }

                    if (!empty($objMod->disabled)) {
                        $codeenabledisable .= $this->langs->trans("Disabled");
                    } elseif (!empty($objMod->always_enabled) || ((!empty($this->conf->multicompany->enabled) && $objMod->core_enabled) && ($this->user->entity || $this->conf->entity != 1))) {
                        if (method_exists($objMod, 'alreadyUsed') && $objMod->alreadyUsed()) {
                            $codeenabledisable .= $this->langs->trans("Used");
                        } else {
                            $codeenabledisable .= DolibarrFunctions::img_picto($this->langs->trans("Required"), 'switch_on', '', false, 0, 0, '', 'opacitymedium valignmiddle');
                            //print $this->langs->trans("Required");
                        }
                        if (!empty($this->conf->multicompany->enabled) && $this->user->entity) {
                            $disableSetup++;
                        }
                    } else {
                        if (!empty($objMod->warnings_unactivation[$mysoc->country_code]) && method_exists($objMod, 'alreadyUsed') && $objMod->alreadyUsed()) {
                            $codeenabledisable .= '<a class="reposition valignmiddle" href="' . $_SERVER["PHP_SELF"] . '?id=' . $objMod->numero . '&amp;token=' . DolibarrFunctions::newToken() . '&amp;module_position=' . $module_position . '&amp;action=reset_confirm&amp;confirm_message_code=' . urlencode($objMod->warnings_unactivation[$mysoc->country_code]) . '&amp;value=' . $modName . '&amp;mode=' . $this->mode . $this->param . '">';
                            $codeenabledisable .= DolibarrFunctions::img_picto($this->langs->trans("Activated"), 'switch_on');
                            $codeenabledisable .= '</a>';
                        } else {
                            $codeenabledisable .= '<a class="reposition valignmiddle" href="' . $_SERVER["PHP_SELF"] . '?id=' . $objMod->numero . '&amp;token=' . DolibarrFunctions::newToken() . '&amp;module_position=' . $module_position . '&amp;action=reset&amp;value=' . $modName . '&amp;mode=' . $this->mode . '&amp;confirm=yes' . $this->param . '">';
                            $codeenabledisable .= DolibarrFunctions::img_picto($this->langs->trans("Activated"), 'switch_on');
                            $codeenabledisable .= '</a>';
                        }
                    }

                    // Set $codetoconfig
                    if (!empty($objMod->config_page_url) && !$disableSetup) {
                        $backtourlparam = '';
                        if ($this->search_keyword != '') {
                            $backtourlparam .= ($backtourlparam ? '&' : '?') . 'search_keyword=' . urlencode($this->search_keyword); // No urlencode here, done later
                        }
                        if ($this->search_nature > -1) {
                            $backtourlparam .= ($backtourlparam ? '&' : '?') . 'search_nature=' . urlencode($this->search_nature); // No urlencode here, done later
                        }
                        if ($this->search_version > -1) {
                            $backtourlparam .= ($backtourlparam ? '&' : '?') . 'search_version=' . urlencode($this->search_version); // No urlencode here, done later
                        }
                        if ($this->search_status > -1) {
                            $backtourlparam .= ($backtourlparam ? '&' : '?') . 'search_status=' . urlencode($this->search_status); // No urlencode here, done later
                        }
                        $backtourl = $_SERVER["PHP_SELF"] . $backtourlparam;

                        $regs = [];
                        if (is_array($objMod->config_page_url)) {
                            $i = 0;
                            foreach ($objMod->config_page_url as $page) {
                                $urlpage = $page;
                                if ($i++) {
                                    $codetoconfig .= '<a href="' . $urlpage . '" title="' . $this->langs->trans($page) . '">' . DolibarrFunctions::img_picto(ucfirst($page), "setup") . '</a>';
                                    //    print '<a href="'.$page.'">'.ucfirst($page).'</a>&nbsp;';
                                } else {
                                    if (preg_match('/^([^@]+)@([^@]+)$/i', $urlpage, $regs)) {
                                        $urltouse = DolibarrFunctions::dol_buildpath('/' . $regs[2] . '/admin/' . $regs[1], 1);
                                        $codetoconfig .= '<a href="' . $urltouse . (preg_match('/\?/', $urltouse) ? '&' : '?') . 'save_lastsearch_values=1&backtopage=' . urlencode($backtourl) . '" title="' . $this->langs->trans("Setup") . '">' . DolibarrFunctions::img_picto($this->langs->trans("Setup"), "setup", 'style="padding-right: 6px"', false, 0, 0, '', 'fa-15') . '</a>';
                                    } else {
                                        $urltouse = $urlpage;
                                        $codetoconfig .= '<a href="' . $urltouse . (preg_match('/\?/', $urltouse) ? '&' : '?') . 'save_lastsearch_values=1&backtopage=' . urlencode($backtourl) . '" title="' . $this->langs->trans("Setup") . '">' . DolibarrFunctions::img_picto($this->langs->trans("Setup"), "setup", 'style="padding-right: 6px"', false, 0, 0, '', 'fa-15') . '</a>';
                                    }
                                }
                            }
                        } elseif (preg_match('/^([^@]+)@([^@]+)$/i', $objMod->config_page_url, $regs)) {
                            $codetoconfig .= '<a class="valignmiddle" href="' . DolibarrFunctions::dol_buildpath('/' . $regs[2] . '/admin/' . $regs[1], 1) . '?save_lastsearch_values=1&backtopage=' . urlencode($backtourl) . '" title="' . $this->langs->trans("Setup") . '">' . DolibarrFunctions::img_picto($this->langs->trans("Setup"), "setup", 'style="padding-right: 6px"', false, 0, 0, '', 'fa-15') . '</a>';
                        } else {
                            $codetoconfig .= '<a class="valignmiddle" href="' . $objMod->config_page_url . '?save_lastsearch_values=1&backtopage=' . urlencode($backtourl) . '" title="' . $this->langs->trans("Setup") . '">' . DolibarrFunctions::img_picto($this->langs->trans("Setup"), "setup", 'style="padding-right: 6px"', false, 0, 0, '', 'fa-15') . '</a>';
                        }
                    } else {
                        $codetoconfig .= DolibarrFunctions::img_picto($this->langs->trans("NothingToSetup"), "setup", 'class="opacitytransp" style="padding-right: 6px"', false, 0, 0, '', 'fa-15');
                    }
                } else { // Module not yet activated
                    // Set $codeenabledisable
                    if (!empty($objMod->always_enabled)) {
                        // Should never happened
                    } elseif (!empty($objMod->disabled)) {
                        $codeenabledisable .= $this->langs->trans("Disabled");
                    } else {
                        // Module qualified for activation
                        $warningmessage = '';
                        if (!empty($arrayofwarnings[$modName])) {
                            $codeenabledisable .= '<!-- This module is a core module and it may have a warning to show when we activate it (note: your country is ' . $mysoc->country_code . ') -->' . "\n";
                            foreach ($arrayofwarnings[$modName] as $keycountry => $cursorwarningmessage) {
                                if (preg_match('/^always/', $keycountry) || ($mysoc->country_code && preg_match('/^' . $mysoc->country_code . '/', $keycountry))) {
                                    $warningmessage .= ($warningmessage ? "\n" : "") . $this->langs->trans($cursorwarningmessage, $objMod->getName(), $mysoc->country_code);
                                }
                            }
                        }
                        if ($objMod->isCoreOrExternalModule() == 'external' && !empty($arrayofwarningsext)) {
                            $codeenabledisable .= '<!-- This module is an external module and it may have a warning to show (note: your country is ' . $mysoc->country_code . ') -->' . "\n";
                            foreach ($arrayofwarningsext as $keymodule => $arrayofwarningsextbycountry) {
                                $keymodulelowercase = strtolower(preg_replace('/^mod/', '', $keymodule));
                                if (in_array($keymodulelowercase, $this->conf->modules)) {    // If module that request warning is on
                                    foreach ($arrayofwarningsextbycountry as $keycountry => $cursorwarningmessage) {
                                        if (preg_match('/^always/', $keycountry) || ($mysoc->country_code && preg_match('/^' . $mysoc->country_code . '/', $keycountry))) {
                                            $warningmessage .= ($warningmessage ? "\n" : "") . $this->langs->trans($cursorwarningmessage, $objMod->getName(), $mysoc->country_code, $modules[$keymodule]->getName());
                                            $warningmessage .= ($warningmessage ? "\n" : "") . ($warningmessage ? "\n" : "") . $this->langs->trans("Module") . ' : ' . $objMod->getName();
                                            if (!empty($objMod->editor_name)) {
                                                $warningmessage .= ($warningmessage ? "\n" : "") . $this->langs->trans("Publisher") . ' : ' . $objMod->editor_name;
                                            }
                                            if (!empty($objMod->editor_name)) {
                                                $warningmessage .= ($warningmessage ? "\n" : "") . $this->langs->trans("ModuleTriggeringThisWarning") . ' : ' . $modules[$keymodule]->getName();
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        $codeenabledisable .= '<!-- Message to show: ' . $warningmessage . ' -->' . "\n";
                        $codeenabledisable .= '<a class="reposition" href="' . $_SERVER["PHP_SELF"] . '?id=' . $objMod->numero . '&token=' . DolibarrFunctions::newToken() . '&module_position=' . $module_position . '&action=set&token=' . DolibarrFunctions::newToken() . '&value=' . $modName . '&mode=' . $this->mode . $this->param . '"';
                        if ($warningmessage) {
                            $codeenabledisable .= ' onclick="return confirm(\'' . dol_escape_js($warningmessage) . '\');"';
                        }
                        $codeenabledisable .= '>';
                        $codeenabledisable .= DolibarrFunctions::img_picto($this->langs->trans("Disabled"), 'switch_off');
                        $codeenabledisable .= "</a>\n";
                    }

                    // Set $codetoconfig
                    $codetoconfig .= DolibarrFunctions::img_picto($this->langs->trans("NothingToSetup"), "setup", 'class="opacitytransp" style="padding-right: 6px"');
                }

                if ($this->mode == 'commonkanban') {
                    // Output Kanban
                    print $objMod->getKanbanView($codeenabledisable, $codetoconfig);
                } else {
                    print '<tr class="oddeven">' . "\n";
                    if (!empty($this->conf->global->MAIN_MODULES_SHOW_LINENUMBERS)) {
                        print '<td class="width50">' . $linenum . '</td>';
                    }

                    // Picto + Name of module
                    print '  <td class="tdoverflowmax300" title="' . DolibarrFunctions::dol_escape_htmltag($objMod->getName()) . '">';
                    $alttext = '';
                    //if (is_array($objMod->need_dolibarr_version)) $alttext.=($alttext?' - ':'').'Dolibarr >= '.join('.',$objMod->need_dolibarr_version);
                    //if (is_array($objMod->phpmin)) $alttext.=($alttext?' - ':'').'PHP >= '.join('.',$objMod->phpmin);
                    if (!empty($objMod->picto)) {
                        if (preg_match('/^\//i', $objMod->picto)) {
                            print DolibarrFunctions::img_picto($alttext, $objMod->picto, 'class="valignmiddle pictomodule paddingrightonly"', 1);
                        } else {
                            print  DolibarrFunctions::img_object($alttext, $objMod->picto, 'class="valignmiddle pictomodule paddingrightonly"');
                        }
                    } else {
                        print  DolibarrFunctions::img_object($alttext, 'generic', 'class="valignmiddle paddingrightonly"');
                    }
                    print ' <span class="valignmiddle">' . $objMod->getName() . '</span>';
                    print "</td>\n";

                    // Desc
                    print '<td class="valignmiddle tdoverflowmax300">';
                    print nl2br($objMod->getDesc());
                    print "</td>\n";

                    // Help
                    print '<td class="center nowrap" style="width: 82px;">';
                    //print $form->textwithpicto('', $text, 1, $imginfo, 'minheight20', 0, 2, 1);
                    print '<a href="javascript:document_preview(\'' . DOL_URL_ROOT . '/admin/modulehelp.php?id=' . $objMod->numero . '\',\'text/html\',\'' . dol_escape_js($this->langs->trans("Module")) . '\')">' . DolibarrFunctions::img_picto(($objMod->isCoreOrExternalModule() == 'external' ? $this->langs->trans("ExternalModule") . ' - ' : '') . $this->langs->trans("ClickToShowDescription"), $imginfo) . '</a>';
                    print '</td>';

                    // Version
                    print '<td class="center nowrap" width="120px">';
                    if ($objMod->needUpdate) {
                        $versionTitle = $this->langs->trans('ModuleUpdateAvailable') . ' : ' . $objMod->lastVersion;
                        print '<span class="badge badge-warning classfortooltip" title="' . DolibarrFunctions::dol_escape_htmltag($versionTitle) . '">' . $versiontrans . '</span>';
                    } else {
                        print $versiontrans;
                    }
                    print "</td>\n";

                    // Link enable/disable
                    print '<td class="center valignmiddle" width="60px">';
                    print $codeenabledisable;
                    print "</td>\n";

                    // Link config
                    print '<td class="tdsetuppicto right valignmiddle" width="60px">';
                    print $codetoconfig;
                    print '</td>';

                    print "</tr>\n";
                }
                if ($objMod->needUpdate) {
                    $foundoneexternalmodulewithupdate++;
                }
            }

            if ($this->action == 'checklastversion') {
                if ($foundoneexternalmodulewithupdate) {
                    DolibarrFunctions::setEventMessages($this->langs->trans("ModuleUpdateAvailable"), null, 'mesgs');
                } else {
                    DolibarrFunctions::setEventMessages($this->langs->trans("NoExternalModuleWithUpdate"), null, 'mesgs');
                }
            }

            if ($oldfamily) {
                if ($this->mode == 'commonkanban') {
                    print '</div>';
                } else {
                    print "</table>\n";
                    print '</div>';
                }
            }

            print DolibarrFunctions::dol_get_fiche_end();

            print '<br>';

            // Show warning about external users
            print DolibarrFunctions::DolibarrFunctions::info_admin(showModulesExludedForExternal($modules)) . "\n";

            print '</form>';
        }

        if ($this->mode == 'marketplace') {
            print DolibarrFunctions::dol_get_fiche_head($head, $this->mode, '', -1);

            print $deschelp;

            print '<br>';

            // Marketplace
            print '<div class="div-table-responsive-no-min">';
            print '<table summary="list_of_modules" class="noborder centpercent">' . "\n";
            print '<tr class="liste_titre">' . "\n";
            print '<td class="hideonsmartphone">' . $form->textwithpicto($this->langs->trans("Provider"), $this->langs->trans("WebSiteDesc")) . '</td>';
            print '<td></td>';
            print '<td>' . $this->langs->trans("URL") . '</td>';
            print '</tr>';

            print '<tr class="oddeven">' . "\n";
            $url = 'https://www.dolistore.com';
            print '<td class="hideonsmartphone"><a href="' . $url . '" target="_blank" rel="external"><img border="0" class="imgautosize imgmaxwidth180" src="' . DOL_URL_ROOT . '/theme/dolistore_logo.png"></a></td>';
            print '<td><span class="opacitymedium">' . $this->langs->trans("DoliStoreDesc") . '</span></td>';
            print '<td><a href="' . $url . '" target="_blank" rel="external">' . $url . '</a></td>';
            print '</tr>';

            print "</table>\n";
            print '</div>';

            print DolibarrFunctions::dol_get_fiche_end();

            print '<br>';

            if (empty($this->conf->global->MAIN_DISABLE_DOLISTORE_SEARCH) && $this->conf->global->MAIN_FEATURES_LEVEL >= 1) {
                // $this->options is array with filter criterias
                //var_dump($this->options);
                $this->dolistore->getRemoteCategories();
                $this->dolistore->getRemoteProducts($this->options);

                print '<span class="opacitymedium">' . $this->langs->trans('DOLISTOREdescriptionLong') . '</span><br><br>';

                $previouslink = $this->dolistore->get_previous_link();
                $nextlink = $this->dolistore->get_next_link();

                print '<div class="liste_titre liste_titre_bydiv centpercent"><div class="divsearchfield">';

                print '<form method="POST" class="centpercent" id="searchFormList" action="' . urlencode($this->dolistore->url) . '">';
                ?>
                <input type="hidden" name="token" value="<?php echo DolibarrFunctions::newToken(); ?>">
                <input type="hidden" name="mode" value="marketplace">
                <div class="divsearchfield">
                    <input name="search_keyword" placeholder="<?php echo $this->langs->trans('Keyword') ?>"
                           id="search_keyword"
                           type="text" class="minwidth200"
                           value="<?php echo DolibarrFunctions::dol_escape_htmltag($this->options['search']) ?>"><br>
                </div>
                <div class="divsearchfield">
                    <input class="button buttongen" value="<?php echo $this->langs->trans('Rechercher') ?>"
                           type="submit">
                    <a class="buttonreset"
                       href="<?php echo urlencode($this->dolistore->url) ?>"><?php echo $this->langs->trans('Reset') ?></a>

                    &nbsp;
                </div>
                <?php
                print $previouslink;
                print $nextlink;
                print '</form>';

                print '</div></div>';
                print '<div class="clearboth"></div>';

                ?>

                <div id="category-tree-left">
                    <ul class="tree">
                        <?php echo DolibarrFunctions::dol_escape_htmltag($this->dolistore->get_categories()); ?>
                    </ul>
                </div>
                <div id="listing-content">
                    <table summary="list_of_modules" id="list_of_modules" class="productlist centpercent">
                        <tbody id="listOfModules">
                        <?php echo $this->dolistore->get_products(!empty($categorie) ? $categorie : ''); ?>
                        </tbody>
                    </table>
                </div>

                <?php
            }
        }

        // Install external module

        if ($this->mode == 'deploy') {
            print DolibarrFunctions::dol_get_fiche_head($head, $this->mode, '', -1);

            print $deschelp;

            $dolibarrdataroot = preg_replace('/([\\/]+)$/i', '', DOL_DATA_ROOT);
            $allowonlineinstall = true;
            $allowfromweb = 1;
            if (DolibarrFiles::dol_is_file($dolibarrdataroot . '/installmodules.lock')) {
                $allowonlineinstall = false;
            }

            $fullurl = '<a href="' . $this->urldolibarrmodules . '" target="_blank">' . $this->urldolibarrmodules . '</a>';
            $message = '';
            if (!empty($allowonlineinstall)) {
                if (!in_array('/custom', explode(',', $dolibarr_main_url_root_alt))) {
                    $message = DolibarrFunctions::info_admin($this->langs->trans("ConfFileMustContainCustom", DOL_DOCUMENT_ROOT . '/custom', DOL_DOCUMENT_ROOT));
                    $allowfromweb = -1;
                } else {
                    if ($this->dirins_ok) {
                        if (!is_writable(dol_osencode($this->dirins))) {
                            $this->langs->load("errors");
                            $message = DolibarrFunctions::info_admin($this->langs->trans("ErrorFailedToWriteInDir", $this->dirins), 0, 0, '1', 'warning');
                            $allowfromweb = 0;
                        }
                    } else {
                        $message = DolibarrFunctions::info_admin($this->langs->trans("NotExistsDirect", $this->dirins) . $this->langs->trans("InfDirAlt") . $this->langs->trans("InfDirExample"));
                        $allowfromweb = 0;
                    }
                }
            } else {
                $message = DolibarrFunctions::info_admin($this->langs->trans("InstallModuleFromWebHasBeenDisabledByFile", $dolibarrdataroot . '/installmodules.lock'));
                $allowfromweb = 0;
            }

            if ($allowfromweb < 1) {
                print $this->langs->trans("SomethingMakeInstallFromWebNotPossible");
                print $message;
                //print $this->langs->trans("SomethingMakeInstallFromWebNotPossible2");
                print '<br>';
            }

            print '<br>';

            if ($allowfromweb >= 0) {
                if ($allowfromweb == 1) {
                    //print $this->langs->trans("ThisIsProcessToFollow").'<br>';
                } else {
                    print $this->langs->trans("ThisIsAlternativeProcessToFollow") . '<br>';
                    print '<b>' . $this->langs->trans("StepNb", 1) . '</b>: ';
                    print str_replace('{s1}', $fullurl, $this->langs->trans("FindPackageFromWebSite", '{s1}')) . '<br>';
                    print '<b>' . $this->langs->trans("StepNb", 2) . '</b>: ';
                    print str_replace('{s1}', $fullurl, $this->langs->trans("DownloadPackageFromWebSite", '{s1}')) . '<br>';
                    print '<b>' . $this->langs->trans("StepNb", 3) . '</b>: ';
                }

                if ($allowfromweb == 1) {
                    print $this->langs->trans("UnpackPackageInModulesRoot", $this->dirins) . '<br>';

                    print '<br>';

                    print '<form enctype="multipart/form-data" method="POST" class="noborder" action="' . $_SERVER["PHP_SELF"] . '" name="forminstall">';
                    print '<input type="hidden" name="token" value="' . DolibarrFunctions::newToken() . '">';
                    print '<input type="hidden" name="action" value="install">';
                    print '<input type="hidden" name="mode" value="deploy">';

                    print $this->langs->trans("YouCanSubmitFile");

                    $max = $this->conf->global->MAIN_UPLOAD_DOC; // In Kb
                    $maxphp = @ini_get('upload_max_filesize'); // In unknown
                    if (preg_match('/k$/i', $maxphp)) {
                        $maxphp = preg_replace('/k$/i', '', $maxphp);
                        $maxphp = $maxphp * 1;
                    }
                    if (preg_match('/m$/i', $maxphp)) {
                        $maxphp = preg_replace('/m$/i', '', $maxphp);
                        $maxphp = $maxphp * 1024;
                    }
                    if (preg_match('/g$/i', $maxphp)) {
                        $maxphp = preg_replace('/g$/i', '', $maxphp);
                        $maxphp = $maxphp * 1024 * 1024;
                    }
                    if (preg_match('/t$/i', $maxphp)) {
                        $maxphp = preg_replace('/t$/i', '', $maxphp);
                        $maxphp = $maxphp * 1024 * 1024 * 1024;
                    }
                    $maxphp2 = @ini_get('post_max_size'); // In unknown
                    if (preg_match('/k$/i', $maxphp2)) {
                        $maxphp2 = preg_replace('/k$/i', '', $maxphp2);
                        $maxphp2 = $maxphp2 * 1;
                    }
                    if (preg_match('/m$/i', $maxphp2)) {
                        $maxphp2 = preg_replace('/m$/i', '', $maxphp2);
                        $maxphp2 = $maxphp2 * 1024;
                    }
                    if (preg_match('/g$/i', $maxphp2)) {
                        $maxphp2 = preg_replace('/g$/i', '', $maxphp2);
                        $maxphp2 = $maxphp2 * 1024 * 1024;
                    }
                    if (preg_match('/t$/i', $maxphp2)) {
                        $maxphp2 = preg_replace('/t$/i', '', $maxphp2);
                        $maxphp2 = $maxphp2 * 1024 * 1024 * 1024;
                    }
                    // Now $max and $maxphp and $maxphp2 are in Kb
                    $maxmin = $max;
                    $maxphptoshow = $maxphptoshowparam = '';
                    if ($maxphp > 0) {
                        $maxmin = min($max, $maxphp);
                        $maxphptoshow = $maxphp;
                        $maxphptoshowparam = 'upload_max_filesize';
                    }
                    if ($maxphp2 > 0) {
                        $maxmin = min($max, $maxphp2);
                        if ($maxphp2 < $maxphp) {
                            $maxphptoshow = $maxphp2;
                            $maxphptoshowparam = 'post_max_size';
                        }
                    }

                    if ($maxmin > 0) {
                        print '<script type="text/javascript">
				$(document).ready(function() {
					jQuery("#fileinstall").on("change", function() {
						if(this.files[0].size > ' . ($maxmin * 1024) . '){
							alert("' . dol_escape_js($this->langs->trans("ErrorFileSizeTooLarge")) . '");
							this.value = "";
						}
					});
				});
				</script>' . "\n";
                        // MAX_FILE_SIZE doit précéder le champ input de type file
                        print '<input type="hidden" name="max_file_size" value="' . ($maxmin * 1024) . '">';
                    }

                    print '<input class="flat minwidth400" type="file" name="fileinstall" id="fileinstall"> ';

                    print '<input type="submit" name="send" value="' . DolibarrFunctions::dol_escape_htmltag($this->langs->trans("Upload")) . '" class="button">';

                    if (!empty($this->conf->global->MAIN_UPLOAD_DOC)) {
                        if ($this->user->admin) {
                            $this->langs->load('other');
                            print ' ';
                            print DolibarrFunctions::info_admin($this->langs->trans("ThisLimitIsDefinedInSetup", $max, $maxphptoshow, $maxphptoshowparam), 1);
                        }
                    } else {
                        print ' (' . $this->langs->trans("UploadDisabled") . ')';
                    }

                    print '</form>';

                    print '<br>';
                    print '<br>';

                    print '<div class="center"><div class="logo_setup"></div></div>';
                } else {
                    print $this->langs->trans("UnpackPackageInModulesRoot", $this->dirins) . '<br>';
                    print '<b>' . $this->langs->trans("StepNb", 4) . '</b>: ';
                    print $this->langs->trans("SetupIsReadyForUse") . '<br>';
                }
            }

            if (!empty($result['return'])) {
                print '<br>';

                foreach ($result['return'] as $this->value) {
                    echo $this->value . '<br>';
                }
            }

            print DolibarrFunctions::dol_get_fiche_end();
        }

        if ($this->mode == 'develop') {
            print DolibarrFunctions::dol_get_fiche_head($head, $this->mode, '', -1);

            print $deschelp;

            print '<br>';

            // Marketplace
            print "<table summary=\"list_of_modules\" class=\"noborder\" width=\"100%\">\n";
            print "<tr class=\"liste_titre\">\n";
            //print '<td>'.$this->langs->trans("Logo").'</td>';
            print '<td colspan="2">' . $this->langs->trans("DevelopYourModuleDesc") . '</td>';
            print '<td>' . $this->langs->trans("URL") . '</td>';
            print '</tr>';

            print '<tr class="oddeven" height="80">' . "\n";
            print '<td class="left">';
            print '<div class="imgmaxheight50 logo_setup"></div>';
            print '</td>';
            print '<td>' . $this->langs->trans("TryToUseTheModuleBuilder", $this->langs->transnoentitiesnoconv("ModuleBuilder")) . '</td>';
            print '<td class="maxwidth300">';
            if (!empty($this->conf->modulebuilder->enabled)) {
                print $this->langs->trans("SeeTopRightMenu");
            } else {
                print '<span class="opacitymedium">' . $this->langs->trans("ModuleMustBeEnabledFirst", $this->langs->transnoentitiesnoconv("ModuleBuilder")) . '</span>';
            }
            print '</td>';
            print '</tr>';

            print '<tr class="oddeven" height="80">' . "\n";
            $url = 'https://partners.dolibarr.org';
            print '<td class="left">';
            print'<a href="' . $url . '" target="_blank" rel="external"><img border="0" class="imgautosize imgmaxwidth180" src="' . DOL_URL_ROOT . '/theme/dolibarr_preferred_partner.png"></a>';
            print '</td>';
            print '<td>' . $this->langs->trans("DoliPartnersDesc") . '</td>';
            print '<td><a href="' . $url . '" target="_blank" rel="external">' . $url . '</a></td>';
            print '</tr>';

            print "</table>\n";

            print DolibarrFunctions::dol_get_fiche_end();
        }

        // End of page
        $this->llxFooter();
        //$db->close();

        return parent::printPage();
    }

    /**
     * Assign the template.
     */
    function setTemplate(): void
    {
        $this->template = 'dolibarr';
    }

}
