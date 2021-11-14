<?php
/* Copyright (C) 2001-2007	Rodolphe Quiedeville	<rodolphe@quiedeville.org>
 * Copyright (C) 2004-2019	Laurent Destailleur		<eldy@users.sourceforge.net>
 * Copyright (C) 2005-2017	Regis Houssin			<regis.houssin@inodbox.com>
 * Copyright (C) 2010-2014	Juanjo Menent			<jmenent@2byte.es>
 * Copyright (C) 2011-2017	Philippe Grand			<philippe.grand@atoo-net.com>
 * Copyright (C) 2015		Alexandre Spangaro		<aspangaro@open-dsi.fr>
 * Copyright (C) 2017       Rui Strecht			    <rui.strecht@aliartalentos.com>
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

namespace Alxarafe\Modules\Admin\Controllers;

use Alxarafe\Core\Base\View;
use Alxarafe\Dolibarr\Base\DolibarrController;
use Alxarafe\Dolibarr\Libraries\DolibarrAdmin;
use Alxarafe\Dolibarr\Libraries\DolibarrCompany;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;
use Alxarafe\Modules\Admin\Views\CompanyView;

/**
 *    \file       htdocs/admin/company.php
 *    \ingroup    company
 *    \brief      Setup page to configure company/foundation
 */
class Company extends DolibarrController
{

    public function __construct()
    {
        parent::__construct();

        /**
         * TODO: Temporarily defined constants
         */
        // const MAIN_HIDE_TOP_MENU = 0;
        // const MAIN_HIDE_LEFT_MENU = 0;
        // const NOREQUIREDB = 0;
        // const NOREQUIRESOC = 0;

        // require_once DOL_DOCUMENT_ROOT . '/core/lib/admin.lib.php';
        // require_once DOL_DOCUMENT_ROOT . '/core/lib/company.lib.php';
        // require_once DOL_DOCUMENT_ROOT . '/core/lib/date.lib.php';
        // require_once DOL_DOCUMENT_ROOT . '/core/lib/images.lib.php';
        // require_once DOL_DOCUMENT_ROOT . '/core/lib/files.lib.php';
        // require_once DOL_DOCUMENT_ROOT . '/core/lib/functions2.lib.php';
        // require_once DOL_DOCUMENT_ROOT . '/core/class/html.formother.class.php';
        // require_once DOL_DOCUMENT_ROOT . '/core/class/html.formcompany.class.php';

        // Load translation files required by the page
        $this->langs->loadLangs(['admin', 'companies', 'bills']);

        if (!$this->user->admin) {
            accessforbidden();
        }

        // Initialize technical object to manage hooks of page. Note that conf->hooks_modules contains array of hook context
        $this->hookmanager->initHooks(['admincompany', 'globaladmin']);
    }

    function getDolibarrVars(): void
    {
        $this->action = DolibarrFunctions::GETPOST('action', 'aZ09');
        $this->contextpage = DolibarrFunctions::GETPOST('contextpage', 'aZ') ? DolibarrFunctions::GETPOST('contextpage', 'aZ') : 'admincompany'; // To manage different context of search

        $this->error = 0;
    }

    function getDolibarrActions(): void
    {
        $parameters = [];
        $reshook = $this->hookmanager->executeHooks('doActions', $parameters, $object, $this->action); // Note that $this->action and $object may have been modified by some hooks
        if ($reshook < 0) {
            DolibarrFunctions::setEventMessages($this->hookmanager->error, $this->hookmanager->errors, 'errors');
        }

        if (($this->action == 'update' && !DolibarrFunctions::GETPOST("cancel", 'alpha'))
            || ($this->action == 'updateedit')) {

            $tmparray = DolibarrCompany::getCountry(DolibarrFunctions::GETPOST('country_id', 'int'), 'all', $this->db, $this->langs, 0);

            if (!empty($tmparray['id'])) {
                $this->mysoc->country_id = $tmparray['id'];
                $this->mysoc->country_code = $tmparray['code'];
                $this->mysoc->country_label = $tmparray['label'];

                $s = $this->mysoc->country_id . ':' . $this->mysoc->country_code . ':' . $this->mysoc->country_label;
                DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_SOCIETE_COUNTRY", $s, 'chaine', 0, '', $this->conf->entity);
                DolibarrAdmin::activateModulesRequiredByCountry($this->mysoc->country_code);
            }

            $tmparray = DolibarrCompany::getState(DolibarrFunctions::GETPOST('state_id', 'int'), 'all', $this->db, $this->langs, 0);
            if (!empty($tmparray['id'])) {
                $this->mysoc->state_id = $tmparray['id'];
                $this->mysoc->state_code = $tmparray['code'];
                $this->mysoc->state_label = $tmparray['label'];

                $s = $this->mysoc->state_id . ':' . $this->mysoc->state_code . ':' . $this->mysoc->state_label;
                DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_SOCIETE_STATE", $s, 'chaine', 0, '', $this->conf->entity);
            } else {
                DolibarrAdmin::dolibarr_del_const($this->db, "MAIN_INFO_SOCIETE_STATE", $this->conf->entity);
            }

            $this->db->beginTransaction();

            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_SOCIETE_NOM", DolibarrFunctions::GETPOST("nom", 'nohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_SOCIETE_ADDRESS", DolibarrFunctions::GETPOST("MAIN_INFO_SOCIETE_ADDRESS", 'nohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_SOCIETE_TOWN", DolibarrFunctions::GETPOST("MAIN_INFO_SOCIETE_TOWN", 'nohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_SOCIETE_ZIP", DolibarrFunctions::GETPOST("MAIN_INFO_SOCIETE_ZIP", 'alphanohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_SOCIETE_REGION", DolibarrFunctions::GETPOST("region_code", 'alphanohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_MONNAIE", DolibarrFunctions::GETPOST("currency", 'aZ09'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_SOCIETE_TEL", DolibarrFunctions::GETPOST("tel", 'alphanohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_SOCIETE_FAX", DolibarrFunctions::GETPOST("fax", 'alphanohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_SOCIETE_MAIL", DolibarrFunctions::GETPOST("mail", 'alphanohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_SOCIETE_WEB", DolibarrFunctions::GETPOST("web", 'alphanohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_SOCIETE_NOTE", DolibarrFunctions::GETPOST("note", 'restricthtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_SOCIETE_GENCOD", DolibarrFunctions::GETPOST("barcode", 'alphanohtml'), 'chaine', 0, '', $this->conf->entity);

            $dirforimage = $this->conf->mycompany->dir_output . '/logos/';

            $arrayofimages = ['logo', 'logo_squarred'];

            foreach ($arrayofimages as $varforimage) {
                if ($_FILES[$varforimage]["name"] && !preg_match('/(\.jpeg|\.jpg|\.png)$/i', $_FILES[$varforimage]["name"])) {    // Logo can be used on a lot of different places. Only jpg and png can be supported.
                    $this->langs->load("errors");
                    DolibarrFunctions::setEventMessages($this->langs->trans("ErrorBadImageFormat"), null, 'errors');
                    break;
                }

                if ($_FILES[$varforimage]["tmp_name"]) {
                    $reg = [];
                    if (preg_match('/([^\\/:]+)$/i', $_FILES[$varforimage]["name"], $reg)) {
                        $original_file = $reg[1];

                        $isimage = DolibarrImages::image_format_supported($original_file);
                        if ($isimage >= 0) {
                            dol_syslog("Move file " . $_FILES[$varforimage]["tmp_name"] . " to " . $dirforimage . $original_file);
                            if (!is_dir($dirforimage)) {
                                dol_mkdir($dirforimage);
                            }
                            $result = dol_move_uploaded_file($_FILES[$varforimage]["tmp_name"], $dirforimage . $original_file, 1, 0, $_FILES[$varforimage]['error']);
                            if ($result > 0) {
                                $constant = "MAIN_INFO_SOCIETE_LOGO";
                                if ($varforimage == 'logo_squarred') {
                                    $constant = "MAIN_INFO_SOCIETE_LOGO_SQUARRED";
                                }

                                DolibarrAdmin::dolibarr_set_const($this->db, $constant, $original_file, 'chaine', 0, '', $this->conf->entity);

                                // Create thumbs of logo (Note that PDF use original file and not thumbs)
                                if ($isimage > 0) {
                                    // Create thumbs
                                    //$object->addThumbs($newfile);    // We can't use addThumbs here yet because we need name of generated thumbs to add them into constants. TODO Check if need such constants. We should be able to retrieve value with get...

                                    // Create small thumb, Used on logon for example
                                    $imgThumbSmall = vignette($dirforimage . $original_file, $maxwidthsmall, $maxheightsmall, '_small', $quality);
                                    if (DolibarrImages::image_format_supported($imgThumbSmall) >= 0 && preg_match('/([^\\/:]+)$/i', $imgThumbSmall, $reg)) {
                                        $imgThumbSmall = $reg[1]; // Save only basename
                                        DolibarrAdmin::dolibarr_set_const($this->db, $constant . "_SMALL", $imgThumbSmall, 'chaine', 0, '', $this->conf->entity);
                                    } else {
                                        dol_syslog($imgThumbSmall);
                                    }

                                    // Create mini thumb, Used on menu or for setup page for example
                                    $imgThumbMini = vignette($dirforimage . $original_file, $maxwidthmini, $maxheightmini, '_mini', $quality);
                                    if (DolibarrImages::image_format_supported($imgThumbMini) >= 0 && preg_match('/([^\\/:]+)$/i', $imgThumbMini, $reg)) {
                                        $imgThumbMini = $reg[1]; // Save only basename
                                        DolibarrAdmin::dolibarr_set_const($this->db, $constant . "_MINI", $imgThumbMini, 'chaine', 0, '', $this->conf->entity);
                                    } else {
                                        dol_syslog($imgThumbMini);
                                    }
                                } else {
                                    dol_syslog("ErrorImageFormatNotSupported", LOG_WARNING);
                                }
                            } elseif (preg_match('/^ErrorFileIsInfectedWithAVirus/', $result)) {
                                $this->error++;
                                $this->langs->load("errors");
                                $tmparray = explode(':', $result);
                                DolibarrFunctions::setEventMessages($this->langs->trans('ErrorFileIsInfectedWithAVirus', $tmparray[1]), null, 'errors');
                            } else {
                                $this->error++;
                                DolibarrFunctions::setEventMessages($this->langs->trans("ErrorFailedToSaveFile"), null, 'errors');
                            }
                        } else {
                            $this->error++;
                            $this->langs->load("errors");
                            DolibarrFunctions::setEventMessages($this->langs->trans("ErrorBadImageFormat"), null, 'errors');
                        }
                    }
                }
            }

            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_SOCIETE_MANAGERS", DolibarrFunctions::GETPOST("MAIN_INFO_SOCIETE_MANAGERS", 'nohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_GDPR", DolibarrFunctions::GETPOST("MAIN_INFO_GDPR", 'nohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_CAPITAL", DolibarrFunctions::GETPOST("capital", 'nohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_SOCIETE_FORME_JURIDIQUE", DolibarrFunctions::GETPOST("forme_juridique_code", 'nohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_SIREN", DolibarrFunctions::GETPOST("siren", 'nohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_SIRET", DolibarrFunctions::GETPOST("siret", 'nohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_APE", DolibarrFunctions::GETPOST("ape", 'nohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_RCS", DolibarrFunctions::GETPOST("rcs", 'nohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_PROFID5", DolibarrFunctions::GETPOST("MAIN_INFO_PROFID5", 'nohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_PROFID6", DolibarrFunctions::GETPOST("MAIN_INFO_PROFID6", 'nohtml'), 'chaine', 0, '', $this->conf->entity);

            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_TVAINTRA", DolibarrFunctions::GETPOST("tva", 'nohtml'), 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_SOCIETE_OBJECT", DolibarrFunctions::GETPOST("object", 'nohtml'), 'chaine', 0, '', $this->conf->entity);

            DolibarrAdmin::dolibarr_set_const($this->db, "SOCIETE_FISCAL_MONTH_START", DolibarrFunctions::GETPOST("SOCIETE_FISCAL_MONTH_START", 'int'), 'chaine', 0, '', $this->conf->entity);

            // Sale tax options
            $usevat = DolibarrFunctions::GETPOST("optiontva", 'aZ09');
            $uselocaltax1 = DolibarrFunctions::GETPOST("optionlocaltax1", 'aZ09');
            $uselocaltax2 = DolibarrFunctions::GETPOST("optionlocaltax2", 'aZ09');
            if ($uselocaltax1 == 'localtax1on' && !$usevat) {
                DolibarrFunctions::setEventMessages($this->langs->trans("IfYouUseASecondTaxYouMustSetYouUseTheMainTax"), null, 'errors');
                $this->error++;
            }
            if ($uselocaltax2 == 'localtax2on' && !$usevat) {
                DolibarrFunctions::setEventMessages($this->langs->trans("IfYouUseAThirdTaxYouMustSetYouUseTheMainTax"), null, 'errors');
                $this->error++;
            }

            DolibarrAdmin::dolibarr_set_const($this->db, "FACTURE_TVAOPTION", $usevat, 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "FACTURE_LOCAL_TAX1_OPTION", $uselocaltax1, 'chaine', 0, '', $this->conf->entity);
            DolibarrAdmin::dolibarr_set_const($this->db, "FACTURE_LOCAL_TAX2_OPTION", $uselocaltax2, 'chaine', 0, '', $this->conf->entity);

            if (DolibarrFunctions::GETPOST("optionlocaltax1") == "localtax1on") {
                if (!DolibarrFunctions::GETPOSTISSET('lt1')) {
                    DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_VALUE_LOCALTAX1", 0, 'chaine', 0, '', $this->conf->entity);
                } else {
                    DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_VALUE_LOCALTAX1", DolibarrFunctions::GETPOST('lt1', 'aZ09'), 'chaine', 0, '', $this->conf->entity);
                }
                DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_LOCALTAX_CALC1", DolibarrFunctions::GETPOST("clt1", 'aZ09'), 'chaine', 0, '', $this->conf->entity);
            }
            if (DolibarrFunctions::GETPOST("optionlocaltax2") == "localtax2on") {
                if (!DolibarrFunctions::GETPOSTISSET('lt2')) {
                    DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_VALUE_LOCALTAX2", 0, 'chaine', 0, '', $this->conf->entity);
                } else {
                    DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_VALUE_LOCALTAX2", DolibarrFunctions::GETPOST('lt2', 'aZ09'), 'chaine', 0, '', $this->conf->entity);
                }
                DolibarrAdmin::dolibarr_set_const($this->db, "MAIN_INFO_LOCALTAX_CALC2", DolibarrFunctions::GETPOST("clt2", 'aZ09'), 'chaine', 0, '', $this->conf->entity);
            }

            if (!$this->error) {
                if (DolibarrFunctions::GETPOST('save')) {    // To avoid to show message when we juste switch the country that resubmit the form.
                    DolibarrFunctions::setEventMessages($this->langs->trans("SetupSaved"), null, 'mesgs');
                }
                $this->db->commit();
            } else {
                $this->db->rollback();
            }

            if ($this->action != 'updateedit' && !$this->error) {
                $url = $_SERVER['PHP_SELF'] .
                    '?' . self::MODULE_GET_VAR . '=' . $_GET[self::MODULE_GET_VAR] .
                    '&' . self::CONTROLLER_GET_VAR . '=' . $_GET[self::CONTROLLER_GET_VAR];

                return;
                header("Location: " . $url);
                exit;
            }
        }

        if ($this->action == 'addthumb' || $this->action == 'addthumbsquarred') {  // Regenerate thumbs
            if (file_exists($this->conf->mycompany->dir_output . '/logos/' . $_GET["file"])) {
                $isimage = DolibarrImages::image_format_supported($_GET["file"]);

                // Create thumbs of logo
                if ($isimage > 0) {
                    $constant = "MAIN_INFO_SOCIETE_LOGO";
                    if ($this->action == 'addthumbsquarred') {
                        $constant = "MAIN_INFO_SOCIETE_LOGO_SQUARRED";
                    }

                    $reg = [];

                    // Create thumbs
                    //$object->addThumbs($newfile);    // We can't use addThumbs here yet because we need name of generated thumbs to add them into constants. TODO Check if need such constants. We should be able to retrieve value with get...

                    // Create small thumb. Used on logon for example
                    $imgThumbSmall = vignette($this->conf->mycompany->dir_output . '/logos/' . $_GET["file"], $maxwidthsmall, $maxheightsmall, '_small', $quality);
                    if (DolibarrImages::image_format_supported($imgThumbSmall) >= 0 && preg_match('/([^\\/:]+)$/i', $imgThumbSmall, $reg)) {
                        $imgThumbSmall = $reg[1]; // Save only basename
                        DolibarrAdmin::dolibarr_set_const($this->db, $constant . "_SMALL", $imgThumbSmall, 'chaine', 0, '', $this->conf->entity);
                    } else {
                        dol_syslog($imgThumbSmall);
                    }

                    // Create mini thumbs. Used on menu or for setup page for example
                    $imgThumbMini = vignette($this->conf->mycompany->dir_output . '/logos/' . $_GET["file"], $maxwidthmini, $maxheightmini, '_mini', $quality);
                    if (DolibarrImages::image_format_supported($imgThumbSmall) >= 0 && preg_match('/([^\\/:]+)$/i', $imgThumbMini, $reg)) {
                        $imgThumbMini = $reg[1]; // Save only basename
                        DolibarrAdmin::dolibarr_set_const($this->db, $constant . "_MINI", $imgThumbMini, 'chaine', 0, '', $this->conf->entity);
                    } else {
                        dol_syslog($imgThumbMini);
                    }

                    header("Location: " . $_SERVER["PHP_SELF"]);
                    exit;
                } else {
                    $this->error++;
                    $this->langs->load("errors");
                    DolibarrFunctions::setEventMessages($this->langs->trans("ErrorBadImageFormat"), null, 'errors');
                    dol_syslog($this->langs->transnoentities("ErrorBadImageFormat"), LOG_INFO);
                }
            } else {
                $this->error++;
                $this->langs->load("errors");
                DolibarrFunctions::setEventMessages($this->langs->trans("ErrorFileDoesNotExists", DolibarrFunctions::GETPOST("file")), null, 'errors');
                dol_syslog($this->langs->transnoentities("ErrorFileDoesNotExists", DolibarrFunctions::GETPOST("file")), LOG_WARNING);
            }
        }

        if ($this->action == 'removelogo' || $this->action == 'removelogosquarred') {
            $constant = "MAIN_INFO_SOCIETE_LOGO";
            if ($this->action == 'removelogosquarred') {
                $constant = "MAIN_INFO_SOCIETE_LOGO_SQUARRED";
            }

            require_once DOL_DOCUMENT_ROOT . '/core/lib/files.lib.php';

            $logofilename = $this->mysoc->logo;
            $logofilenamebis = $this->mysoc->logo_squarred;
            if ($this->action == 'removelogosquarred') {
                $logofilename = $this->mysoc->logo_squarred;
                $logofilenamebis = $this->mysoc->logo;
            }

            $logofile = $this->conf->mycompany->dir_output . '/logos/' . $logofilename;
            if ($logofilename != '' && $logofilename != $logofilenamebis) {
                dol_delete_file($logofile);
            }
            DolibarrAdmin::dolibarr_del_const($this->db, $constant, $this->conf->entity);
            if ($this->action == 'removelogosquarred') {
                $this->mysoc->logo_squarred = '';
            } else {
                $this->mysoc->logo = '';
            }

            $logofilename = $this->mysoc->logo_small;
            $logofilenamebis = $this->mysoc->logo_squarred_small;
            if ($this->action == 'removelogosquarred') {
                $logofilename = $this->mysoc->logo_squarred_small;
                $logofilenamebis = $this->mysoc->logo_small;
            }

            $logosmallfile = $this->conf->mycompany->dir_output . '/logos/thumbs/' . $logofilename;
            if ($logofilename != '' && $logofilename != $logofilenamebis) {
                dol_delete_file($logosmallfile);
            }
            DolibarrAdmin::dolibarr_del_const($this->db, $constant . "_SMALL", $this->conf->entity);
            if ($this->action == 'removelogosquarred') {
                $this->mysoc->logo_squarred_small = '';
            } else {
                $this->mysoc->logo_small = '';
            }

            $logofilename = $this->mysoc->logo_mini;
            $logofilenamebis = $this->mysoc->logo_squarred_mini;
            if ($this->action == 'removelogosquarred') {
                $logofilename = $this->mysoc->logo_squarred_mini;
                $logofilenamebis = $this->mysoc->logo_mini;
            }

            $logominifile = $this->conf->mycompany->dir_output . '/logos/thumbs/' . $logofilename;
            if ($logofilename != '' && $logofilename != $logofilenamebis) {
                dol_delete_file($logominifile);
            }
            DolibarrAdmin::dolibarr_del_const($this->db, $constant . "_MINI", $this->conf->entity);
            if ($this->action == 'removelogosquarred') {
                $this->mysoc->logo_squarred_mini = '';
            } else {
                $this->mysoc->logo_mini = '';
            }
        }
    }

    public function setView(): View
    {
        $view = new CompanyView($this);
        // $view->setConf($this->conf);
        return $view;
    }
}
