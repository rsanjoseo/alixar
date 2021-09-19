<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018-2020 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Core\Helpers\Utils;

/**
 * Class ArrayUtils
 *
 * @package Alxarafe\Core\Helpers
 */
class ArrayUtils
{
    /**
     * Flatten an array to leave it at a single level.
     * Ignore the value of the indexes of the array, taking only the values.
     * Remove spaces from the result and convert it to lowercase.
     *
     * TODO: Tests works, but seems not to do what is explained
     *
     * @param array $array
     *
     * @return array
     */
    public static function flatArray(array $array): array
    {
        $ret = [];
        foreach ($array as $value) {
            if (is_array($value)) {
                $ret = array_merge($ret, self::flatArray($value));
            } else {
                $ret[] = strtolower(trim($value));
            }
        }
        return $ret ?? [];
    }

    /**
     * Add the elements of the 2nd array behind those of the first.
     *
     * @param array $initialArray
     * @param array $nextArray
     *
     * @return array
     */
    public static function addToArray(array $initialArray, array $nextArray): array
    {
        $ret = $initialArray;
        foreach ($nextArray as $value) {
            $ret[] = $value;
        }
        return $ret;
    }

    /**
     * Return true if $param is setted and is 'yes', otherwise return false.
     *
     * @param array  $param
     * @param string $key
     *
     * @return bool
     */
    public static function isTrue(array $param, $key): bool
    {
        return (isset($param[$key]) && in_array($param[$key], ['yes', 'true', '1', 1], true));
    }

    /**
     * Given an array of parameters, an index and a possible default value,
     * returns a literal of the form: index = 'value'.
     * It is used, for example, to assign attributes to an html statement.
     *
     * @param array       $itemsArray
     * @param string      $itemIndex
     * @param string|null $defaultValue
     *
     * @return string
     */
    public static function getItem(array $itemsArray, string $itemIndex, $defaultValue = null): string
    {
        $res = $itemsArray[$itemIndex] ?? $defaultValue;
        return isset($res) ? " $itemIndex = '$res'" : '';
    }

    /**
     * Array recursive merge excluding duplicate values.
     *
     * @source https://github.com/manusreload/GLFramework/blob/master/src/functions.php#L292
     *
     * @param array $array1
     * @param array $array2
     *
     * @return array
     */
    public static function arrayMergeRecursiveEx(array &$array1, array &$array2): array
    {
        $merged = $array1;
        foreach ($array2 as $key => &$value) {
            if (is_array($value) && isset($merged[$key]) && is_array($merged[$key])) {
                $merged[$key] = self::arrayMergeRecursiveEx($merged[$key], $value);
            } elseif (is_numeric($key) && !in_array($value, $merged, false)) {
                $merged[] = $value;
            } else {
                $merged[$key] = $value;
            }
        }
        return $merged;
    }
}