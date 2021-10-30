<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018-2020 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Core\Singletons;

use Alxarafe\Core\Base\Singleton;
use Alxarafe\Core\Providers\RegionalInfo;
use DateTimeZone;
use Exception;
use Monolog\Handler\FirePHPHandler;
use Monolog\Handler\StreamHandler;
use Monolog\Logger as MonologLogger;

/**
 * Class Logger
 *
 * @package Alxarafe\Core\Providers
 */
class Logger extends Singleton
{
    /**
     * The logger.
     *
     * @var MonologLogger
     */
    private static MonologLogger $logger;

    /**
     * Logger constructor.
     */
    public function __construct(string $index = 'main')
    {
        parent::__construct($index);

        self::$logger = new MonologLogger('core_logger');
        set_exception_handler([$this, 'exceptionHandler']);
        try {
            // Maybe is needed a different timezone, at this moment sets the same.
            $timeZone = RegionalInfo::getInstance()->getConfig()['timezone'];
            self::$logger->setTimezone(new DateTimeZone($timeZone));
            self::$logger->pushHandler(new StreamHandler(basePath(DIRECTORY_SEPARATOR . 'config' . DIRECTORY_SEPARATOR . 'core.log'), MonologLogger::DEBUG));
        } catch (Exception $e) {
            dump('Singletons Logger error!');
            dump($e);
        }
        self::$logger->pushHandler(new FirePHPHandler());
    }

    /**
     * Catch the exception handler and adds to logger.
     *
     * @param Exception $e
     */
    public static function exceptionHandler($e): void
    {
        FlashMessages::getInstance()::setError($e->getMessage());
        dump('Singleton Logger Error');
        dump($e);
        self::$logger->error(
            'Exception [' . $e->getCode() . ']: ' . $e->getMessage() . PHP_EOL
            . $e->getFile() . ':' . $e->getLine() . PHP_EOL
            . $e->getTraceAsString()
        );
    }

    /**
     * Returns the logger.
     *
     * @return MonologLogger
     */
    public function getLogger(): MonologLogger
    {
        return self::$logger;
    }
}