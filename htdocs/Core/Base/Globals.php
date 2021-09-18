<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Core\Base;

use Alxarafe\Core\Providers\Constants;
use Alxarafe\Core\Providers\RegionalInfo;
use Alxarafe\Core\Providers\Translator;
use Alxarafe\Core\Singletons\Config;
use Alxarafe\Core\Singletons\DebugTool;
use Alxarafe\Core\Singletons\FlashMessages;
use Alxarafe\Core\Singletons\Logger;
use Alxarafe\Core\Singletons\Session;
use Alxarafe\Core\Singletons\TemplateRender;
use Alxarafe\Modules\Main\Controllers\EditConfig;

/**
 * Class Globals, load all globals utilities.
 *
 * @package Alxarafe\Core\Base
 */
abstract class Globals
{
    /**
     * The application name
     */
    const APP_NAME = 'Alixar';

    /**
     * The application Version
     */
    const APP_VERSION = '2021.0-Beta';

    /**
     * GET variable used to indicate the name of the module in which to look for the controller
     */
    const MODULE_GET_VAR = 'module';

    /**
     * GET variable used to indicate the name of the controller to use
     */
    const CONTROLLER_GET_VAR = 'controller';

    /**
     * GET variable that contains the name of the module to use, if none is specified
     */
    const DEFAULT_MODULE_NAME = 'main';

    /**
     * GET variable that contains the name of the controller to use, if none is specified
     */
    const DEFAULT_CONTROLLER_NAME = 'init';

    /**
     * Contains an instance of the Config singleton.
     *
     * @var Config
     */
    protected Config $config;

    /**
     * Contains an instance of the TemplateRender singleton.
     *
     * @var TemplateRender
     */
    //    protected TemplateRender $render;

    /**
     * Contains an instance of the Translator provider
     *
     * @var Translator
     */
    //     protected Translator $translator;

    /**
     * Contains an instance of the Session singleton
     *
     * @var Session
     */
    //    protected Session $session;

    /**
     * Contains an instance of the FlashMessages singleton
     *
     * @var FlashMessages
     */
    //    protected FlashMessages $flashMessages;

    /**
     * Contains an instance of the DebugTool singleton
     *
     * @var DebugTool
     */
    //    protected DebugTool $debug;

    /**
     * Contains an instance of the Logger singleton
     *
     * @var Logger
     */
    //    protected Logger $logger;

    /**
     * Contains an instance of the RegionalInfo provider
     *
     * @var RegionalInfo
     */
    //    protected RegionalInfo $regional;

    /**
     * Globals constructor.
     */
    public function __construct()
    {
        // Load constants and configuration file, if they are not already loaded.
        if (!defined('APP_URI')) {
            Constants::defineConstants();
            $hasConfig = Constants::loadConstants();
            // Not yet implemented!
            if (!$hasConfig) {
                die('EditConfig has not been yet implemented!');
            }
            //            if (!$hasConfig) {
            //                $data = new EditConfig();
            //                $data->main();
            //                die();
            //            }
        }

        // Instance in correct order all singletons and providers
        //        $this->debug = DebugTool::getInstance();
        //        $this->flashMessages = FlashMessages::getInstance();
        //        $this->regional = RegionalInfo::getInstance();
        //        $this->logger = Logger::getInstance();
        $this->config = Config::getInstance();
        //        $this->render = TemplateRender::getInstance();
        //        $this->session = Session::getInstance();
        //        $this->translator = Translator::getInstance();
    }

    /**
     * It allows shortening the call to a translation, as well as normal or static use:
     *
     * Normal use:
     *
     *      $this->translator->trans('user-authenticated',['%username%'=>'Pepito'])
     *      Translator::trans('user-authenticated',['%username%'=>'Pepito'])
     *
     * Short use:
     *
     *      $this->trans('user-authenticated',['%username%'=>'Pepito'])
     *      Globals::trans('user-authenticated',['%username%'=>'Pepito'])
     *
     * @param string      $txt
     * @param array       $parameters
     * @param string|null $domain
     * @param string|null $locale
     *
     * @return string
     */
    public static function trans(string $txt, array $parameters = [], ?string $domain = null, ?string $locale = null): string
    {
//        return Translator::trans($txt, $parameters, $domain, $locale);
    }

}