<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018-2020 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Core\Helpers;

use Alxarafe\Core\Singletons\Logger;
use Exception;

/**
 * Class TextUtils
 *
 * @package Alxarafe\Core\Helpers
 */
class TextUtils
{
    /**
     * Translate a literal in CamelCase format to snake_case format
     *
     * @param string $string
     * @param string $us
     *
     * @return string
     */
    public static function camelToSnake($string, $us = '_'): string
    {
        $patterns = [
            '/([a-z]+)([0-9]+)/i',
            '/([a-z]+)([A-Z]+)/',
            '/([0-9]+)([a-z]+)/i',
        ];
        $string = preg_replace($patterns, '$1' . $us . '$2', $string);

        // Lowercase
        $string = strtolower($string);

        return $string;
    }

    /**
     * Translate a literal in snake_case format to CamelCase format
     *
     * @param string $string
     * @param string $us
     *
     * @return string
     */
    public static function snakeToCamel($string, $us = '_'): string
    {
        return str_replace($us, '', ucwords($string, $us));
    }

    /**
     * Generate a random string for a given length.
     * Tries to generate from most secure random text to less.
     *
     * @param int $length
     *
     * @return string
     */
    public static function randomString($length = 16): string
    {
        if (function_exists('openssl_random_pseudo_bytes')) {
            $bytes = openssl_random_pseudo_bytes($length, $cstrong);
            if (!$cstrong || !$bytes) {
                $bytes = self::randomString($length);
            }
        } elseif (function_exists('random_bytes')) {
            try {
                $bytes = random_bytes($length);
            } catch (Exception $e) {
                Logger::getInstance()::exceptionHandler($e);
                $bytes = self::randomString($length);
            }
        } else {
            $bytes = mb_substr(str_shuffle('0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'), 0, $length);
        }
        return bin2hex($bytes);
    }
}