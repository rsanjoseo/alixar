<?php

namespace Alxarafe\Core\DebugBarCollectors;

use \DebugBar\DataCollector\TimeDataCollector;

/**
 * DolTimeDataCollector class
 */
class DolTimeDataCollector extends TimeDataCollector
{
    /**
     *    Return widget settings
     *
     * @return array  Array
     */
    public function getWidgets()
    {
        global $langs;

        return [
            "time" => [
                "icon" => "clock-o",
                "tooltip" => $langs->transnoentities('RequestDuration'),
                "map" => "time.duration_str",
                "default" => "'0ms'",
            ],
            $langs->transnoentities('Timeline') => [
                "icon" => "tasks",
                "widget" => "PhpDebugBar.Widgets.TimelineWidget",
                "map" => "time",
                "default" => "{}",
            ],
        ];
    }
}
