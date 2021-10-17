<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Dolibarr\Base;

use Alxarafe\Core\Base\Controller;
use Alxarafe\Core\Base\View;
use Alxarafe\Dolibarr\Classes\Conf;
use Alxarafe\Dolibarr\Providers\DolibarrConfig;
use DebugBar\DebugBarException;

/**
 * Class AlixarController
 *
 * @package Alxarafe\Core\Base
 */
abstract class DolibarrController extends Controller
{
    public array $vars;
    public Conf $conf;

    /**
     * @throws DebugBarException
     */
    public function __construct()
    {
        parent::__construct();

        $dolConf = DolibarrConfig::getInstance();
        $this->vars = $dolConf->getVars();
        $this->conf = $dolConf->getConf();
    }

    public function setView(): View
    {
        $view = new DolibarrView($this);
        $view->setConf($this->conf);
        return $view;
    }
}
