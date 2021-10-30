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

namespace Alxarafe\Modules\Admin\Controllers;

use Alxarafe\Core\Base\View;
use Alxarafe\Dolibarr\Base\DolibarrController;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;
use Alxarafe\Dolibarr\Libraries\DolibarrSecurity;
use Alxarafe\Modules\Admin\Views\DefaultValuesView;

/**
 * Class Defaultvalues
 *
 * Invoke using: https://localhost80/alixar/htdocs/?module=admin&controller=defaultvalues
 *
 * @package Alxarafe\Modules\Admin\Controllers
 */
class Defaultvalues extends DolibarrController
{
    public function __construct()
    {
        parent::__construct();

        if (!$this->user->admin) {
            DolibarrSecurity::accessforbidden();
        }

        $id = DolibarrFunctions::GETPOST('rowid', 'int');
        $action = DolibarrFunctions::GETPOST('action', 'aZ09');
        $optioncss = DolibarrFunctions::GETPOST('optionscss', 'alphanohtml');

        $mode = DolibarrFunctions::GETPOST('mode', 'aZ09') ? DolibarrFunctions::GETPOST('mode', 'aZ09') : 'createform'; // 'createform', 'filters', 'sortorder', 'focus'

        $limit = DolibarrFunctions::GETPOST('limit', 'int') ? DolibarrFunctions::GETPOST('limit', 'int') : $conf->liste_limit;
        $sortfield = DolibarrFunctions::GETPOST("sortfield", 'alpha');
        $sortorder = DolibarrFunctions::GETPOST("sortorder", 'alpha');
        $page = DolibarrFunctions::GETPOSTISSET('pageplusone') ? (DolibarrFunctions::GETPOST('pageplusone') - 1) : DolibarrFunctions::GETPOST("page", 'int');
        if (empty($page) || $page == -1) {
            $page = 0;
        }     // If $page is not defined, or '' or -1
        $offset = $limit * $page;
        $pageprev = $page - 1;
        $pagenext = $page + 1;
        if (!$sortfield) {
            $sortfield = 'page,param';
        }
        if (!$sortorder) {
            $sortorder = 'ASC';
        }

        $defaulturl = DolibarrFunctions::GETPOST('defaulturl', 'alphanohtml');
        $defaultkey = DolibarrFunctions::GETPOST('defaultkey', 'alphanohtml');
        $defaultvalue = DolibarrFunctions::GETPOST('defaultvalue', 'none');

        $defaulturl = preg_replace('/^\//', '', $defaulturl);

        $urlpage = DolibarrFunctions::GETPOST('urlpage', 'alphanohtml');
        $key = DolibarrFunctions::GETPOST('key', 'alphanohtml');
        $value = DolibarrFunctions::GETPOST('value', 'restricthtml');

        // Initialize technical object to manage hooks of page. Note that conf->hooks_modules contains array of hook context
        $this->hookmanager->initHooks(['admindefaultvalues', 'globaladmin']);

        dump($this->user);
        die('X');

        $object = new DefaultValues();
    }

    public function getDolibarrActions(): bool
    {
        if (isset($this->action)) {
            dump('Action loaded in preLoad() in DefaultValues');
            return false;
        }

        $this->action = DolibarrFunctions::GETPOST('action', 'aZ09');

        if (DolibarrFunctions::GETPOST('cancel', 'alpha')) {
            $action = 'list';
            $massaction = '';
        }
        if (!DolibarrFunctions::GETPOST('confirmmassaction', 'alpha') && !empty($massaction) && $massaction != 'presend' && $massaction != 'confirm_presend') {
            $massaction = '';
        }

        $parameters = [];
        $reshook = $this->hookmanager->executeHooks('doActions', $parameters, $object, $action); // Note that $action and $object may have been modified by some hooks
        if ($reshook < 0) {
            setEventMessages($this->hookmanager->error, $this->hookmanager->errors, 'errors');
        }

        include DOL_DOCUMENT_ROOT . '/core/actions_changeselectedfields.inc.php';

        // Purge search criteria
        if (DolibarrFunctions::GETPOST('button_removefilter_x', 'alpha') || DolibarrFunctions::GETPOST('button_removefilter.x', 'alpha') || DolibarrFunctions::GETPOST('button_removefilter', 'alpha')) { // All tests are required to be compatible with all browsers
            $defaulturl = '';
            $defaultkey = '';
            $defaultvalue = '';
            $toselect = '';
            $search_array_options = [];
        }

        if ($action == 'setMAIN_ENABLE_DEFAULT_VALUES') {
            if (DolibarrFunctions::GETPOST('value')) {
                dolibarr_set_const($db, 'MAIN_ENABLE_DEFAULT_VALUES', 1, 'chaine', 0, '', $conf->entity);
            } else {
                dolibarr_set_const($db, 'MAIN_ENABLE_DEFAULT_VALUES', 0, 'chaine', 0, '', $conf->entity);
            }
        }

        if (($action == 'add' || (DolibarrFunctions::GETPOST('add') && $action != 'update')) || DolibarrFunctions::GETPOST('actionmodify')) {
            $error = 0;

            if (($action == 'add' || (DolibarrFunctions::GETPOST('add') && $action != 'update'))) {
                if (empty($defaulturl)) {
                    setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("Url")), null, 'errors');
                    $error++;
                }
                if (empty($defaultkey)) {
                    setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("Field")), null, 'errors');
                    $error++;
                }
            }
            if (DolibarrFunctions::GETPOST('actionmodify')) {
                if (empty($urlpage)) {
                    setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("Url")), null, 'errors');
                    $error++;
                }
                if (empty($key)) {
                    setEventMessages($langs->trans("ErrorFieldRequired", $langs->transnoentitiesnoconv("Field")), null, 'errors');
                    $error++;
                }
            }

            if (!$error) {
                if ($action == 'add' || (DolibarrFunctions::GETPOST('add') && $action != 'update')) {
                    $object->type = $mode;
                    $object->user_id = 0;
                    $object->page = $defaulturl;
                    $object->param = $defaultkey;
                    $object->value = $defaultvalue;
                    $object->entity = $conf->entity;
                    $result = $object->create($this->user);
                    if ($result < 0) {
                        $action = '';
                        setEventMessages($object->error, $object->errors, 'errors');
                    } else {
                        setEventMessages($langs->trans("RecordSaved"), null, 'mesgs');
                        $action = "";
                        $defaulturl = '';
                        $defaultkey = '';
                        $defaultvalue = '';
                    }
                }
                if (DolibarrFunctions::GETPOST('actionmodify')) {
                    $object->id = $id;
                    $object->type = $mode;
                    $object->page = $urlpage;
                    $object->param = $key;
                    $object->value = $value;
                    $object->entity = $conf->entity;
                    $result = $object->update($this->user);
                    if ($result < 0) {
                        $action = '';
                        setEventMessages($object->error, $object->errors, 'errors');
                    } else {
                        setEventMessages($langs->trans("RecordSaved"), null, 'mesgs');
                        $action = "";
                        $defaulturl = '';
                        $defaultkey = '';
                        $defaultvalue = '';
                    }
                }
            }
        }

        return true;
    }

    public function doAction(): bool
    {
        return parent::doAction(); // TODO: Change the autogenerated stub
    }

    public function setView(): View
    {
        return new DefaultValuesView($this);
    }
}
