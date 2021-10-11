<?php

namespace Luracast\Restler;

/**
 * Static event broadcasting system for Restler
 *
 * @author     R.Arul Kumaran <arul@luracast.com>
 * @package    Restler
 * @category   Framework
 * @copyright  2010 Luracast
 * @license    http://www.opensource.org/licenses/lgpl-license.php LGPL
 * @link       http://luracast.com/products/restler/
 *
 */

use Closure;

class EventDispatcher
{
    public static $self;
    protected static $_waitList = [];
    protected $events = [];
    private $listeners = [];

    public function __construct()
    {
        static::$self = $this;
        if (!empty(static::$_waitList)) {
            foreach (static::$_waitList as $param) {
                call_user_func_array([$this, $param[0]], $param[1]);
            }
        }
    }

    public static function __callStatic($eventName, $params)
    {
        if (0 === strpos($eventName, 'on')) {
            if (static::$self) {
                return call_user_func_array([static::$self, $eventName], $params);
            }
            static::$_waitList[] = func_get_args();
            return false;
        }
    }

    public static function addListener($eventName, Closure $callback)
    {
        return static::$eventName($callback);
    }

    public function __call($eventName, $params)
    {
        if (0 === strpos($eventName, 'on')) {
            if (!isset($this->listeners[$eventName]) || !is_array($this->listeners[$eventName])) {
                $this->listeners[$eventName] = [];
            }
            $this->listeners[$eventName][] = $params[0];
        }
        return $this;
    }

    public function on(array $eventHandlers)
    {
        for (
            $count = count($eventHandlers),
            $events = array_map(
                'ucfirst',
                $keys = array_keys(
                    $eventHandlers = array_change_key_case(
                        $eventHandlers,
                        CASE_LOWER
                    )
                )
            ),
            $i = 0;
            $i < $count;
            call_user_func(
                [$this, "on{$events[$i]}"],
                $eventHandlers[$keys[$i++]]
            )
        ) {
            ;
        }
    }

    /**
     * Fire an event to notify all listeners
     *
     * @param string $eventName name of the event
     * @param array  $params    event related data
     */
    protected function dispatch($eventName, array $params = [])
    {
        $this->events[] = $eventName;
        $params = func_get_args();
        $eventName = 'on' . ucfirst(array_shift($params));
        if (isset($this->listeners[$eventName])) {
            foreach ($this->listeners[$eventName] as $callback) {
                call_user_func_array($callback, $params);
            }
        }
    }

}

