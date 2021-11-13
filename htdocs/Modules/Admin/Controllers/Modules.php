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

namespace Alxarafe\Modules\Admin\Controllers;

use Alxarafe\Core\Base\View;
use Alxarafe\Dolibarr\Base\DolibarrController;
use Alxarafe\Dolibarr\Libraries\DolibarrAdmin;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;
use Alxarafe\Dolibarr\Libraries\DolibarrSecurity;
use Alxarafe\Modules\Admin\Views\ModulesView;

/**
 * Class Modules
 *
 * Page to activate/disable all modules
 *
 * @package Alxarafe\Modules\Admin\Controllers
 */
class Modules extends DolibarrController
{
    public $mode;
    public $value;
    public $page_y;
    public $search_keyword;
    public $search_status;
    public $search_nature;
    public $search_version;
    public $options;
    public $dolistore;
    public $familyinfo;
    public $param;
    public $dirins;
    public $urldolibarrmodules;

    public function __construct()
    {
        parent::__construct();

        /**
         *  \file       htdocs/admin/modules.php
         *  \brief
         */

        if (!defined('CSRFCHECK_WITH_TOKEN') && (empty($_GET['action']) || $_GET['action'] != 'reset')) {    // We force security except to disable modules so we can do it if problem of a module
            define('CSRFCHECK_WITH_TOKEN', '1'); // Force use of CSRF protection with tokens even for GET
        }

        /**
         * TODO: Temporarily defined constants
         */
        // const MAIN_HIDE_TOP_MENU = 0;
        // const MAIN_HIDE_LEFT_MENU = 0;
        // const NOREQUIREHTML = 0;

        // require_once DOL_DOCUMENT_ROOT . '/core/lib/admin.lib.php';
        // require_once DOL_DOCUMENT_ROOT . '/core/lib/files.lib.php';
        // require_once DOL_DOCUMENT_ROOT . '/core/lib/geturl.lib.php';
        // require_once DOL_DOCUMENT_ROOT . '/core/lib/functions2.lib.php';
        // require_once DOL_DOCUMENT_ROOT . '/Modules/Admin/dolistore/class/dolistore.class.php';

        // Load translation files required by the page
        $this->langs->loadLangs(["errors", "admin", "modulebuilder"]);

        if (!$this->user->admin) {
            DolibarrSecurity::accessforbidden();
        }
    }

    function getDolibarrVars(): void
    {
        $this->mode = DolibarrFunctions::GETPOSTISSET('mode') ? DolibarrFunctions::GETPOST('mode', 'alpha') : (empty($this->conf->global->MAIN_MODULE_SETUP_ON_LIST_BY_DEFAULT) ? 'commonkanban' : 'common');
        if (empty($this->mode)) {
            $this->mode = 'common';
        }
        $this->action = DolibarrFunctions::GETPOST('action', 'aZ09');
        //var_dump($_POST);exit;
        $this->valconsturctorue = DolibarrFunctions::GETPOST('value', 'alpha');
        $this->page_y = DolibarrFunctions::GETPOST('page_y', 'int');
        $this->search_keyword = DolibarrFunctions::GETPOST('search_keyword', 'alpha');
        $this->search_status = DolibarrFunctions::GETPOST('search_status', 'alpha');
        $this->search_nature = DolibarrFunctions::GETPOST('search_nature', 'alpha');
        $this->search_version = DolibarrFunctions::GETPOST('search_version', 'alpha');

        // For dolistore search
        $this->options = [];
        $this->options['per_page'] = 20;
        $this->options['categorie'] = ((DolibarrFunctions::GETPOST('categorie', 'int') ? DolibarrFunctions::GETPOST('categorie', 'int') : 0) + 0);
        $this->options['start'] = ((DolibarrFunctions::GETPOST('start', 'int') ? DolibarrFunctions::GETPOST('start', 'int') : 0) + 0);
        $this->options['end'] = ((DolibarrFunctions::GETPOST('end', 'int') ? DolibarrFunctions::GETPOST('end', 'int') : 0) + 0);
        $this->options['search'] = DolibarrFunctions::GETPOST('search_keyword', 'alpha');

        // TODO: ¿Qué hacer con Dolistore?
        // $this->dolistore = new Dolistore(false);

        $this->familyinfo = [
            'hr' => ['position' => '001', 'label' => $this->langs->trans("ModuleFamilyHr")],
            'crm' => ['position' => '006', 'label' => $this->langs->trans("ModuleFamilyCrm")],
            'srm' => ['position' => '007', 'label' => $this->langs->trans("ModuleFamilySrm")],
            'financial' => ['position' => '009', 'label' => $this->langs->trans("ModuleFamilyFinancial")],
            'products' => ['position' => '012', 'label' => $this->langs->trans("ModuleFamilyProducts")],
            'projects' => ['position' => '015', 'label' => $this->langs->trans("ModuleFamilyProjects")],
            'ecm' => ['position' => '018', 'label' => $this->langs->trans("ModuleFamilyECM")],
            'technic' => ['position' => '021', 'label' => $this->langs->trans("ModuleFamilyTechnic")],
            'portal' => ['position' => '040', 'label' => $this->langs->trans("ModuleFamilyPortal")],
            'interface' => ['position' => '050', 'label' => $this->langs->trans("ModuleFamilyInterface")],
            'base' => ['position' => '060', 'label' => $this->langs->trans("ModuleFamilyBase")],
            'other' => ['position' => '100', 'label' => $this->langs->trans("ModuleFamilyOther")],
        ];

        $this->param = '';
        if (!DolibarrFunctions::GETPOST('buttonreset', 'alpha')) {
            if ($this->search_keyword) {
                $this->param .= '&search_keyword=' . urlencode($this->search_keyword);
            }
            if ($this->search_status && $this->search_status != '-1') {
                $this->param .= '&search_status=' . urlencode($this->search_status);
            }
            if ($this->search_nature && $this->search_nature != '-1') {
                $this->param .= '&search_nature=' . urlencode($this->search_nature);
            }
            if ($this->search_version && $this->search_version != '-1') {
                $this->param .= '&search_version=' . urlencode($this->search_version);
            }
        }

        $this->dirins = DOL_DOCUMENT_ROOT . '/custom';
        $this->urldolibarrmodules = 'https://www.dolistore.com/';

        // Initialize technical object to manage hooks of page. Note that conf->hooks_modules contains array of hook context
        $this->hookmanager->initHooks(['adminmodules', 'globaladmin']);
    }

    function getDolibarrActions(): void
    {
        /*
         * Actions
         */

        $formconfirm = '';

        $this->parameters = [];
        $reshook = $this->hookmanager->executeHooks('doActions', $this->parameters, $object, $this->action); // Note that $this->action and $object may have been modified by some hooks
        if ($reshook < 0) {
            DolibarrFunctions::setEventMessages($this->hookmanager->error, $this->hookmanager->errors, 'errors');
        }

        if (DolibarrFunctions::GETPOST('buttonreset', 'alpha')) {
            $this->search_keyword = '';
            $this->search_status = '';
            $this->search_nature = '';
            $this->search_version = '';
        }

        if ($this->action == 'install') {
            $error = 0;

            // $original_file should match format module_modulename-x.y[.z].zip
            $original_file = basename($_FILES["fileinstall"]["name"]);
            $original_file = preg_replace('/\(\d+\)\.zip$/i', '.zip', $original_file);
            $newfile = $this->conf->admin->dir_temp . '/' . $original_file . '/' . $original_file;

            if (!$original_file) {
                $this->langs->load("Error");
                DolibarrFunctions::setEventMessages($this->langs->trans("ErrorModuleFileRequired"), null, 'warnings');
                $error++;
            } else {
                if (!$error && !preg_match('/\.zip$/i', $original_file)) {
                    $this->langs->load("errors");
                    DolibarrFunctions::setEventMessages($this->langs->trans("ErrorFileMustBeADolibarrPackage", $original_file), null, 'errors');
                    $error++;
                }
                if (!$error && !preg_match('/^(module[a-zA-Z0-9]*|theme)_.*\-([0-9][0-9\.]*)\.zip$/i', $original_file)) {
                    $this->langs->load("errors");
                    DolibarrFunctions::setEventMessages($this->langs->trans("ErrorFilenameDosNotMatchDolibarrPackageRules", $original_file, 'module_*-x.y*.zip'), null, 'errors');
                    $error++;
                }
                if (empty($_FILES['fileinstall']['tmp_name'])) {
                    $this->langs->load("errors");
                    DolibarrFunctions::setEventMessages($this->langs->trans("ErrorFileNotUploaded"), null, 'errors');
                    $error++;
                }
            }

            if (!$error) {
                if ($original_file) {
                    @dol_delete_dir_recursive($this->conf->admin->dir_temp . '/' . $original_file);
                    dol_mkdir($this->conf->admin->dir_temp . '/' . $original_file);
                }

                $tmpdir = preg_replace('/\.zip$/i', '', $original_file) . '.dir';
                if ($tmpdir) {
                    @dol_delete_dir_recursive($this->conf->admin->dir_temp . '/' . $tmpdir);
                    dol_mkdir($this->conf->admin->dir_temp . '/' . $tmpdir);
                }

                $result = dol_move_uploaded_file($_FILES['fileinstall']['tmp_name'], $newfile, 1, 0, $_FILES['fileinstall']['error']);
                if ($result > 0) {
                    $result = dol_uncompress($newfile, $this->conf->admin->dir_temp . '/' . $tmpdir);

                    if (!empty($result['error'])) {
                        $this->langs->load("errors");
                        DolibarrFunctions::setEventMessages($this->langs->trans($result['error'], $original_file), null, 'errors');
                        $error++;
                    } else {
                        // Now we move the dir of the module
                        $modulename = preg_replace('/module_/', '', $original_file);
                        $modulename = preg_replace('/\-([0-9][0-9\.]*)\.zip$/i', '', $modulename);
                        // Search dir $modulename
                        $modulenamedir = $this->conf->admin->dir_temp . '/' . $tmpdir . '/' . $modulename; // Example ./mymodule

                        if (!dol_is_dir($modulenamedir)) {
                            $modulenamedir = $this->conf->admin->dir_temp . '/' . $tmpdir . '/htdocs/' . $modulename; // Example ./htdocs/mymodule
                            //var_dump($modulenamedir);
                            if (!dol_is_dir($modulenamedir)) {
                                DolibarrFunctions::setEventMessages($this->langs->trans("ErrorModuleFileSeemsToHaveAWrongFormat") . '<br>' . $this->langs->trans("ErrorModuleFileSeemsToHaveAWrongFormat2", $modulename, 'htdocs/' . $modulename), null, 'errors');
                                $error++;
                            }
                        }

                        if (!$error) {
                            // TODO Make more test
                        }

                        DolibarrFunctions::dol_syslog("Uncompress of module file is a success.");

                        $modulenamearrays = [];
                        if (dol_is_file($modulenamedir . '/metapackage.conf')) {
                            // This is a meta package
                            $metafile = file_get_contents($modulenamedir . '/metapackage.conf');
                            $modulenamearrays = explode("\n", $metafile);
                        }
                        $modulenamearrays[$modulename] = $modulename;
                        //var_dump($modulenamearrays);exit;

                        foreach ($modulenamearrays as $modulenameval) {
                            if (strpos($modulenameval, '#') === 0) {
                                continue; // Discard comments
                            }
                            if (strpos($modulenameval, '//') === 0) {
                                continue; // Discard comments
                            }
                            if (!trim($modulenameval)) {
                                continue;
                            }

                            // Now we install the module
                            if (!$error) {
                                @dol_delete_dir_recursive($this->dirins . '/' . $modulenameval); // delete the zip file
                                DolibarrFunctions::dol_syslog("We copy now directory " . $this->conf->admin->dir_temp . '/' . $tmpdir . '/htdocs/' . $modulenameval . " into target dir " . $this->dirins . '/' . $modulenameval);
                                $result = dolCopyDir($modulenamedir, $this->dirins . '/' . $modulenameval, '0444', 1);
                                if ($result <= 0) {
                                    DolibarrFunctions::dol_syslog('Failed to call dolCopyDir result=' . $result . " with param " . $modulenamedir . " and " . $this->dirins . '/' . $modulenameval, LOG_WARNING);
                                    $this->langs->load("errors");
                                    DolibarrFunctions::setEventMessages($this->langs->trans("ErrorFailToCopyDir", $modulenamedir, $this->dirins . '/' . $modulenameval), null, 'errors');
                                    $error++;
                                }
                            }
                        }
                    }
                } else {
                    DolibarrFunctions::setEventMessages($this->langs->trans("ErrorFailToRenameFile", $_FILES['fileinstall']['tmp_name'], $newfile), null, 'errors');
                    $error++;
                }
            }

            if (!$error) {
                DolibarrFunctions::setEventMessages($this->langs->trans("SetupIsReadyForUse", DOL_URL_ROOT . '/admin/modules.php?mainmenu=home', $this->langs->transnoentitiesnoconv("Home") . ' - ' . $this->langs->transnoentitiesnoconv("Setup") . ' - ' . $this->langs->transnoentitiesnoconv("Modules")), null, 'warnings');
            }
        }

        if ($this->action == 'set' && $this->user->admin) {
            $resarray = DolibarrAdmin::activateModule($this->value);
            DolibarrAdmin::dolibarr_set_const($db, "MAIN_IHM_PARAMS_REV", (int) $this->conf->global->MAIN_IHM_PARAMS_REV + 1, 'chaine', 0, '', $this->conf->entity);
            if (!empty($resarray['errors'])) {
                DolibarrFunctions::setEventMessages('', $resarray['errors'], 'errors');
            } else {
                if ($resarray['nbperms'] > 0) {
                    $tmpsql = "SELECT COUNT(rowid) as nb FROM " . MAIN_DB_PREFIX . "user WHERE admin <> 1";
                    //$resqltmp = $db->query($tmpsql);
                    $data = $db->select($tmpsql);
                    if (count($data) > 0 && $data[0]['nb'] > 1) {
                        $msg = $this->langs->trans('ModuleEnabledAdminMustCheckRights');
                        DolibarrFunctions::setEventMessages($msg, null, 'warnings');
                    } else {
                        dol_print_error($db);
                    }
                }
            }
            $goto = $_SERVER["PHP_SELF"] . "?mode=" . $this->mode . $this->param . ($this->page_y ? '&page_y=' . $this->page_y : '');
            header("Location: " . $goto);
            exit;
        } elseif ($this->action == 'reset' && $this->user->admin && DolibarrFunctions::GETPOST('confirm') == 'yes') {
            $result = DolibarrAdmin::unActivateModule($this->value);
            DolibarrAdmin::dolibarr_set_const($db, "MAIN_IHM_PARAMS_REV", (int) $this->conf->global->MAIN_IHM_PARAMS_REV + 1, 'chaine', 0, '', $this->conf->entity);
            if ($result) {
                DolibarrFunctions::setEventMessages($result, null, 'errors');
            }
            header("Location: " . $_SERVER["PHP_SELF"] . "?mode=" . $this->mode . $this->param . ($this->page_y ? '&page_y=' . $this->page_y : ''));
            exit;
        }
    }

    public function setView(): View
    {
        $view = new ModulesView($this);
        // $view->setConf($this->conf);
        return $view;
    }
}
