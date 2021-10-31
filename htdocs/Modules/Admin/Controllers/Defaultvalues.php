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

namespace Alxarafe\Modules\Admin\Controllers;

use Alxarafe\Core\Base\View;
use Alxarafe\Dolibarr\Base\DolibarrController;
use Alxarafe\Dolibarr\Classes\DefaultValuesClass;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;
use Alxarafe\Dolibarr\Libraries\DolibarrSecurity;
use Alxarafe\Modules\Admin\Views\DefaultValuesView;

/**
 * Class Defaultvalues
 *
 * Invoke using: https://localhost80/alixar/htdocs/index.php?module=admin&controller=defaultvalues
 *
 * @package Alxarafe\Modules\Admin\Controllers
 */
class Defaultvalues extends DolibarrController
{
    public $object;
    public $id;
    public $optioncss;
    public $mode;
    public $limit;
    public $sortfield;
    public $sortorder;
    public $page;
    public $offset;
    public $pageprev;
    public $pagenext;
    public $defaulturl;
    public $defaultkey;
    public $defaultvalue;
    public $urlpage;
    public $key;
    public $value;

    public function __construct()
    {
        parent::__construct();

        // Load translation files required by the page
        $this->langs->loadLangs(['companies', 'products', 'admin', 'sms', 'other', 'errors']);

        if (!$this->user->admin) {
            DolibarrSecurity::accessforbidden();
        }
    }

    public function getDolibarrVars(): void
    {
        $this->id = DolibarrFunctions::GETPOST('rowid', 'int');
        $this->action = DolibarrFunctions::GETPOST('action', 'aZ09');
        $this->optioncss = DolibarrFunctions::GETPOST('optionscss', 'alphanohtml');

        $this->mode = DolibarrFunctions::GETPOST('mode', 'aZ09') ? DolibarrFunctions::GETPOST('mode', 'aZ09') : 'createform'; // 'createform', 'filters', 'sortorder', 'focus'

        $this->limit = DolibarrFunctions::GETPOST('limit', 'int') ? DolibarrFunctions::GETPOST('limit', 'int') : $conf->liste_limit;
        $this->sortfield = DolibarrFunctions::GETPOST("sortfield", 'alpha');
        $this->sortorder = DolibarrFunctions::GETPOST("sortorder", 'alpha');
        $this->page = DolibarrFunctions::GETPOSTISSET('pageplusone') ? (DolibarrFunctions::GETPOST('pageplusone') - 1) : DolibarrFunctions::GETPOST("page", 'int');
        if (empty($this->page) || $this->page == -1) {
            $this->page = 0;
        }     // If $this->page is not defined, or '' or -1
        $this->offset = $this->limit * $this->page;
        $this->pageprev = $this->page - 1;
        $this->pagenext = $this->page + 1;
        if (!$this->sortfield) {
            $this->sortfield = 'page,param';
        }
        if (!$this->sortorder) {
            $this->sortorder = 'ASC';
        }

        $this->defaulturl = DolibarrFunctions::GETPOST('defaulturl', 'alphanohtml');
        $this->defaultkey = DolibarrFunctions::GETPOST('defaultkey', 'alphanohtml');
        $this->defaultvalue = DolibarrFunctions::GETPOST('defaultvalue', 'none');

        $this->defaulturl = preg_replace('/^\//', '', $this->defaulturl);

        $this->urlpage = DolibarrFunctions::GETPOST('urlpage', 'alphanohtml');
        $this->key = DolibarrFunctions::GETPOST('key', 'alphanohtml');
        $this->value = DolibarrFunctions::GETPOST('value', 'restricthtml');

        // Initialize technical object to manage hooks of page. Note that conf->hooks_modules contains array of hook context
        $this->hookmanager->initHooks(['admindefaultvalues', 'globaladmin']);

        $this->object = new DefaultValuesClass();
    }

    public function getDolibarrActions(): void
    {
        /*
        if (isset($this->action)) {
            dump('Action loaded in preLoad() in DefaultValues');
            return;
        }

        $this->action = DolibarrFunctions::GETPOST('action', 'aZ09');
        */

        if (DolibarrFunctions::GETPOST('cancel', 'alpha')) {
            $this->action = 'list';
            $massaction = '';
        }
        if (!DolibarrFunctions::GETPOST('confirmmassaction', 'alpha') && !empty($massaction) && $massaction != 'presend' && $massaction != 'confirm_presend') {
            $massaction = '';
        }

        $parameters = [];
        $reshook = $this->hookmanager->executeHooks('doActions', $parameters, $this->object, $this->action); // Note that $this->action and $this->object may have been modified by some hooks
        if ($reshook < 0) {
            DolibarrFunctions::setEventMessages($this->hookmanager->error, $this->hookmanager->errors, 'errors');
        }

        // include DOL_DOCUMENT_ROOT . '/core/actions_changeselectedfields.inc.php';

        // Purge search criteria
        if (DolibarrFunctions::GETPOST('button_removefilter_x', 'alpha') || DolibarrFunctions::GETPOST('button_removefilter.x', 'alpha') || DolibarrFunctions::GETPOST('button_removefilter', 'alpha')) { // All tests are required to be compatible with all browsers
            $this->defaulturl = '';
            $this->defaultkey = '';
            $this->defaultvalue = '';
            $toselect = '';
            $search_array_options = [];
        }

        if ($this->action == 'setMAIN_ENABLE_DEFAULT_VALUES') {
            if (DolibarrFunctions::GETPOST('value')) {
                dolibarr_set_const($db, 'MAIN_ENABLE_DEFAULT_VALUES', 1, 'chaine', 0, '', $conf->entity);
            } else {
                dolibarr_set_const($db, 'MAIN_ENABLE_DEFAULT_VALUES', 0, 'chaine', 0, '', $conf->entity);
            }
        }

        if (($this->action == 'add' || (DolibarrFunctions::GETPOST('add') && $this->action != 'update')) || DolibarrFunctions::GETPOST('actionmodify')) {
            $error = 0;

            if (($this->action == 'add' || (DolibarrFunctions::GETPOST('add') && $this->action != 'update'))) {
                if (empty($this->defaulturl)) {
                    DolibarrFunctions::setEventMessages($this->langs->trans("ErrorFieldRequired", $this->langs->transnoentitiesnoconv("Url")), null, 'errors');
                    $error++;
                }
                if (empty($this->defaultkey)) {
                    DolibarrFunctions::setEventMessages($this->langs->trans("ErrorFieldRequired", $this->langs->transnoentitiesnoconv("Field")), null, 'errors');
                    $error++;
                }
            }
            if (DolibarrFunctions::GETPOST('actionmodify')) {
                if (empty($this->urlpage)) {
                    DolibarrFunctions::setEventMessages($this->langs->trans("ErrorFieldRequired", $this->langs->transnoentitiesnoconv("Url")), null, 'errors');
                    $error++;
                }
                if (empty($this->key)) {
                    DolibarrFunctions::setEventMessages($this->langs->trans("ErrorFieldRequired", $this->langs->transnoentitiesnoconv("Field")), null, 'errors');
                    $error++;
                }
            }

            if (!$error) {
                if ($this->action == 'add' || (DolibarrFunctions::GETPOST('add') && $this->action != 'update')) {
                    $this->object->type = $this->mode;
                    $this->object->user_id = 0;
                    $this->object->page = $this->defaulturl;
                    $this->object->param = $this->defaultkey;
                    $this->object->value = $this->defaultvalue;
                    $this->object->entity = $conf->entity;
                    $result = $this->object->create($this->user);
                    if ($result < 0) {
                        $this->action = '';
                        DolibarrFunctions::setEventMessages($this->object->error, $this->object->errors, 'errors');
                    } else {
                        DolibarrFunctions::setEventMessages($this->langs->trans("RecordSaved"), null, 'mesgs');
                        $this->action = "";
                        $this->defaulturl = '';
                        $this->defaultkey = '';
                        $this->defaultvalue = '';
                    }
                }
                if (DolibarrFunctions::GETPOST('actionmodify')) {
                    $this->object->id = $this->id;
                    $this->object->type = $this->mode;
                    $this->object->page = $this->urlpage;
                    $this->object->param = $this->key;
                    $this->object->value = $this->value;
                    $this->object->entity = $conf->entity;
                    $result = $this->object->update($this->user);
                    if ($result < 0) {
                        $this->action = '';
                        DolibarrFunctions::setEventMessages($this->object->error, $this->object->errors, 'errors');
                    } else {
                        DolibarrFunctions::setEventMessages($this->langs->trans("RecordSaved"), null, 'mesgs');
                        $this->action = "";
                        $this->defaulturl = '';
                        $this->defaultkey = '';
                        $this->defaultvalue = '';
                    }
                }
            }
        }
    }

    public function doAction(): bool
    {
        switch ($this->action) {
            case 'delete' :
                $this->object->id = $this->id;
                $result = $this->object->delete($user);
                if ($result < 0) {
                    $this->action = '';
                    DolibarrFunctions::setEventMessages($this->object->error, $this->object->errors, 'errors');
                }
                return true;
                break;
            default:
        }
        return parent::doAction(); // TODO: Change the autogenerated stub
    }

    public function setView(): View
    {
        return new DefaultValuesView($this);
    }
}
