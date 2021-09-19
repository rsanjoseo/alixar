<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018-2020 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Core\Providers;

use DateTime;
use Exception;

/**
 * Class RegionalInfo
 *
 * @package Alxarafe\Core\Providers
 */
class RegionalInfo extends ConfigProvider
{
    /**
     * Returns a list of date formats
     */
    public static function getDateFormats(): array
    {
        $styles = [
            'Y-m-d',
            'Y-m-j',
            'Y-M-d',
            'Y-M-j',
            'd-m-Y',
            'j-m-Y',
            'd-M-Y',
            'j-M-Y',
            'm-d-Y',
            'm-j-Y',
            'M-d-Y',
            'M-j-Y',
        ];
        return self::fillList($styles);
    }

    /**
     * Fill list with key => value, where key is style and value a sample.
     *
     * @param array $styles
     *
     * @return array
     */
    private static function fillList($styles): array
    {
        $result = [];
        foreach ($styles as $style) {
            $result[$style] = self::getFormatted($style);
        }
        return $result;
    }

    /**
     * Return formatted string.
     *
     * @param string $style
     * @param string $time
     *
     * @return false|string
     */
    private static function getFormatted(string $style, string $time = '2011-01-07 09:08:07')
    {
        //        return FormatUtils::getFormatted($style, $time);
        try {
            $time = ($time === '') ? 'now' : $time;
            $date = (new DateTime($time))->format($style);
        } catch (Exception $e) {
            $time = ($time === '') ? 'time()' : $time;
            $date = date($style, strtotime($time));
        }
        return $date;
    }

    /**
     * Returns a list of time formats
     */
    public static function getTimeFormats(): array
    {
        $styles = [
            'H:i',
            'H:i:s',
            'h:i A',
            'h:i:s A',
        ];
        return self::fillList($styles);
    }

    /**
     * Return default values
     *
     * @return array
     */
    public function getDefaultValues(): array
    {
        return [
            'dateFormat' => 'Y-m-d',
            'timeFormat' => 'H:i:s',
            'datetimeFormat' => 'Y-m-d H:i:s',
            'timezone' => 'Europe/Madrid',
        ];
    }
}