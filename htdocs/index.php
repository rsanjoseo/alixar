<?php
/**
 * Copyright (C)      2021  Rafael San José Tovar   <info@rsanjoseo.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

use Alxarafe\Core\Helpers\Dispatcher;
use DebugBar\DebugBarException;

const BASE_FOLDER = __DIR__;

$autoload_file = constant('BASE_FOLDER') . '/vendor/autoload.php';
if (!file_exists($autoload_file)) {
    die('<h1>COMPOSER ERROR</h1><p>You need to run: "composer install"</p>');
}

require_once $autoload_file;

$dispatcher = new Dispatcher();
try {
    // We launch the requested controller.
    if (!$dispatcher->run()) {
        // 404 error
        die('404 Guru meditation!');
    }
} catch (DebugBarException $e) {
    dump($e);
    die('DebugBarException');
} catch (Twig_Error_Loader $e) {
    dump($e);
    die('Twig_Error_Loader');
} catch (Twig_Error_Runtime $e) {
    dump($e);
    die('Twig_Error_Runtime');
} catch (Twig_Error_Syntax $e) {
    dump($e);
    die('Twig_Error_Sintax');
}
