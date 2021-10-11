<?php

namespace Luracast\Restler\UI;

use Luracast\Restler\CommentParser;
use Luracast\Restler\Data\Text;
use Luracast\Restler\Restler;
use Luracast\Restler\Routes;
use Luracast\Restler\Scope;
use Luracast\Restler\Util;

/**
 * Utility class for automatically creating data to build an navigation interface
 * based on available routes that are accessible by the current user
 *
 * @author     R.Arul Kumaran <arul@luracast.com>
 * @package    Restler
 * @category   Framework
 * @copyright  2010 Luracast
 * @license    http://www.opensource.org/licenses/lgpl-license.php LGPL
 * @link       http://luracast.com/products/restler/
 *
 */
class Nav
{
    public static $root = 'home';
    /**
     * @var array all paths beginning with any of the following will be excluded
     * from documentation. if an empty string is given it will exclude the root
     */
    public static $excludedPaths = [''];
    /**
     * @var array prefix additional menu items with one of the following syntax
     *            [$path => $text]
     *            [$path]
     *            [$path => ['text' => $text, 'url' => $url, 'trail'=> $trail]]
     */
    public static $prepends = [];
    /**
     * @var array suffix additional menu items with one of the following syntax
     *            [$path => $text]
     *            [$path]
     *            [$path => ['text' => $text, 'url' => $url, 'trail'=> $trail]]
     */
    public static $appends = [];
    public static $addExtension = true;
    protected static $tree = [];
    protected static $extension = '';
    protected static $activeTrail = '';
    protected static $url;

    public static function get($for = '', $activeTrail = null)
    {
        if (empty(static::$tree)) {
            /** @var Restler $restler */
            $restler = Scope::get('Restler');
            if (static::$addExtension) {
                static::$extension = isset($restler->responseFormat)
                    ? '.' . $restler->responseFormat->getExtension()
                    : '.html';
            }
            static::$url = $restler->getBaseUrl();
            if (empty(static::$url)) {
                static::$url = '';
            }
            static::$activeTrail = $activeTrail = empty($activeTrail)
                ? (empty($restler->url) || $restler->url == 'index'
                    ? static::$root
                    : $restler->url
                )
                : $activeTrail;
            if (static::$addExtension) {
                static::$extension = isset($restler->responseFormat)
                    ? '.' . $restler->responseFormat->getExtension()
                    : '.html';
            }
            static::addUrls(static::$prepends);
            $map = Routes::findAll(
                static::$excludedPaths,
                ['POST', 'DELETE', 'PUT', 'PATCH'],
                $restler->getRequestedApiVersion()
            );
            foreach ($map as $path => $data) {
                foreach ($data as $item) {
                    $access = $item['access'];
                    $route = $item['route'];
                    $url = $route['url'];
                    if ($access && !Text::contains($url, '{')) {
                        $label = Util::nestedValue(
                            $route,
                            'metadata',
                            CommentParser::$embeddedDataName,
                            'label'
                        );
                        if (!empty($url)) {
                            $url .= static::$extension;
                        }
                        static::add($url, $label);
                    }
                }
            }
            static::addUrls(static::$appends);
        } elseif (empty($activeTrail)) {
            $activeTrail = static::$activeTrail;
        }
        $tree = static::$tree;
        $activeTrail = explode('/', $activeTrail);
        $nested = &static::nested($tree, $activeTrail);
        if (is_array($nested)) {
            $nested['active'] = true;
        }
        if (!empty($for)) {
            $for = explode('/', $for);
            $tree = static::nested($tree, $for)['children'];
        }
        return array_filter($tree);
    }

    public static function addUrls(array $urls)
    {
        foreach ($urls as $url => $label) {
            $trail = null;
            if (is_array($label)) {
                if (isset($label['trail'])) {
                    $trail = $label['trail'];
                }
                if (isset($label['url'])) {
                    $url = $label['url'];
                    $label = isset($label['label']) ? $label['label'] : null;
                } else {
                    $url = current(array_keys($label));
                    $label = current($label);
                }
            }
            if (is_numeric($url)) {
                $url = $label;
                $label = null;
            }
            static::add($url, $label, $trail);
        }
        return static::$tree;
    }

    public static function add($url, $label = null, $trail = null)
    {
        $r = parse_url($url);
        if (is_null($trail)) {
            $trail = isset($r['path']) ? $r['path'] : static::$root;
        }
        //remove / prefix and / suffixes and any extension
        $trail = strtok(trim($trail, '/'), '.');
        $parts = explode('/', $trail);
        if (count($parts) == 1 && empty($parts[0])) {
            $parts = [static::$root];
        }
        if (isset($r['fragment'])) {
            $parts[] = $r['fragment'];
            if (is_null($label)) {
                $label = Text::title($r['fragment']);
            }
        }
        if (empty($r['scheme'])) {
            //relative url found
            if (empty($url)) {
                $label = Text::title(static::$root);
                $url = static::$url;
            } else {
                $url = static::$url . '/' . ltrim($url, '/');
            }
        }
        if (is_null($label)) {
            $label = Text::title(strtok(end($parts), '.'));
        }
        $r['url'] = $url;
        $r['path'] = $trail;
        $r['parts'] = $parts;
        $r['label'] = $label;
        static::build($r);
        return $r;
    }

    public static function build(array $r)
    {
        $p = &static::$tree;
        $parts = $r['parts'];
        $last = count($parts) - 1;
        foreach ($parts as $i => $part) {
            if ($i == $last) {
                $p[$part]['text'] = $r['label'];
                $p[$part]['href'] = $r['url'];
                $p[$part]['class'] = Text::slug($part);
                /* dynamically do it at run time instead
                if ($r['path'] == static::$activeTrail)
                    $p[$part]['active'] = true;
                */
            } elseif (!isset($p[$part])) {
                $p[$part] = [];
                $p[$part]['text'] = Text::title($part);
                $p[$part]['href'] = '#';
                $p[$part]['children'] = [];
            }
            $p = &$p[$part]['children'];
        }
    }

    protected static function & nested(array &$tree, array $parts)
    {
        if (!empty($parts)) {
            $part = array_shift($parts);
            if (empty($tree[$part])) {
                return $tree[$part];
            } elseif (empty($parts)) {
                return static::nested($tree[$part], $parts);
            } elseif (!empty($tree[$part]['children'])) {
                return static::nested($tree[$part]['children'], $parts);
            }
        } else {
            return $tree;
        }
        $value = null;
        return $value;
    }
}
