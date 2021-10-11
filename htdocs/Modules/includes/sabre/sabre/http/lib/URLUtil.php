<?php

namespace Sabre\HTTP;

use Sabre\URI;

/**
 * URL utility class
 *
 * Note: this class is deprecated. All its functionality moved to functions.php
 * or sabre\uri.
 *
 * @author    Evert Pot (http://evertpot.com/)
 * @copyright Copyright (C) fruux GmbH (https://fruux.com/)
 * @deprecated
 * @license   http://sabre.io/license/ Modified BSD License
 */
class URLUtil
{

    /**
     * Encodes the path of a url.
     *
     * slashes (/) are treated as path-separators.
     *
     * @param string $path
     *
     * @return string
     * @deprecated use \Sabre\HTTP\encodePath()
     */
    static function encodePath($path)
    {

        return encodePath($path);
    }

    /**
     * Encodes a 1 segment of a path
     *
     * Slashes are considered part of the name, and are encoded as %2f
     *
     * @param string $pathSegment
     *
     * @return string
     * @deprecated use \Sabre\HTTP\encodePathSegment()
     */
    static function encodePathSegment($pathSegment)
    {

        return encodePathSegment($pathSegment);
    }

    /**
     * Decodes a url-encoded path
     *
     * @param string $path
     *
     * @return string
     * @deprecated use \Sabre\HTTP\decodePath
     */
    static function decodePath($path)
    {

        return decodePath($path);
    }

    /**
     * Decodes a url-encoded path segment
     *
     * @param string $path
     *
     * @return string
     * @deprecated use \Sabre\HTTP\decodePathSegment()
     */
    static function decodePathSegment($path)
    {

        return decodePathSegment($path);
    }

    /**
     * Returns the 'dirname' and 'basename' for a path.
     *
     * @param string $path
     *
     * @return array
     * @deprecated Use Sabre\Uri\split().
     */
    static function splitPath($path)
    {

        return Uri\split($path);
    }

    /**
     * Resolves relative urls, like a browser would.
     *
     * @param string $basePath
     * @param string $newPath
     *
     * @return string
     * @deprecated Use Sabre\Uri\resolve().
     */
    static function resolve($basePath, $newPath)
    {

        return Uri\resolve($basePath, $newPath);
    }

}
