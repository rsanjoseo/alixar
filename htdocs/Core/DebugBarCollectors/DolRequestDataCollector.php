<?php

namespace Alxarafe\Core\DebugBarCollectors;

use \DebugBar\DataCollector\RequestDataCollector;

/**
 * DolRequestDataCollector class
 */
class DolRequestDataCollector extends RequestDataCollector
{
    /**
     * Collects the data from the collectors
     *
     * @return array
     */
    public function collect()
    {
        $vars = ['_GET', '_POST', '_SESSION', '_COOKIE', '_SERVER'];
        $data = [];

        foreach ($vars as $var) {
            if (isset($GLOBALS[$var])) {
                $arrayofvalues = $GLOBALS[$var];

                if ($var == '_COOKIE') {
                    foreach ($arrayofvalues as $key => $val) {
                        if (preg_match('/^DOLSESSID_/', $key)) {
                            $arrayofvalues[$key] = '*****hidden*****';
                        }
                    }
                    //var_dump($arrayofvalues);
                }

                $data["$" . $var] = $this->getDataFormatter()->formatVar($arrayofvalues);
            }
        }

        return $data;
    }

    /**
     *    Return widget settings
     *
     * @return void
     */
    public function getWidgets()
    {
        global $langs;

        $langs->load("other");

        return [
            $langs->transnoentities('Variables') => [
                "icon" => "tags",
                "widget" => "PhpDebugBar.Widgets.VariableListWidget",
                "map" => "request2",
                "default" => "{}",
            ],
        ];
    }
}
