<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Dolibarr\Base;

use Alxarafe\Core\Base\Controller;
use Alxarafe\Core\Base\View;
use Alxarafe\Core\Providers\Translator;
use Alxarafe\Database\Engine;
use Alxarafe\Dolibarr\Classes\Conf;
use Alxarafe\Dolibarr\Classes\HookManager;
use Alxarafe\Dolibarr\Classes\MenuManager;
use Alxarafe\Dolibarr\Classes\Societe;
use Alxarafe\Dolibarr\Classes\User;
use Alxarafe\Dolibarr\Libraries\DolibarrFilefunc;
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
    public User $user;
    public HookManager $hookmanager;
    public MenuManager $menumanager;
    public Engine $db;
    public Translator $langs;
    public ?Societe $mysoc;
    public $object = null;

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
        $this->menumanager = $globals->getMenuManager();
        $this->db = $globals->getDb();
        $this->langs = $globals->getLangs();
        $this->mysoc = $globals->getMySoc();

        $this->vars = DolibarrFilefunc::defineVars();

        $this->getDolibarrVars();
        $this->getDolibarrActions();

        $auth = new DolibarrAuthentication($this);
        if (!$auth->authenticated()) {
            $auth->login();
        }
    }

    /**
     * By changing the variables for attributes, each of the POST and GET parameters will be
     * assigned to them, after filtering their content.
     * They have to be attributes, in order to be used in the other methods and in the view.
     */
    abstract function getDolibarrVars(): void;

    /**
     * Gets the action to perform in the $this->action attribute.
     * Dolibarr does not define a specific action, but in Alixar defined and determined
     * actions will be used.
     * The doAction method will take care of executing the requested action (if there is any).
     */
    abstract function getDolibarrActions(): void;

    public function setView(): View
    {
        $view = new DolibarrView($this);
        $view->setConf($this->conf);
        return $view;
    }
}
