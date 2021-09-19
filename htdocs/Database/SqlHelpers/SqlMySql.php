<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Database\SqlHelpers;

use Alxarafe\Core\Helpers\Utils;
use Alxarafe\Core\Singletons\Config;
use Alxarafe\Core\Singletons\DebugTool;
use Alxarafe\Database\SqlHelper;

/**
 * Personalization of SQL queries to use MySQL.
 */
class SqlMySql extends SqlHelper
{
    /**
     * SqlMySql constructor.
     */
    public function __construct()
    {
        $this->tableQuote = '`';
        $this->fieldQuote = '"';
        $this->fieldTypes = [
            'integer' => ['int', 'tinyint'],
            'string' => ['varchar'],
            'float' => ['real', 'double'],
            'date' => ['date'],
            'datetime' => ['datetime'],
        ];
    }

    /**
     * Returns an array with the name of all the tables in the database.
     *
     * @return array
     */
    public function getTables(): array
    {
        $query = 'SHOW TABLES';
        return Utils::flatArray(Config::$dbEngine->select($query));
    }

    /**
     * SQL statement that returns the fields in the table
     *
     * @param string $tableName
     *
     * @return string
     */
    public function getColumnsSql(string $tableName): string
    {
        /**
         * array (size=6)
         * 'Field' => string 'id' (length=2)
         * 'Type' => string 'int(10) unsigned' (length=16)
         * 'Null' => string 'NO' (length=2)
         * 'Key' => string 'PRI' (length=3)
         * 'Default' => null
         * 'Extra' => string 'auto_increment' (length=14)
         */
        return 'SHOW COLUMNS FROM ' . $this->quoteTableName($tableName) . ';';
    }

    /**
     * Modifies the structure returned by the query generated with
     * getColumnsSql to the normalized format that returns getColumns
     *
     * @param array $row
     *
     * @return array
     */
    public function normalizeFields(array $row): array
    {
        $result = [];
        $result['field'] = $row['Field'];
        $type = $this->splitType($row['Type']);

        /**
         * I thought that this would work
         *
         * $virtualType = array_search($type['type'], $this->fieldTypes);
         */
        $virtualType = $type['type'];
        foreach ($this->fieldTypes as $key => $values) {
            if (in_array($type['type'], $values)) {
                $virtualType = $key;
                break;
            }
        }

        $result['type'] = $virtualType;
        if ($virtualType === false) {
            $result['type'] = $type['type'];
            DebugTool::getInstance()->addMessage('Deprecated', 'Correct the data type ' . $type['type'] . ' in MySql database');
        }
        $result['length'] = $type['length'] ?? null;
        $result['default'] = $row['Default'] ?? null;
        $result['nullable'] = $row['Null'];
        $result['primary'] = $row['Key'];
        $result['autoincrement'] = $row['Extra'] == 'auto_increment' ? 1 : 0;

        return $result;
    }

    /**
     * Divide the data type of a MySQL field into its various components: type,
     * length, unsigned or zerofill, if applicable.
     *
     * @param string $originalType
     *
     * @return array
     */
    private static function splitType(string $originalType): array
    {
        $explode = explode(' ', strtolower($originalType));

        $pos = strpos($explode[0], '(');

        $type = $pos ? substr($explode[0], 0, $pos) : $explode[0];
        $length = $pos ? intval(substr($explode[0], $pos + 1)) : null;

        $pos = array_search('unsigned', $explode);
        $unsigned = $pos ? 'unsigned' : null;

        $pos = array_search('zerofill', $explode);
        $zerofill = $pos ? 'zerofill' : null;

        return ['type' => $type, 'length' => $length, 'unsigned' => $unsigned, 'zerofill' => $zerofill];
    }

    /**
     * Returns an array with the index information, and if there are, also constraints.
     *
     * @param array $row
     *
     * @return array
     */
    public function normalizeIndexes(array $row): array
    {
        $result = [];
        $result['index'] = $row['Key_name'];
        $result['column'] = $row['Column_name'];
        $result['unique'] = $row['Non_unique'] == '0' ? 1 : 0;
        $result['nullable'] = $row['Null'] == 'YES' ? 1 : 0;
        $constrait = $this->getConstraintData($row['Table'], $row['Key_name']);
        if (count($constrait) > 0) {
            $result['constraint'] = $constrait[0]['CONSTRAINT_NAME'];
            $result['referencedtable'] = $constrait[0]['REFERENCED_TABLE_NAME'];
            $result['referencedfield'] = $constrait[0]['REFERENCED_COLUMN_NAME'];
        }
        $constrait = $this->getConstraintRules($row['Table'], $row['Key_name']);
        if (count($constrait) > 0) {
            $result['matchoption'] = $constrait[0]['MATCH_OPTION'];
            $result['updaterule'] = $constrait[0]['UPDATE_RULE'];
            $result['deleterule'] = $constrait[0]['DELETE_RULE'];
        }
        return $result;
    }

    /**
     * The data about the constraint that is found in the KEY_COLUMN_USAGE table
     * is returned.
     * Attempting to return the consolidated data generates an extremely slow query
     * in some MySQL installations, so 2 additional simple queries are made.
     *
     * @param string $tableName
     * @param string $constraintName
     *
     * @return array
     */
    private function getConstraintData(string $tableName, string $constraintName): array
    {
        $dbName = Config::getVar('dbName') ?? 'Unknown';

        return Config::$dbEngine->select('
SELECT
	TABLE_NAME,
	COLUMN_NAME,
	CONSTRAINT_NAME,
	REFERENCED_TABLE_NAME,
	REFERENCED_COLUMN_NAME
FROM
	INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
	TABLE_SCHEMA = ' . $this->quoteFieldName($dbName) . ' AND
	TABLE_NAME = ' . $this->quoteFieldName($tableName) . ' AND
	constraint_name = ' . $this->quoteFieldName($constraintName) . ' AND
	REFERENCED_COLUMN_NAME IS NOT NULL;
        ');
    }

    /**
     * The rules for updating and deleting data with constraint (table
     * REFERENTIAL_CONSTRAINTS) are returned.
     * Attempting to return the consolidated data generates an extremely slow query
     * in some MySQL installations, so 2 additional simple queries are made.
     *
     * @param string $tableName
     * @param string $constraintName
     *
     * @return array
     */
    private function getConstraintRules(string $tableName, string $constraintName): array
    {
        $dbName = Config::getVar('dbName') ?? 'Unknown';

        return Config::$dbEngine->select('
SELECT
	MATCH_OPTION,
	UPDATE_RULE,
	DELETE_RULE
FROM information_schema.REFERENTIAL_CONSTRAINTS
WHERE
	constraint_schema = ' . $this->quoteFieldName($dbName) . ' AND
	table_name = ' . $this->quoteFieldName($tableName) . ' AND
	constraint_name = ' . $this->quoteFieldName($constraintName) . ';
        ');
    }

    /**
     * Obtain an array with the basic information about the indexes of the table,
     * which will be supplemented with the restrictions later.
     *
     * @param string $tableName
     *
     * @return string
     */
    public function getIndexesSql(string $tableName): string
    {
        // https://stackoverflow.com/questions/5213339/how-to-see-indexes-for-a-database-or-table-in-mysql

        return 'SHOW INDEX FROM ' . Config::getInstance()->getSqlHelper()->quoteTableName($tableName);
    }
}
