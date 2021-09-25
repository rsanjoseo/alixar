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

namespace Alxarafe\Core\Singletons;

use Alxarafe\Core\Base\Singleton;
use Alxarafe\Core\DebugBarCollectors\DolibarrCollector;
use Alxarafe\Core\DebugBarCollectors\DolLogsCollector;
use Alxarafe\Core\DebugBarCollectors\DolMemoryCollector;
use Alxarafe\Core\DebugBarCollectors\DolQueryCollector;
use Alxarafe\Core\DebugBarCollectors\DolRequestDataCollector;
use Alxarafe\Core\DebugBarCollectors\DolTimeDataCollector;
use Alxarafe\Core\DebugBarCollectors\PhpCollector;
use Alxarafe\Core\DebugBarCollectors\TranslatorCollector;
use Alxarafe\Core\Providers\Translator;
use Alxarafe\Core\Utils\ClassUtils;
use DebugBar\Bridge\MonologCollector;
use DebugBar\DataCollector\MessagesCollector;
use DebugBar\DebugBarException;
use DebugBar\JavascriptRenderer;
use DebugBar\StandardDebugBar;

/**
 * Class Debug
 *
 * @package Alxarafe\Helpers
 */
class DebugTool extends Singleton
{
    /**
     * Private logger instance
     *
     * @var Logger
     */
    public static Logger $logger;
    /**
     * Private render instance
     *
     * @var JavascriptRenderer
     */
    private static JavascriptRenderer $render;
    /**
     * DebugBar instance
     *
     * @var StandardDebugBar
     */
    public StandardDebugBar $debugBar;

    /**
     * DebugTool constructor.
     *
     * @throws DebugBarException
     */
    public function __construct(string $index = 'main')
    {
        parent::__construct($index);

        self::$logger = Logger::getInstance();

        $shortName = ClassUtils::getShortName($this, $this);
        if (!defined('DEBUG')) {
            define('DEBUG', false);
        }

        $this->debugBar = new StandardDebugBar();
        //        $this->startTimer($shortName, $shortName . ' DebugTool Constructor');

        $this->addCollectors();

        $translator = Translator::getInstance();
        $this->debugBar->addCollector(new TranslatorCollector($translator));

        $baseUrl = VENDOR_URI . '/maximebf/debugbar/src/DebugBar/Resources';
        self::$render = $this->getDebugBar()->getJavascriptRenderer($baseUrl, BASE_FOLDER);
        //        $this->stopTimer($shortName);
    }

    /**
     * TODO: Tune this!
     */
    public function addCollectors()
    {
        // Alxarafe collectors
        $this->debugBar->addCollector(new MessagesCollector('SQL'));
        $this->debugBar->addCollector(new PhpCollector());
        $this->debugBar->addCollector(new MessagesCollector('Deprecated'));
        $this->debugBar->addCollector(new MonologCollector(self::$logger->getLogger()));

        // Dolibarr collectors
        //$this->debugBar->addCollector(new PhpInfoCollector());
        //$this->debugBar->addCollector(new DolMessagesCollector());
        //        $this->debugBar->addCollector(new DolRequestDataCollector());
        //$this->debugBar->addCollector(new DolConfigCollector());      // Disabled for security purpose
        // $this->debugBar->addCollector(new DolTimeDataCollector());
        //        $this->debugBar->addCollector(new DolMemoryCollector());
        //$this->debugBar->addCollector(new DolExceptionsCollector());
        //        $this->debugBar->addCollector(new DolQueryCollector());
        //        $this->debugBar->addCollector(new DolibarrCollector());
        $this->debugBar->addCollector(new DolLogsCollector());
    }

    /**
     * Return the internal debug instance for get the html code.
     *
     * TODO: Analizar qué funciones harían falta para el html y retornar el html.
     * Tal y como está ahora mismo sería dependiente de DebugBar. DebugBar debería
     * de quedar TOTALMENTE encapsulado en esta clase.
     *
     * @return StandardDebugBar
     * @throws DebugBarException
     */
    public function getDebugBar(): StandardDebugBar
    {
        return $this->debugBar;
    }

    /**
     * Gets the necessary calls to include the debug bar in the page header
     *
     * @return string
     */
    public static function getRenderHeader(): string
    {
        if (constant('DEBUG') !== true) {
            return '';
        }
        return self::$render->renderHead();
    }

    /**
     * Gets the necessary calls to include the debug bar in the page footer
     *
     * @return string
     */
    public static function getRenderFooter(): string
    {
        if (constant('DEBUG') !== true) {
            return '';
        }
        return self::$render->render();
    }

    /**
     * Initialize the timer
     *
     * @param string $name
     * @param string $message
     */
    public function startTimer(string $name, string $message): void
    {
        // TODO: Revisar dónde se llama antes de definir $this->debugBar
        //        $this->debugBar['time']->startMeasure($name, $message);
    }

    /**
     * Stop the timer
     *
     * @param string $name
     */
    public function stopTimer(string $name): void
    {
        // TODO: Revisar dónde se llama antes de definir $this->debugBar
        //        $this->debugBar['time']->stopMeasure($name);
    }

    /**
     * Add an exception to the exceptions tab of the debug bar.
     *
     * TODO: addException is deprecated!
     *
     * @param $exception
     */
    public function addException($exception): void
    {
        if (constant('DEBUG') !== true) {
            return;
        }
        $caller = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS, 2)[0];
        $caller['file'] = substr($caller['file'], strlen(BASE_FOLDER));
        $this->debugBar['exceptions']->addException($exception); // Use addThrowable instead!
        // self::$logger->info('Exception: ' . $exception->getMessage());
    }

    /**
     * Write a message in a channel (tab) of the debug bar.
     *
     * @param string $channel
     * @param string $message
     */
    public function addMessage(string $channel, string $message): void
    {
        if (constant('DEBUG') !== true) {
            return;
        }
        $caller = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS, 2)[0];
        $caller['file'] = substr($caller['file'], strlen(BASE_FOLDER));
        $this->debugBar[$channel]->addMessage($caller['file'] . ' (' . $caller['line'] . '): ' . $message);
    }

    /**
     * @return string
     * @deprecated use getRenderHeader() and getRenderFooter() where appropiate
     */
    public function getRenderer()
    {
        return $this->getRenderHeader() . ' ' . $this->getRenderFooter();
    }
}
