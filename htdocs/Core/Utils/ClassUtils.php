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

namespace Alxarafe\Core\Utils;

use Alxarafe\Core\Singletons\Logger;
use ReflectionClass;
use ReflectionException;

/**
 * Class ClassUtils
 *
 * @package Alxarafe\Core\Helpers
 */
class ClassUtils
{
    /**
     * Define a constant if it does not exist
     *
     * @param string $const
     * @param        $value
     */
    public static function defineIfNotExists(string $const, $value): void
    {
        if (!defined($const)) {
            define($const, $value);
        }
    }

    /**
     * Returns the short name of the class.
     *
     * @param $objectClass
     * @param $calledClass
     *
     * @return string
     */
    public static function getShortName($objectClass, $calledClass): string
    {
        try {
            $shortName = (new ReflectionClass($objectClass))->getShortName();
        } catch (ReflectionException $e) {
            Logger::getInstance()::exceptionHandler($e);
            $shortName = $calledClass;
        }
        return $shortName;
    }
}