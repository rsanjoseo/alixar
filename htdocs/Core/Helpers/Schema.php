<?php
/**
 * Copyright (C) 2021-2021  Rafael San José Tovar   <info@rsanjoseo.com>
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

namespace Alxarafe\Core\Helpers;

use Alxarafe\Core\Singletons\Config;
use Alxarafe\Database\Engine;
use DebugBar\DebugBarException;

/**
 * The Schema class contains static methods that allow you to manipulate the
 * database. It is used to create and modify tables and indexes in the database.
 */
class Schema
{
    /**
     * Carriage Return and Line Feed
     */
    const CRLF = "\r\n";

    /**
     * Contains the database structure data.
     * Each table is an index of the associative array.
     *
     * @var array
     */
    public static array $bbddStructure;

    /**
     * Return true if $tableName exists in database
     *
     * @param string $tableName
     *
     * @return bool
     * @throws DebugBarException
     */
    public static function tableExists($tableName): bool
    {
        $dbName = Config::getInstance()->getVar('database', 'main', 'dbName');
        $data = Engine::select("SELECT COUNT(*) AS Total FROM information_schema.tables WHERE table_schema = '{$dbName}' AND table_name='{$tableName}'");
        $result = reset($data);
        return $result['Total'] === '1';
    }

    /**
     * Normalize an array that has the file structure defined in the model by setStructure,
     * so that it has fields with all the values it must have. Those that do not exist are
     * created with the default value, avoiding having to do the check each time, or
     * calculating their value based on the data provided by the other fields.
     *
     * It also ensures that the keys and default values exist as an empty array if they
     * did not exist.
     *
     * @param array  $structure
     * @param string $tableName
     *
     * @return array
     */
    public static function setNormalizedStructure(array $structure, string $tableName): array
    {
        $ret['keys'] = $structure['keys'] ?? [];
        $ret['values'] = $structure['values'] ?? [];
        foreach ($structure['fields'] as $key => $value) {
            $ret['fields'][$key] = self::normalizeField($tableName, $key, $value);
        }
        return $ret;
    }

    /**
     * Take the definition of a field, and make sure you have all the information
     * that is necessary for its creation or maintenance, calculating the missing
     * data if possible.
     * It can cause an exception if some vital data is missing, but this should
     * only occur at the design stage.
     *
     * @param string $tableName
     * @param string $field
     * @param array  $structure
     *
     * @return array
     */
    static protected function normalizeField(string $tableName, string $field, array $structure): array
    {
        if (!isset($structure['type'])) {
            dump("The type parameter is mandatory in {$field}. Error in table " . $tableName);
            dump($structure);
        }

        $dbType = $structure['type'];

        if ($dbType == 'boolean') {
            $dbType = 'tinyint';
            $structure['min'] = 0;
            $structure['max'] = 1;
        }

        if ($dbType == 'int' || $dbType == 'tinyint' || $dbType == 'number') {
            $type = 'number';
        } else {
            if ($dbType == 'float') {
                $type = 'float';
            } else {
                if ($dbType == 'double') {
                    $type = 'double';
                } else {
                    if ($dbType == 'char' || $dbType == 'varchar' || $dbType == 'text') {
                        $type = 'text';
                    } else {
                        if ($dbType == 'date') {
                            $type = 'date';
                        } else {
                            if ($dbType == 'datetime' || $dbType == 'timestamp') {
                                $type = 'datetime-local';
                            } else {
                                echo "<p>Check Schema.normalizeField if you think that {$dbType} might be necessary.</p>";
                                die("Type {$dbType} is not valid for field {$field} of table {$tableName}");
                            }
                        }
                    }
                }
            }
        }

        $min = (isset($structure['min'])) ? $structure['min'] : 0;
        $max = (isset($structure['max'])) ? $structure['max'] : 0;
        $default = (isset($structure['default'])) ? $structure['default'] : null;
        $label = (isset($structure['label'])) ? $structure['label'] : $field;
        $unsigned = (!isset($structure['unsigned']) || $structure['unsigned'] == true);
        $null = ((isset($structure['null'])) && $structure['null'] == true);

        $ret = [];
        if ($type == 'text') {
            if ($max == 0) {
                $max = DEFAULT_STRING_LENGTH;
            }
            $dbType = "$dbType($max)";
            $ret['pattern'] = '.{' . $min . ',' . $max . '}';
        } else {
            if ($type == 'number') {
                if ($default === true) {
                    $default = '1';
                }
                if ($max == 0) {
                    $tmpLength = DEFAULT_INTEGER_SIZE;
                    $max = pow(10, $tmpLength) - 1;
                } else {
                    $tmpLength = strlen($max);
                }

                if ($min == 0) {
                    $min = $unsigned ? 0 : -$max;
                } else {
                    if ($tmpLength < strlen($min)) {
                        $tmpLength = strlen($min);
                    }
                }

                if (isset($structure['decimals'])) {
                    $decimales = $structure['decimals'];
                    $precision = pow(10, -$decimales);
                    $tmpLength += $decimales;
                    $dbType = "decimal($tmpLength,$decimales)" . ($unsigned ? ' unsigned' : '');
                    $ret['min'] = $min == 0 ? 0 : ($min < 0 ? $min - 1 + $precision : $min + 1 - $precision);
                    $ret['max'] = $max > 0 ? $max + 1 - $precision : $max - 1 + $precision;
                } else {
                    $precision = null;
                    $dbType = "integer($tmpLength)" . ($unsigned ? ' unsigned' : '');
                    $ret['min'] = $min;
                    $ret['max'] = $max;
                }
            }
        }

        $ret['type'] = $type;
        $ret['dbtype'] = $dbType;
        $ret['default'] = $default;
        $ret['null'] = $null;
        $ret['label'] = $label;
        if (isset($precision)) {
            $ret['step'] = $precision;
        }
        if (isset($structure['key'])) {
            $ret['key'] = $structure['key'];
        }
        if (isset($structure['placeholder'])) {
            $ret['placeholder'] = $structure['placeholder'];
        }
        if (isset($structure['extra'])) {
            $ret['extra'] = $structure['extra'];
        }
        if (isset($structure['help'])) {
            $ret['help'] = $structure['help'];
        }
        if (isset($structure['unique']) && $structure['unique']) {
            $ret['unique'] = $structure['unique'];
        }

        if (isset($structure['relations'][$field]['table'])) {
            $ret['relation'] = [
                'table' => $structure['relations'][$field]['table'],
                'id' => isset($structure['relations'][$field]['id']) ? $structure['relations'][$field]['id'] : 'id',
                'name' => isset($structure['relations'][$field]['name']) ? $structure['relations'][$field]['name'] : 'name',
            ];
        }

        return $ret;
    }

    /**
     * Create a table in the database.
     * Build the default fields, indexes and values defined in the model.
     *
     * @param string $tableName
     *
     * @return bool
     * @throws DebugBarException
     */
    public static function createTable(string $tableName): bool
    {
        $tabla = self::$bbddStructure[$tableName];
        $sql = self::createFields($tableName, $tabla['fields']);

        foreach ($tabla['keys'] as $name => $index) {
            $sql .= self::createIndex($tableName, $name, $index);
        }
        $sql .= self::setValues($tableName, $tabla['values']);
        return Engine::exec($sql);
    }

    /**
     * Build the SQL statement to create the fields in the table.
     * It can also create the primary key if the auto_increment attribute is defined.
     *
     * @param string $tablename
     * @param array  $fieldList
     *
     * @return string
     */
    static protected function createFields(string $tablename, array $fieldList): string
    {
        $sql = "CREATE TABLE $tablename ( ";
        foreach ($fieldList as $index => $col) {
            if (!isset($col['dbtype'])) {
                die('Tipo no especificado en createTable');
            }

            $sql .= '`' . $index . '` ' . $col['dbtype'];
            $nulo = isset($col['null']) && $col['null'];

            $sql .= ($nulo ? '' : ' NOT') . ' NULL';

            if (isset($col['extra']) && (strtolower($col['extra']) == 'auto_increment')) {
                $sql .= ' PRIMARY KEY AUTO_INCREMENT';
            }

            $tmpDefecto = $col['default'] ?? null;
            $defecto = '';
            if (isset($tmpDefecto)) {
                if ($tmpDefecto == 'CURRENT_TIMESTAMP') {
                    $defecto = "$tmpDefecto";
                } else {
                    $defecto = "'$tmpDefecto'";
                }
            } else {
                if ($nulo) {
                    $defecto = 'NULL';
                }
            }

            if ($defecto != '') {
                $sql .= ' DEFAULT ' . $defecto;
            }

            $sql .= ', ';
        }
        $sql = substr($sql, 0, -2); // Quitamos la coma y el espacio del final
        $sql .= ') ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;' . self::CRLF;

        return $sql;
    }

    /**
     * Create the SQL statements for the construction of one index.
     * In the case of the primary index, it is not necessary if it is auto_increment.
     *
     * TODO:
     *
     * Moreover, it should not be defined if it is auto_increment because it would
     * generate an error when it already exists.
     *
     * @param string $tableName
     * @param string $indexname
     * @param array  $indexData
     *
     * @return string
     */
    static protected function createIndex($tableName, $indexname, $indexData)
    {
        $sql = "ALTER TABLE $tableName ADD CONSTRAINT $indexname ";

        $command = '';
        // https://www.w3schools.com/sql/sql_primarykey.asp
        // ALTER TABLE Persons ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);
        if (isset($indexData['PRIMARY'])) {
            $command = 'PRIMARY KEY ';
            $fields = $indexData['PRIMARY'];
        }

        // https://www.w3schools.com/sql/sql_create_index.asp
        // CREATE INDEX idx_pname ON Persons (LastName, FirstName);
        if (isset($indexData['INDEX'])) {
            $command = 'INDEX ';
            $fields = $indexData['INDEX'];
        }

        // https://www.w3schools.com/sql/sql_unique.asp
        // ALTER TABLE Persons ADD CONSTRAINT UC_Person UNIQUE (ID,LastName);
        if (isset($indexData['UNIQUE'])) {
            $command = 'UNIQUE INDEX ';
            $fields = $indexData['UNIQUE'];
        }

        if ($command == '') {
            // https://www.w3schools.com/sql/sql_foreignkey.asp
            // ALTER TABLE Orders ADD CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);
            if (isset($indexData['FOREIGN'])) {
                $command = 'FOREIGN KEY ';
                $foreignField = $indexData['FOREIGN'];
                if (isset($indexData['REFERENCES'])) {
                    $references = $indexData['REFERENCES'];
                    if (!is_array($references)) {
                        die('Esperaba un array en REFERENCES: ' . $tableName . '/' . $indexname);
                    }
                    if (count($references) != 1) {
                        die('Esperaba un array de 1 elemento en REFERENCES: ' . $tableName . '/' . $indexname);
                    }
                    $refTable = key($references);
                    $fields = '(' . implode(',', $references) . ')';
                } else {
                    die('FOREIGN necesita REFERENCES en ' . $tableName . '/' . $indexname);
                }

                $sql .= $command . ' ' . $foreignField . ' REFERENCES ' . $refTable . $fields;

                if (isset($indexData['ON']) && is_array($indexData['ON'])) {
                    foreach ($indexData['ON'] as $key => $value) {
                        $sql .= ' ON ' . $key . ' ' . $value . ', ';
                    }
                    $sql = substr($sql, 0, -2); // Quitamos el ', ' de detrás
                }
            }
        } else {
            if (is_array($fields)) {
                $fields = '(' . implode(',', $fields) . ')';
            } else {
                $fields = "($fields)";
            }

            if ($command == 'INDEX ') {
                $sql = "CREATE INDEX {$indexname} ON {$tableName}" . $fields;
            } else {
                $sql .= $command . ' ' . $fields;
            }
        }

        return $sql . ';' . self::CRLF;
    }

    /**
     * Create the SQL statements to fill the table with default data.
     *
     * @param string $tableName
     * @param array  $values
     *
     * @return string
     */
    static protected function setValues(string $tableName, array $values): string
    {
        $sql = "INSERT INTO $tableName ";
        $header = true;
        foreach ($values as $value) {
            $fields = "(";
            $datos = "(";
            foreach ($value as $fname => $fvalue) {
                $fields .= $fname . ", ";
                $datos .= "'$fvalue'" . ", ";
            }
            $fields = substr($fields, 0, -2) . ") ";
            $datos = substr($datos, 0, -2) . "), ";

            if ($header) {
                $sql .= $fields . " VALUES ";
                $header = false;
            }

            $sql .= $datos;
        }

        return substr($sql, 0, -2) . self::CRLF;
    }
}
