<?php

use DebugBar\DataCollector\AssetProvider;
use DebugBar\DataCollector\DataCollector;
use DebugBar\DataCollector\Renderable;
use DebugBar\DebugBarException;

dol_include_once('/debugbar/class/TraceableDB.php');

/**
 * DolQueryCollector class
 */
class DolQueryCollector extends DataCollector implements Renderable, AssetProvider
{
    /**
     * @var object Database handler
     */
    protected $db;

    /**
     * Constructor
     */
    public function __construct()
    {
        global $db;

        // Replace $db handler with new handler override by TraceableDB
        $db = new TraceableDB($db);

        $this->db = $db;
    }

    /**
     * Return collected data
     *
     * @return array  Array
     */
    public function collect()
    {
        $queries = [];
        $totalExecTime = 0;
        $totalMemoryUsage = 0;
        $totalFailed = 0;
        foreach ($this->db->queries as $query) {
            $queries[] = [
                'sql' => $query['sql'],
                'duration' => $query['duration'],
                'memory' => $query['memory_usage'],
                'is_success' => $query['is_success'],
                'error_code' => $query['error_code'],
                'error_message' => $query['error_message'],
            ];
            $totalExecTime += $query['duration'];
            $totalMemoryUsage += $query['memory_usage'];
            if (!$query['is_success']) {
                $totalFailed += 1;
            }
        }

        return [
            'nb_statements' => count($queries),
            'nb_failed_statements' => $totalFailed,
            'accumulated_duration' => $totalExecTime,
            'memory_usage' => $totalMemoryUsage,
            'statements' => $queries,
        ];
    }

    /**
     *    Return collector name
     *
     * @return string  Name
     */
    public function getName()
    {
        return 'query';
    }

    /**
     *    Return widget settings
     *
     * @return array      Array
     */
    public function getWidgets()
    {
        global $langs;

        $title = $langs->transnoentities('Database');

        return [
            "$title" => [
                "icon" => "arrow-right",
                "widget" => "PhpDebugBar.Widgets.SQLQueriesWidget",
                "map" => "query",
                "default" => "[]",
            ],
            "$title:badge" => [
                "map" => "query.nb_statements",
                "default" => 0,
            ],
        ];
    }

    /**
     *    Return assets
     *
     * @return array   Array
     */
    public function getAssets()
    {
        return [
            'css' => 'widgets/sqlqueries/widget.css',
            'js' => 'widgets/sqlqueries/widget.js',
        ];
    }
}
