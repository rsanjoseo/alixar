<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Dolibarr\Base;

use Alxarafe\Core\Base\Controller;
use Alxarafe\Core\Base\View;
use Alxarafe\Core\Singletons\Config;
use Alxarafe\Dolibarr\Classes\Conf;
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
    public $user;
    public $hookmanager;

    abstract function getDolibarrActions();

    /**
     * @throws DebugBarException
     */
    public function __construct()
    {
        parent::__construct();

        $globals = new DolibarrGlobals();
        $this->conf = $globals->getConf();
        $this->user = $globals->getUser();
        $this->hookmanager = $globals->getHookManager();
        $this->db = $globals->getDb();

        DolibarrFilefunc::defineVars();

        $this->getDolibarrActions();

        // $filefunc=new DolibarrFilefunc();
        // $this->vars = $filefunc->defineVars();

        $auth = new DolibarrAuthentication($this);
        if (!$auth->authenticated()) {
            $auth->login();
        }
    }

    public function setView(): View
    {
        $view = new DolibarrView($this);
        $view->setConf($this->conf);
        return $view;
    }
}
