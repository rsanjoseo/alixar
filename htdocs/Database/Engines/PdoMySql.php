<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Database\Engines;

use Alxarafe\Database\Engine;
use PDO;

/**
 * Personalization of PDO to use MySQL.
 */
class PdoMySql extends Engine
{

    /**
     * PdoMySql constructor.
     * Add aditional parameters to self::$dsn string.
     *
     * @param array $dbConfig
     */
    public function __construct(array $dbConfig)
    {
        parent::__construct($dbConfig);
        self::$dsn = "mysql:dbname=" . self::$dbConfig['dbName'] . ";host=" . self::$dbConfig['dbHost'] . ";charset=UTF8";
    }

    /**
     * Connect to the database.
     *
     * @param array $config
     *
     * @return bool
     */
    public function connect(array $config = []): bool
    {
        $config[PDO::ATTR_EMULATE_PREPARES] = 1;
        $config[PDO::MYSQL_ATTR_INIT_COMMAND] = 'SET NAMES utf8';
        return parent::connect($config);
    }

}
