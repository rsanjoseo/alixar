<?php
/**
 * Copyright (C)      2021  Rafael San José Tovar   <info@rsanjoseo.com>
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

namespace Alxarafe\Core\Base;

use Alxarafe\Core\Utils\ClassUtils;

abstract class Singleton
{
    /**
     * Hold the classes on instance.
     *
     * @var array
     */
    private static array $instances = [];

    /**
     * @param string $index
     */
    public function __construct(string $index = 'main')
    {
        $className = self::getClassName();
        if (isset(self::$instances[$className][$index])) {
            trigger_error("Please use '$className:getInstance()' instead of 'new' to instantiate a Singleton.");
        }
        self::$instances[$className][$index] = $this;
    }

    /**
     * Returns the class name.
     *
     * @return string
     */
    protected static function getClassName(): string
    {
        $class = static::class;
        return ClassUtils::getShortName($class, $class);
    }

    /**
     * The object is created from within the class itself only if the class
     * has no instance.
     *
     * We opted to use an array to make several singletons according to the
     * index passed to getInstance
     *
     * @param string $index
     *
     * @return mixed
     */
    public static function getInstance(string $index = 'main')
    {
        $className = self::getClassName();
        if (!isset(self::$instances[$className][$index])) {
            new static($index);
        }
        return self::$instances[$className][$index];
    }

}