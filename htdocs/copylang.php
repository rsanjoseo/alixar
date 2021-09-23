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

/**
 * This program copies the language files in Dolibarr format to the YAML format used by the Translate library.
 *
 * @deprecated Once transferred, it would no longer be necessary.
 */

require_once 'vendor/autoload.php';

use Symfony\Component\Yaml\Yaml;

$route = 'langs/';

$directories = scandir($route);
foreach ($directories as $directory) {
    if (!is_dir($route . $directory) || in_array($directory, ['.', '..'])) {
        continue;
    }
    $files = scandir($route . $directory);
    $data = [];
    foreach ($files as $file_name) {
        if (in_array($file_name, ['.', '..'])) {
            continue;
        }
        $file = $route . $directory . '/' . $file_name;
        echo "<p>Reading '$file'</p>";
        if ($file_pointer = @fopen($file, "rt")) {
            while (($line = fscanf($file_pointer, "%[^= ]%*[ =]%[^\n\r]")) !== false) {
                if (!in_array($line[0], ['#', '##', "\n"])) {
                    $data[$line[0]] = $line[1];
                }
            }
        }
        $new_name = substr($file_name, 0, -5); // Delete extension .lang.
        if ($new_name === 'languages') {
            $target_dir = 'Languages';
        } else {
            $target_dir = 'Modules/' . snakeToCamel($new_name) . '/Languages';
            mkdir($target_dir, 0664, true);
        }
        $target_file = $target_dir . "/$directory.yaml";
        echo "<p>Creating $target_file file.";
        file_put_contents($target_file, Yaml::dump($data));
    }
}
