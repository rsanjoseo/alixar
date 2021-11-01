<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Dolibarr\Base;

use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;

/**
 * Class AlixarController
 *
 * @package Alxarafe\Core\Base
 */
abstract class DolibarrListController extends DolibarrController
{
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

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * By changing the variables for attributes, each of the POST and GET parameters will be
     * assigned to them, after filtering their content.
     * They have to be attributes, in order to be used in the other methods and in the view.
     */
    public function getDolibarrVars(): void
    {
        $this->action = DolibarrFunctions::GETPOST('action', 'aZ09');
        if (empty($this->action)) {
            $this->action = null;
        }

        $this->id = DolibarrFunctions::GETPOST('rowid', 'int');
        $this->optioncss = DolibarrFunctions::GETPOST('optionscss', 'alphanohtml');
        $this->mode = DolibarrFunctions::GETPOST('mode', 'aZ09') ? DolibarrFunctions::GETPOST('mode', 'aZ09') : 'createform'; // 'createform', 'filters', 'sortorder', 'focus'
        $this->limit = DolibarrFunctions::GETPOST('limit', 'int') ? DolibarrFunctions::GETPOST('limit', 'int') : $this->conf->liste_limit;
        $this->sortfield = DolibarrFunctions::GETPOST("sortfield", 'alpha');
        $this->sortorder = DolibarrFunctions::GETPOST("sortorder", 'alpha');
        $this->page = DolibarrFunctions::GETPOSTISSET('pageplusone') ? (DolibarrFunctions::GETPOST('pageplusone') - 1) : DolibarrFunctions::GETPOST("page", 'int');
        if (empty($this->page) || $this->page == -1) {
            $this->page = 0;
        }     // If $this->page is not defined, or '' or -1
        $this->offset = $this->limit * $this->page;
        $this->pageprev = $this->page - 1;
        $this->pagenext = $this->page + 1;
    }

    /**
     * Gets the action to perform in the $this->action attribute.
     * Dolibarr does not define a specific action, but in Alixar defined and determined
     * actions will be used.
     * The doAction method will take care of executing the requested action (if there is any).
     */
    public function getDolibarrActions(): void
    {
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
    }

}
