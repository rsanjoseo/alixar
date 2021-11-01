<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Dolibarr\Base;

use Alxarafe\Core\Base\BasicController;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;

/**
 * Class AlixarController
 *
 * @package Alxarafe\Core\Base
 */
abstract class DolibarrListView extends DolibarrView
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

    public function __construct(BasicController $controller)
    {
        parent::__construct($controller);

        $this->id = $controller->id;
        $this->optioncss = $controller->optioncss;
        $this->mode = $controller->mode;
        $this->limit = $controller->limit;
        $this->sortfield = $controller->sortfield;
        $this->sortorder = $controller->sortorder;
        $this->page = $controller->page;
        $this->offset = $controller->offset;
        $this->pageprev = $controller->pageprev;
        $this->pagenext = $controller->pagenext;
    }

}
