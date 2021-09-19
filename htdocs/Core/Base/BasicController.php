<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Core\Base;

use Alxarafe\Database\Engine;
use Alxarafe\Database\SqlHelper;
use DebugBar\DebugBarException;

/**
 * Class Controller
 *
 * The controller is who responds to the various events.
 *
 * @package Alxarafe\Core\Base
 */
abstract class BasicController extends Globals
{
    /**
     * Indicates whether the closing of the browser is protected
     * against accidental exit or closing
     *
     * @var bool
     */
    public bool $protectedClose;

    /**
     * Contains the action to execute or null if there is no action
     *
     * @var string|null
     */
    public ?string $action;
    /**
     * A BasicController does not have menu.
     *
     * @var bool
     */
    public bool $hasMenu = false;

    /**
     * Indicates whether to use menu or not
     *
     * @var bool
     */
    protected bool $configExists;

    /**
     * Controller constructor.
     *
     * @throws DebugBarException
     */
    public function __construct()
    {
        parent::__construct();

        $this->protectedClose = false;
        if (!$this->preLoad()) {
            trigger_error('preLoad fails!');
        }
    }

    /**
     * Initialization of variables required for all controllers
     *
     * @return bool
     * @throws DebugBarException
     */
    public function preLoad(): bool
    {
        $this->configExists = $this->config->loadConfig();
        $this->action = filter_input(INPUT_POST, 'action', FILTER_DEFAULT);
        return true;
    }

    /**
     * Returns an url to access to any controller of a specific module
     *
     * @param string $module
     * @param string $controller
     *
     * @return string
     */
    static public function url(string $module = self::DEFAULT_MODULE_NAME, string $controller = self::DEFAULT_CONTROLLER_NAME): string
    {
        return BASE_URI . '?' . self::MODULE_GET_VAR . '=' . $module . '&' . self::CONTROLLER_GET_VAR . '=' . $controller;
    }

    /**
     * Main is the entry point (execution) of the controller.
     *
     * @return bool
     */
    public function main(): bool
    {
        $result = true;
        if (isset($this->action)) {
            $result = $this->doAction();
        }
        $this->view = $this->setView();
        return $result;
    }

    /**
     * Executes any action
     *
     * @return bool
     */
    public function doAction(): bool
    {
        switch ($this->action) {
            case 'save':
                return $this->doSave();
            case 'exit':
                $this->doExit();
                break;
            default:
                trigger_error("The '$this->action' action has not been defined!");
        }
        return true;
    }

    /**
     * Execute the Save action (overwrite it, if necessary!)
     *
     * @return bool
     */
    public function doSave(): bool
    {
        return true;
    }

    /**
     * Exit to the main route
     *
     * @return void
     */
    public function doExit(): void
    {
        header('Location: ' . BASE_URI);
        die();
    }

    /**
     * Return an instance to the corresponding View class
     *
     * @return View
     */
    abstract public function setView(): View;

}
