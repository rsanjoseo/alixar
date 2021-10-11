<?php

namespace Luracast\Restler;

/**
 * Interface for creating authentication classes
 *
 * @author     R.Arul Kumaran <arul@luracast.com>
 * @package    Restler
 * @subpackage auth
 * @category   Framework
 * @copyright  2010 Luracast
 * @license    http://www.opensource.org/licenses/lgpl-license.php LGPL
 * @link       http://luracast.com/products/restler/
 *
 */
interface iAuthenticate extends iFilter
{
    /**
     * @return string string to be used with WWW-Authenticate header
     * @example Basic
     * @example Digest
     * @example OAuth
     */
    public function __getWWWAuthenticateString();
}
