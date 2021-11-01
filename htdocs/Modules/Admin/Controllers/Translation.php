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

namespace Alxarafe\Modules\Admin\Controllers;

use Alxarafe\Core\Base\View;
use Alxarafe\Dolibarr\Base\DolibarrListController;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;
use Alxarafe\Modules\Admin\Views\TranslationView;

class Translation extends DolibarrListController
{
    public $contextpage;
    public $langcode;
    public $transkey;
    public $transvalue;

    public function __construct()
    {
        parent::__construct();
        // Load translation files required by the page
        $this->langs->loadLangs(["companies", "products", "admin", "sms", "other", "errors"]);

        if (!$this->user->admin) {
            accessforbidden();
        }
    }

    function getDolibarrVars(): void
    {
        parent::getDolibarrVars();

        if (!$this->sortfield) {
            $this->sortfield = 'lang,transkey';
        }
        if (!$this->sortorder) {
            $this->sortorder = 'ASC';
        }

        $this->contextpage = DolibarrFunctions::GETPOST('contextpage', 'aZ09');

        $this->langcode = DolibarrFunctions::GETPOST('langcode', 'alphanohtml');
        $this->transkey = DolibarrFunctions::GETPOST('transkey', 'alphanohtml');
        $this->transvalue = DolibarrFunctions::GETPOST('transvalue', 'restricthtml');

        // Initialize technical object to manage hooks of page. Note that conf->hooks_modules contains array of hook context
        $this->hookmanager->initHooks(['admintranslation', 'globaladmin']);
    }

    function getDolibarrActions(): void
    {
        parent::getDolibarrActions();

        // include DOL_DOCUMENT_ROOT . '/core/actions_changeselectedfields.inc.php';

        // Purge search criteria
        if (DolibarrFunctions::GETPOST('button_removefilter_x', 'alpha') || DolibarrFunctions::GETPOST('button_removefilter.x', 'alpha') || DolibarrFunctions::GETPOST('button_removefilter', 'alpha')) { // All tests are required to be compatible with all browsers
            $transkey = '';
            $transvalue = '';
            $toselect = '';
            $search_array_options = [];
        }

        if ($this->action == 'setMAIN_ENABLE_OVERWRITE_TRANSLATION') {
            if (DolibarrFunctions::GETPOST('value')) {
                dolibarr_set_const($this->db, 'MAIN_ENABLE_OVERWRITE_TRANSLATION', 1, 'chaine', 0, '', $conf->entity);
            } else {
                dolibarr_set_const($this->db, 'MAIN_ENABLE_OVERWRITE_TRANSLATION', 0, 'chaine', 0, '', $conf->entity);
            }
        }

        if ($this->action == 'update') {
            if ($transkey == '') {
                setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("Key")), null, 'errors');
                $error++;
            }
            if ($transvalue == '') {
                setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("NewTranslationStringToShow")), null, 'errors');
                $error++;
            }
            if (!$error) {
                $this->db->begin();

                $sql = "UPDATE " . MAIN_DB_PREFIX . "overwrite_trans set transkey = '" . $this->db->escape($transkey) . "', transvalue = '" . $this->db->escape($transvalue) . "' WHERE rowid = " . ((int) GETPOST('rowid', 'int'));
                $result = $this->db->query($sql);
                if ($result > 0) {
                    $this->db->commit();
                    setEventMessages($langs->trans("RecordSaved"), null, 'mesgs');
                    $this->action = "";
                    $transkey = "";
                    $transvalue = "";
                } else {
                    $this->db->rollback();
                    if ($this->db->lasterrno() == 'DB_ERROR_RECORD_ALREADY_EXISTS') {
                        setEventMessages($langs->trans("WarningAnEntryAlreadyExistForTransKey"), null, 'warnings');
                    } else {
                        setEventMessages($this->db->lasterror(), null, 'errors');
                    }
                    $this->action = '';
                }
            }
        }

        if ($this->action == 'add') {
            $error = 0;

            if (empty($langcode)) {
                setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("Language")), null, 'errors');
                $error++;
            }
            if ($transkey == '') {
                setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("Key")), null, 'errors');
                $error++;
            }
            if ($transvalue == '') {
                setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("NewTranslationStringToShow")), null, 'errors');
                $error++;
            }
            if (!$error) {
                $this->db->begin();

                $sql = "INSERT INTO " . MAIN_DB_PREFIX . "overwrite_trans(lang, transkey, transvalue, entity) VALUES ('" . $this->db->escape($langcode) . "','" . $this->db->escape($transkey) . "','" . $this->db->escape($transvalue) . "', " . ((int) $conf->entity) . ")";
                $result = $this->db->query($sql);
                if ($result > 0) {
                    $this->db->commit();
                    setEventMessages($langs->trans("RecordSaved"), null, 'mesgs');
                    $this->action = "";
                    $transkey = "";
                    $transvalue = "";
                } else {
                    $this->db->rollback();
                    if ($this->db->lasterrno() == 'DB_ERROR_RECORD_ALREADY_EXISTS') {
                        setEventMessages($langs->trans("WarningAnEntryAlreadyExistForTransKey"), null, 'warnings');
                    } else {
                        setEventMessages($this->db->lasterror(), null, 'errors');
                    }
                    $this->action = '';
                }
            }
        }

        // Delete line from delete picto
        if ($this->action == 'delete') {
            $sql = "DELETE FROM " . MAIN_DB_PREFIX . "overwrite_trans WHERE rowid = " . ((int) $id);
            $result = $this->db->query($sql);
            if ($result >= 0) {
                setEventMessages($langs->trans("RecordDeleted"), null, 'mesgs');
            } else {
                dol_print_error($this->db);
            }
        }
    }

    public function setView(): View
    {
        return new TranslationView($this);
    }
}