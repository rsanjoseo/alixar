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

// Descend to the htdocs folder
chdir('../../..');
define('BASE_FOLDER', getcwd());

/**
 *    \file       htdocs/admin/company.php
 *    \ingroup    company
 *    \brief      Setup page to configure company/foundation
 */

/**
 * TODO: Temporarily defined constants
 */
const MAIN_HIDE_TOP_MENU = 0;
const MAIN_HIDE_LEFT_MENU = 0;
const NOREQUIREDB = 0;
const NOREQUIRESOC = 0;

require 'main.php';

require_once DOL_DOCUMENT_ROOT . '/core/lib/admin.lib.php';
require_once DOL_DOCUMENT_ROOT . '/core/lib/company.lib.php';
require_once DOL_DOCUMENT_ROOT . '/core/lib/date.lib.php';
require_once DOL_DOCUMENT_ROOT . '/core/lib/images.lib.php';
require_once DOL_DOCUMENT_ROOT . '/core/lib/files.lib.php';
require_once DOL_DOCUMENT_ROOT . '/core/lib/functions2.lib.php';
require_once DOL_DOCUMENT_ROOT . '/core/class/html.formother.class.php';
require_once DOL_DOCUMENT_ROOT . '/core/class/html.formcompany.class.php';

$action = GETPOST('action', 'aZ09');
$contextpage = GETPOST('contextpage', 'aZ') ? GETPOST('contextpage', 'aZ') : 'admincompany'; // To manage different context of search

// Load translation files required by the page
$langs->loadLangs(['admin', 'companies', 'bills']);

if (!$user->admin) {
    accessforbidden();
}

$error = 0;

// Initialize technical object to manage hooks of page. Note that conf->hooks_modules contains array of hook context
$hookmanager->initHooks(['admincompany', 'globaladmin']);

/*
 * Actions
 */

$parameters = [];
$reshook = $hookmanager->executeHooks('doActions', $parameters, $object, $action); // Note that $action and $object may have been modified by some hooks
if ($reshook < 0) {
    setEventMessages($hookmanager->error, $hookmanager->errors, 'errors');
}

if (($action == 'update' && !GETPOST("cancel", 'alpha'))
    || ($action == 'updateedit')) {
    $tmparray = getCountry(GETPOST('country_id', 'int'), 'all', $db, $langs, 0);
    if (!empty($tmparray['id'])) {
        $mysoc->country_id = $tmparray['id'];
        $mysoc->country_code = $tmparray['code'];
        $mysoc->country_label = $tmparray['label'];

        $s = $mysoc->country_id . ':' . $mysoc->country_code . ':' . $mysoc->country_label;
        dolibarr_set_const($db, "MAIN_INFO_SOCIETE_COUNTRY", $s, 'chaine', 0, '', $conf->entity);

        activateModulesRequiredByCountry($mysoc->country_code);
    }

    $tmparray = getState(GETPOST('state_id', 'int'), 'all', $db, $langs, 0);
    if (!empty($tmparray['id'])) {
        $mysoc->state_id = $tmparray['id'];
        $mysoc->state_code = $tmparray['code'];
        $mysoc->state_label = $tmparray['label'];

        $s = $mysoc->state_id . ':' . $mysoc->state_code . ':' . $mysoc->state_label;
        dolibarr_set_const($db, "MAIN_INFO_SOCIETE_STATE", $s, 'chaine', 0, '', $conf->entity);
    } else {
        dolibarr_del_const($db, "MAIN_INFO_SOCIETE_STATE", $conf->entity);
    }

    $db->begin();

    dolibarr_set_const($db, "MAIN_INFO_SOCIETE_NOM", GETPOST("nom", 'nohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_SOCIETE_ADDRESS", GETPOST("MAIN_INFO_SOCIETE_ADDRESS", 'nohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_SOCIETE_TOWN", GETPOST("MAIN_INFO_SOCIETE_TOWN", 'nohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_SOCIETE_ZIP", GETPOST("MAIN_INFO_SOCIETE_ZIP", 'alphanohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_SOCIETE_REGION", GETPOST("region_code", 'alphanohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_MONNAIE", GETPOST("currency", 'aZ09'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_SOCIETE_TEL", GETPOST("tel", 'alphanohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_SOCIETE_FAX", GETPOST("fax", 'alphanohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_SOCIETE_MAIL", GETPOST("mail", 'alphanohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_SOCIETE_WEB", GETPOST("web", 'alphanohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_SOCIETE_NOTE", GETPOST("note", 'restricthtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_SOCIETE_GENCOD", GETPOST("barcode", 'alphanohtml'), 'chaine', 0, '', $conf->entity);

    $dirforimage = $conf->mycompany->dir_output . '/logos/';

    $arrayofimages = ['logo', 'logo_squarred'];

    foreach ($arrayofimages as $varforimage) {
        if ($_FILES[$varforimage]["name"] && !preg_match('/(\.jpeg|\.jpg|\.png)$/i', $_FILES[$varforimage]["name"])) {    // Logo can be used on a lot of different places. Only jpg and png can be supported.
            $langs->load("errors");
            setEventMessages($langs->trans("ErrorBadImageFormat"), null, 'errors');
            break;
        }

        if ($_FILES[$varforimage]["tmp_name"]) {
            $reg = [];
            if (preg_match('/([^\\/:]+)$/i', $_FILES[$varforimage]["name"], $reg)) {
                $original_file = $reg[1];

                $isimage = image_format_supported($original_file);
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

                        dolibarr_set_const($db, $constant, $original_file, 'chaine', 0, '', $conf->entity);

                        // Create thumbs of logo (Note that PDF use original file and not thumbs)
                        if ($isimage > 0) {
                            // Create thumbs
                            //$object->addThumbs($newfile);    // We can't use addThumbs here yet because we need name of generated thumbs to add them into constants. TODO Check if need such constants. We should be able to retrieve value with get...

                            // Create small thumb, Used on logon for example
                            $imgThumbSmall = vignette($dirforimage . $original_file, $maxwidthsmall, $maxheightsmall, '_small', $quality);
                            if (image_format_supported($imgThumbSmall) >= 0 && preg_match('/([^\\/:]+)$/i', $imgThumbSmall, $reg)) {
                                $imgThumbSmall = $reg[1]; // Save only basename
                                dolibarr_set_const($db, $constant . "_SMALL", $imgThumbSmall, 'chaine', 0, '', $conf->entity);
                            } else {
                                dol_syslog($imgThumbSmall);
                            }

                            // Create mini thumb, Used on menu or for setup page for example
                            $imgThumbMini = vignette($dirforimage . $original_file, $maxwidthmini, $maxheightmini, '_mini', $quality);
                            if (image_format_supported($imgThumbMini) >= 0 && preg_match('/([^\\/:]+)$/i', $imgThumbMini, $reg)) {
                                $imgThumbMini = $reg[1]; // Save only basename
                                dolibarr_set_const($db, $constant . "_MINI", $imgThumbMini, 'chaine', 0, '', $conf->entity);
                            } else {
                                dol_syslog($imgThumbMini);
                            }
                        } else {
                            dol_syslog("ErrorImageFormatNotSupported", LOG_WARNING);
                        }
                    } elseif (preg_match('/^ErrorFileIsInfectedWithAVirus/', $result)) {
                        $error++;
                        $langs->load("errors");
                        $tmparray = explode(':', $result);
                        setEventMessages($langs->trans('ErrorFileIsInfectedWithAVirus', $tmparray[1]), null, 'errors');
                    } else {
                        $error++;
                        setEventMessages($langs->trans("ErrorFailedToSaveFile"), null, 'errors');
                    }
                } else {
                    $error++;
                    $langs->load("errors");
                    setEventMessages($langs->trans("ErrorBadImageFormat"), null, 'errors');
                }
            }
        }
    }

    dolibarr_set_const($db, "MAIN_INFO_SOCIETE_MANAGERS", GETPOST("MAIN_INFO_SOCIETE_MANAGERS", 'nohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_GDPR", GETPOST("MAIN_INFO_GDPR", 'nohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_CAPITAL", GETPOST("capital", 'nohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_SOCIETE_FORME_JURIDIQUE", GETPOST("forme_juridique_code", 'nohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_SIREN", GETPOST("siren", 'nohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_SIRET", GETPOST("siret", 'nohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_APE", GETPOST("ape", 'nohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_RCS", GETPOST("rcs", 'nohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_PROFID5", GETPOST("MAIN_INFO_PROFID5", 'nohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_PROFID6", GETPOST("MAIN_INFO_PROFID6", 'nohtml'), 'chaine', 0, '', $conf->entity);

    dolibarr_set_const($db, "MAIN_INFO_TVAINTRA", GETPOST("tva", 'nohtml'), 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "MAIN_INFO_SOCIETE_OBJECT", GETPOST("object", 'nohtml'), 'chaine', 0, '', $conf->entity);

    dolibarr_set_const($db, "SOCIETE_FISCAL_MONTH_START", GETPOST("SOCIETE_FISCAL_MONTH_START", 'int'), 'chaine', 0, '', $conf->entity);

    // Sale tax options
    $usevat = GETPOST("optiontva", 'aZ09');
    $uselocaltax1 = GETPOST("optionlocaltax1", 'aZ09');
    $uselocaltax2 = GETPOST("optionlocaltax2", 'aZ09');
    if ($uselocaltax1 == 'localtax1on' && !$usevat) {
        setEventMessages($langs->trans("IfYouUseASecondTaxYouMustSetYouUseTheMainTax"), null, 'errors');
        $error++;
    }
    if ($uselocaltax2 == 'localtax2on' && !$usevat) {
        setEventMessages($langs->trans("IfYouUseAThirdTaxYouMustSetYouUseTheMainTax"), null, 'errors');
        $error++;
    }

    dolibarr_set_const($db, "FACTURE_TVAOPTION", $usevat, 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "FACTURE_LOCAL_TAX1_OPTION", $uselocaltax1, 'chaine', 0, '', $conf->entity);
    dolibarr_set_const($db, "FACTURE_LOCAL_TAX2_OPTION", $uselocaltax2, 'chaine', 0, '', $conf->entity);

    if (GETPOST("optionlocaltax1") == "localtax1on") {
        if (!GETPOSTISSET('lt1')) {
            dolibarr_set_const($db, "MAIN_INFO_VALUE_LOCALTAX1", 0, 'chaine', 0, '', $conf->entity);
        } else {
            dolibarr_set_const($db, "MAIN_INFO_VALUE_LOCALTAX1", GETPOST('lt1', 'aZ09'), 'chaine', 0, '', $conf->entity);
        }
        dolibarr_set_const($db, "MAIN_INFO_LOCALTAX_CALC1", GETPOST("clt1", 'aZ09'), 'chaine', 0, '', $conf->entity);
    }
    if (GETPOST("optionlocaltax2") == "localtax2on") {
        if (!GETPOSTISSET('lt2')) {
            dolibarr_set_const($db, "MAIN_INFO_VALUE_LOCALTAX2", 0, 'chaine', 0, '', $conf->entity);
        } else {
            dolibarr_set_const($db, "MAIN_INFO_VALUE_LOCALTAX2", GETPOST('lt2', 'aZ09'), 'chaine', 0, '', $conf->entity);
        }
        dolibarr_set_const($db, "MAIN_INFO_LOCALTAX_CALC2", GETPOST("clt2", 'aZ09'), 'chaine', 0, '', $conf->entity);
    }

    if (!$error) {
        if (GETPOST('save')) {    // To avoid to show message when we juste switch the country that resubmit the form.
            setEventMessages($langs->trans("SetupSaved"), null, 'mesgs');
        }
        $db->commit();
    } else {
        $db->rollback();
    }

    if ($action != 'updateedit' && !$error) {
        header("Location: " . $_SERVER["PHP_SELF"]);
        exit;
    }
}

if ($action == 'addthumb' || $action == 'addthumbsquarred') {  // Regenerate thumbs
    if (file_exists($conf->mycompany->dir_output . '/logos/' . $_GET["file"])) {
        $isimage = image_format_supported($_GET["file"]);

        // Create thumbs of logo
        if ($isimage > 0) {
            $constant = "MAIN_INFO_SOCIETE_LOGO";
            if ($action == 'addthumbsquarred') {
                $constant = "MAIN_INFO_SOCIETE_LOGO_SQUARRED";
            }

            $reg = [];

            // Create thumbs
            //$object->addThumbs($newfile);    // We can't use addThumbs here yet because we need name of generated thumbs to add them into constants. TODO Check if need such constants. We should be able to retrieve value with get...

            // Create small thumb. Used on logon for example
            $imgThumbSmall = vignette($conf->mycompany->dir_output . '/logos/' . $_GET["file"], $maxwidthsmall, $maxheightsmall, '_small', $quality);
            if (image_format_supported($imgThumbSmall) >= 0 && preg_match('/([^\\/:]+)$/i', $imgThumbSmall, $reg)) {
                $imgThumbSmall = $reg[1]; // Save only basename
                dolibarr_set_const($db, $constant . "_SMALL", $imgThumbSmall, 'chaine', 0, '', $conf->entity);
            } else {
                dol_syslog($imgThumbSmall);
            }

            // Create mini thumbs. Used on menu or for setup page for example
            $imgThumbMini = vignette($conf->mycompany->dir_output . '/logos/' . $_GET["file"], $maxwidthmini, $maxheightmini, '_mini', $quality);
            if (image_format_supported($imgThumbSmall) >= 0 && preg_match('/([^\\/:]+)$/i', $imgThumbMini, $reg)) {
                $imgThumbMini = $reg[1]; // Save only basename
                dolibarr_set_const($db, $constant . "_MINI", $imgThumbMini, 'chaine', 0, '', $conf->entity);
            } else {
                dol_syslog($imgThumbMini);
            }

            header("Location: " . $_SERVER["PHP_SELF"]);
            exit;
        } else {
            $error++;
            $langs->load("errors");
            setEventMessages($langs->trans("ErrorBadImageFormat"), null, 'errors');
            dol_syslog($langs->transnoentities("ErrorBadImageFormat"), LOG_INFO);
        }
    } else {
        $error++;
        $langs->load("errors");
        setEventMessages($langs->trans("ErrorFileDoesNotExists", GETPOST("file")), null, 'errors');
        dol_syslog($langs->transnoentities("ErrorFileDoesNotExists", GETPOST("file")), LOG_WARNING);
    }
}

if ($action == 'removelogo' || $action == 'removelogosquarred') {
    $constant = "MAIN_INFO_SOCIETE_LOGO";
    if ($action == 'removelogosquarred') {
        $constant = "MAIN_INFO_SOCIETE_LOGO_SQUARRED";
    }

    require_once DOL_DOCUMENT_ROOT . '/core/lib/files.lib.php';

    $logofilename = $mysoc->logo;
    $logofilenamebis = $mysoc->logo_squarred;
    if ($action == 'removelogosquarred') {
        $logofilename = $mysoc->logo_squarred;
        $logofilenamebis = $mysoc->logo;
    }

    $logofile = $conf->mycompany->dir_output . '/logos/' . $logofilename;
    if ($logofilename != '' && $logofilename != $logofilenamebis) {
        dol_delete_file($logofile);
    }
    dolibarr_del_const($db, $constant, $conf->entity);
    if ($action == 'removelogosquarred') {
        $mysoc->logo_squarred = '';
    } else {
        $mysoc->logo = '';
    }

    $logofilename = $mysoc->logo_small;
    $logofilenamebis = $mysoc->logo_squarred_small;
    if ($action == 'removelogosquarred') {
        $logofilename = $mysoc->logo_squarred_small;
        $logofilenamebis = $mysoc->logo_small;
    }

    $logosmallfile = $conf->mycompany->dir_output . '/logos/thumbs/' . $logofilename;
    if ($logofilename != '' && $logofilename != $logofilenamebis) {
        dol_delete_file($logosmallfile);
    }
    dolibarr_del_const($db, $constant . "_SMALL", $conf->entity);
    if ($action == 'removelogosquarred') {
        $mysoc->logo_squarred_small = '';
    } else {
        $mysoc->logo_small = '';
    }

    $logofilename = $mysoc->logo_mini;
    $logofilenamebis = $mysoc->logo_squarred_mini;
    if ($action == 'removelogosquarred') {
        $logofilename = $mysoc->logo_squarred_mini;
        $logofilenamebis = $mysoc->logo_mini;
    }

    $logominifile = $conf->mycompany->dir_output . '/logos/thumbs/' . $logofilename;
    if ($logofilename != '' && $logofilename != $logofilenamebis) {
        dol_delete_file($logominifile);
    }
    dolibarr_del_const($db, $constant . "_MINI", $conf->entity);
    if ($action == 'removelogosquarred') {
        $mysoc->logo_squarred_mini = '';
    } else {
        $mysoc->logo_mini = '';
    }
}

require_once DOL_DOCUMENT_ROOT . '/Modules/Admin/Views/company.php';
