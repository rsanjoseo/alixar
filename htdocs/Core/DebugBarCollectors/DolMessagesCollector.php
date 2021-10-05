<?php

namespace Alxarafe\Core\DebugBarCollectors;

use \DebugBar\DataCollector\MessagesCollector;

/**
 * DolMessagesCollector class
 */
class DolMessagesCollector extends MessagesCollector
{
    /**
     *    Return widget settings
     *
     * @return array  Array
     */
    public function getWidgets()
    {
        global $langs;

        $title = $langs->transnoentities('Messages');
        $name = $this->getName();

        return [
            "$title" => [
                "icon" => "list-alt",
                "widget" => "PhpDebugBar.Widgets.MessagesWidget",
                "map" => "$name.messages",
                "default" => "[]",
            ],
            "$title:badge" => [
                "map" => "$name.count",
                "default" => "null",
            ],
        ];
    }
}
