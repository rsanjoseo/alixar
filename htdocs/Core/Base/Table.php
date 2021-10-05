<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Core\Base;

use Alxarafe\Core\Helpers\Schema;
use Alxarafe\Core\Helpers\Utils;
use Alxarafe\Core\Singletons\Config;
use Alxarafe\Database\Engine;
use Alxarafe\Database\SqlHelper;
use DebugBar\DebugBarException;

/**
 * Class Table allows access to a table using an active record.
 * It is recommended to create a descendant for each table of the database,
 * defining its tablename and structure.
 */
abstract class Table
{
    /**
     * The database engine.
     *
     * @var Engine
     */
    public static Engine $engine;

    /**
     * The database SQL Helper.
     *
     * @var SqlHelper
     */
    public static SqlHelper $sqlHelper;

    /**
     * A Config instance.
     *
     * @var Config
     */
    public static Config $config;

    /**
     * It is the name of the table.
     *
     * @var string
     */
    public string $tableName;

    /**
     * Value of the main index for the active record.
     * When a record is loaded, this field will contain its id and will be the
     * one that will be used for in the WHERE clause of the UPDATE.
     * If it does not exist in file it will contain ''.
     *
     * @var string
     */
    protected string $id;

    /**
     * It is the name of the main id field. By default, 'id'
     *
     * @var string
     */
    protected string $idField;

    /**
     * It is the name of the field name. By default 'name'.
     * TODO: See if it may not exist, in which case, null or ''?
     *
     * @var string
     */
    protected $nameField;

    /**
     * Contains an array with the table structure
     *
     * @var array
     */
    protected array $tableStructure;

    /**
     * It contains the data previous to the modification of the current record
     *
     * @var array
     */
    protected array $oldData;

    /**
     * Contains the new data of the current record.
     * It will start when loading a record and will be used when making a save.
     *
     * @var array
     */
    protected array $newData;

    /**
     * Build a Table model. $tableName is the name of the table in the database.
     * $params is a parameters array:
     * - create is true if the table is to be created if it does not exist (false by default)
     * - idField is the name of the primary key (default id)
     * - nameField is the name of the descriptive field (name by default)
     *
     * @param string $tableName
     * @param array  $params
     *
     * @throws DebugBarException
     */
    public function __construct(string $tableName, array $params = [])
    {
        self::$config = Config::getInstance();
        $this->tableName = Engine::getTablename($tableName);

        self::$engine = self::$config->getEngine();
        self::$sqlHelper = self::$config->getSqlHelper();

        $this->idField = $params['idField'] ?? 'id';
        $this->nameField = $params['nameField'] ?? 'name';
        $create = $params['create'] ?? false;

        $this->setStructure();
        $this->checkStructure($create);
    }

    /**
     * Execute a call to setTableStructure with an array containing 3 arrays with
     * the fields, keys and default values for the table.
     *
     * The development will be more ambitious than what is defined.
     *
     * Currently, Table includes a single table, but the idea is to be able to
     * relate tables to form complex data models.
     */
    public function setStructure()
    {
        $this->setTableStructure($this->tableName, [
            'fields' => $this->getFields(),
            'keys' => $this->getKeys(),
            'values' => $this->getDefaultValues(),
        ]);
    }

    /**
     * Save the structure of the table in a static array, so that it is available at all times.
     *
     * @param string $table
     * @param array  $structure
     */
    protected function setTableStructure(string $table, array $structure)
    {
        if (!isset(Schema::$bbddStructure[$table])) {
            Schema::$bbddStructure[$table] = Schema::setNormalizedStructure($structure, $table);
        }
    }

    /**
     * Return a list of fields and their table structure.
     * Each final model that needed, must overwrite it.
     *
     * @return array
     */
    public function getFields(): array
    {
        return [
            'id' => [
                'label' => 'ID.',
                'type' => 'int',
                'key' => 'PRI',
                'extra' => 'auto_increment',
            ],
        ];
    }

    /**
     * Return a list of key indexes.
     * Each final model that needed, must overwrite it.
     *
     * @return array
     */
    public function getKeys(): array
    {
        return [];
    }

    /**
     * Return a list of default values.
     * Each final model that needed, must overwrite it.
     *
     * @return array
     */
    public function getDefaultValues(): array
    {
        return [];
    }

    /**
     * Create a new table if it does not exist and it has been passed true as a parameter.
     *
     * This should check if there are differences between the defined in bbddStructure
     * and the physical table, correcting the differences if true is passed as parameter.
     *
     * @param bool $create
     *
     * @throws DebugBarException
     */
    public function checkStructure(bool $create = false)
    {
        if (isset(Schema::$bbddStructure[$this->tableName])) {
            if ($create && !Schema::tableExists($this->tableName)) {
                Schema::createTable($this->tableName);
            }
        }
    }

    /**
     * Execute a magic method of the setField or getField style
     *
     * @param string $method
     * @param array  $params
     *
     * @return string
     */
    public function __call(string $method, array $params): string
    {
        $command = substr($method, 0, 3); // set or get
        $field = Utils::camelToSnake(substr($method, 3)); // What follows set or get
        switch ($command) {
            case 'set' :
                return $this->newData[$field] = $params[0] ?? '';
            case 'get':
                return $this->newData[$field];
            default:
                dump("Review $method in $this->tableName. Error collecting the '$command/$field' attribute");
                dump($params);
                throw /** @scrutinizer ignore-call */ Exception('Program halted!');
        }
    }

    /**
     * It allows access to a field of the record using the attribute.
     * To access the name field, we should use $this->getName(), but thanks to
     * this, we can also use $this->name.
     *
     * @param string $property
     *
     * @return string
     */
    public function __get(string $property): string
    {
        return $this->newData[$property] ?? '';
    }

    /**
     * Allows you to assign value to a field in the record using the attribute.
     * De esta forma simulamos del comportamientod e FacturaScript.
     * To assign a value to the name field, we should use $this->setName('Pepe'),
     * but thanks to this, we can also use $this->name='Pepe'.
     *
     * @param string $property
     * @param string $value
     *
     * @return void
     */
    public function __set(string $property, string $value): void
    {
        $this->newData[$property] = $value;
    }

    /**
     * Returns the name of the main key field of the table (PK-Primary Key). By default, it will be id.
     *
     * @return string
     */
    public function getIdField(): string
    {
        return $this->idField;
    }

    /**
     * Returns the name of the identification field of the record. By default, it
     * will be "name".
     *
     * @return string
     */
    public function getNameField(): string
    {
        return $this->nameField;
    }

    /**
     * Returns a new instance of the table with the requested record.
     * As a previous step, a getData of the current instance is made, so both
     * will point to the same record.
     * Makes a getData and returns a new instance of the model.
     *
     * @param string $id
     *
     * @return Table
     */
    public function get(string $id): Table
    {
        $this->getData($id);
        return $this;
    }

    /**
     * This method is private. Use load instead.
     * Establishes a record as an active record.
     * If found, the $id will be in $this->id and the data in $this->newData.
     * If it is not found, $this->id will contain '' and $this->newData will
     * contain the data by default.
     *
     * @param string $id
     *
     * @return bool
     */
    private function getData(string $id): bool
    {
        $sql = "SELECT * FROM $this->tableName WHERE $this->idField='$id'";
        $data = self::$engine->select($sql);
        if (!isset($data) || count($data) == 0) {
            $this->newRecord();
            return false;
        }
        $this->newData = $data[0];
        $this->oldData = $this->newData;
        $this->id = $this->newData[$this->idField];
        return true;
    }

    /**
     * Sets the active record in a new record.
     * Note that changes made to the current active record will be lost.
     */
    private function newRecord()
    {
        $this->id = '';
        $this->newData = [];
        foreach (Schema::$bbddStructure[$this->tableName]['fields'] as $key => $value) {
            $this->newData[$key] = $value['default'] ?? '';
        }
        $this->oldData = $this->newData;
    }

    /**
     * Return an array with the current active record.
     * If an $id is indicated, it searches to change the active record before
     * returning the value.
     * Warning: If an $id is set, any unsaved data will be lost when searching
     * for the new record.
     *
     * @param string|null $id
     *
     * @return array
     */
    public function getDataArray(?string $id = null): array
    {
        if (isset($id) && ($id != $this->id)) {
            $this->getData($id);
        }
        return $this->newData;
    }

    /**
     * Establishes a record as an active record.
     * If found, the $id will be in $this->id and the data in $this->newData.
     * If it is not found, $this->id will contain '' and $this->newData will
     * contain the data by default.
     *
     * @param string $id
     *
     * @return bool
     */
    public function load(string $id): bool
    {
        return $this->getData($id);
    }

    /**
     * Saves the changes made to the active record.
     *
     * @return boolean
     */
    public function save(): bool
    {
        // We create separate arrays with the modified fields
        $fields = $values = $assigns = [];
        foreach ($this->newData as $field => $data) {
            // The first condition is to prevent nulls from becoming empty strings
            if ((!isset($this->oldData[$field]) && isset($this->newData['field'])) || $this->newData[$field] != $this->oldData[$field]) {
                $fields[] = $field;
                $values[] = "'$data'";
                $assigns[] = "$field='$data'";
            }
        }

        // If there are no modifications, we leave without error.
        if (count($fields) == 0) {
            return true;
        }

        // Insert or update the data as appropriate (insert if $this->id == '')
        $ret = ($this->id == '') ? $this->insertRecord($fields, $values) : $this->updateRecord($assigns);
        if ($ret) {
            $this->oldData = $this->newData;
        }
        return $ret;
    }

    /**
     * Insert a new record.
     * $fields is an array of fields and $values an array with the values for
     * each field in the same order.
     *
     * @param array $fields
     * @param array $values
     *
     * @return bool
     */
    private function insertRecord(array $fields, array $values): bool
    {
        $fieldList = implode(',', $fields);
        $valueList = implode(',', $values);
        $ret = self::$engine->exec("INSERT INTO  $this->tableName ($fieldList) VALUES ($valueList)");
        // Asigna el valor de la clave primaria del registro recién insertado
        $this->id = $this->newData[$this->idField] ?? self::$engine->getLastInserted();
        return $ret;
    }

    /**
     * Update the modified fields in the active record.
     * $data is an array of assignments of type field=value.
     *
     * @param array $data
     *
     * @return bool
     */
    private function updateRecord(array $data): bool
    {
        $value = implode(',', $data);
        return self::$engine->exec("UPDATE $this->tableName SET $value WHERE $this->idField='$this->id'");
    }

    /**
     * Returns the structure of the normalized table
     *
     * @return array
     */
    public function getStructure(): array
    {
        return Schema::$bbddStructure[$this->tableName];
    }

    /**
     * Get an array with all data
     *
     * @return array
     */
    public function getAllRecords(): array
    {
        $sql = "SELECT * FROM  $this->tableName";
        return self::$engine->select($sql);
    }

    /**
     * Perform a search of a record by the name, returning the id of the
     * corresponding record, or '' if it is not found or does not have a
     * name field.
     *
     * @param string $name
     *
     * @return string
     */
    public function getIdByName(string $name): string
    {
        if ($this->nameField == '') {
            return '';
        }

        $sql = "SELECT $this->idField AS id FROM $this->tableName WHERE $this->nameField='$name'";
        $data = self::$engine->select($sql);
        if (!empty($data) && count($data) > 0) {
            return $data[0]['id'];
        }

        return '';
    }
}
