<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018-2020 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Core\Providers;

use Alxarafe\Core\Base\Provider as parentAlias;

/**
 * Class RegionalInfo
 *
 * @package Alxarafe\Core\Providers
 */
abstract class ConfigProvider extends parentAlias
{
    /**
     * Contains the config content.
     *
     * @var array
     */
    protected static array $configContent;

    /**
     * Container constructor.
     */
    public function __construct(string $index = 'main')
    {
        parent::__construct($index);

        self::getConfigContent();
    }

    /**
     * Returns the config content.
     * If config content is empty, load from file.
     * Otherwise return data from property.
     *
     * @return array
     */
    public static function getConfigContent(): array
    {
        if (empty(self::$configContent)) {
            self::$configContent = self::getConfig();
        }
        return self::$configContent;
    }

}