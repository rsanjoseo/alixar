<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Database;

use Alxarafe\Core\Singletons\Config;
use Alxarafe\Core\Singletons\DebugTool;
use DebugBar\DataCollector\PDO\PDOCollector;
use DebugBar\DataCollector\PDO\TraceablePDO;
use DebugBar\DebugBarException;
use Exception;
use PDO;
use PDOException;
use PDOStatement;

/**
 * Engine provides generic support for databases.
 * The class will have to be extended by completing the particularities of each of them.
 */
abstract class Engine
{
    /**
     * @var DebugTool
     */
    static DebugTool $debug;

    /**
     * Data Source Name
     *
     * @var string
     */
    static protected string $dsn;

    /**
     * Array that contains the access data to the database.
     *
     * @var array
     */
    static protected array $dbConfig;

    /**
     * The handler of the database.
     *
     * @var PDO
     */
    static protected PDO $dbHandler;

    /**
     * Represents a prepared statement and, after the statement is executed,
     * an associated result set.
     *
     * @var PDOStatement|false
     */
    static protected $statement;

    /**
     * True if the database engine supports SAVEPOINT in transactions
     *
     * @var bool
     */
    static protected bool $savePointsSupport = true;

    /**
     * Number of transactions in execution
     *
     * @var int
     */
    static protected int $transactionDepth = 0;

    /**
     * @deprecated Dolibarr inheritance
     */
    private $_results;

    /**
     * Engine constructor
     *
     * @param array $dbConfig
     */
    public function __construct(array $dbConfig)
    {
        self::$dbConfig = $dbConfig;
        self::$debug = DebugTool::getInstance();
    }

    /**
     * Obtain an array with the available engines
     *
     * @return array
     */
    public static function getEngines(): array
    {
        $path = constant('BASE_FOLDER') . '/Database/Engines';
        $engines = scandir($path);
        $ret = [];
        foreach ($engines as $engine) {
            if ($engine != '.' && $engine != '..' && substr($engine, -4) == '.php') {
                $ret[] = substr($engine, 0, strlen($engine) - 4);
            }
        }
        return $ret;
    }

    /**
     * Returns the name of the table, with a prefix, if one has been defined for the database, and in lowercase.
     *
     * @param $tablename
     *
     * @return string
     */
    public static function getTablename($tablename): string
    {
        return strtolower(Config::getVar('database', 'main', 'dbPrefix') . $tablename);
    }

    /**
     * Engine destructor
     *
     * @throws DebugBarException
     */
    public function __destruct()
    {
        $this->rollbackTransactions();
    }

    /**
     * Undo all active transactions
     *
     * @throws DebugBarException
     */
    final public function rollbackTransactions()
    {
        while (self::$transactionDepth > 0) {
            $this->rollback();
        }
    }

    /**
     * Rollback current transaction,
     *
     * @return bool
     * @throws PDOException if there is no transaction started
     */
    final public function rollBack(): bool
    {
        $ret = true;

        if (self::$transactionDepth == 0) {
            throw new PDOException('Rollback error : There is no transaction started');
        }

        self::$debug->addMessage('SQL', 'Rollback, savepoint LEVEL' . self::$transactionDepth);
        self::$transactionDepth--;

        if (self::$transactionDepth == 0 || !self::$savePointsSupport) {
            $ret = self::$dbHandler->rollBack();
        } else {
            $this->exec('ROLLBACK TO SAVEPOINT LEVEL' . self::$transactionDepth);
        }

        return $ret;
    }

    /**
     * Execute SQL statements on the database (INSERT, UPDATE or DELETE).
     *
     * @param string $query
     *
     * @return bool
     */
    final public static function exec(string $query): bool
    {
        self::$statement = self::$dbHandler->prepare($query);
        if (self::$statement != null && self::$statement) {
            return self::$statement->execute([]);
        }
        return false;
    }

    /**
     * Returns the id of the last inserted record. Failing that, it returns ''.
     *
     * @return string
     */
    final public function getLastInserted(): string
    {
        $data = $this->select('SELECT @@identity AS id');
        if (count($data) > 0) {
            return $data[0]['id'];
        }
        return '';
    }

    /**
     * Executes a SELECT SQL statement on the database, returning the result in an array.
     * In case of failure, return NULL. If there is no data, return an empty array.
     *
     * @param string $query
     *
     * @return array
     */
    public static function select(string $query): array
    {
        self::$statement = self::$dbHandler->prepare($query);
        if (self::$statement != null && self::$statement && self::$statement->execute([])) {
            return self::$statement->fetchAll(PDO::FETCH_ASSOC);
        }
        return [];
    }

    /**
     * Checks if there is an active connection to the database.
     *
     * @return bool
     */
    public function checkConnection(): bool
    {
        return (self::$dbHandler != null);
    }

    /**
     * Establish a connection to the database.
     * If a connection already exists, it returns it. It does not establish a new one.
     * Returns true in case of success, assigning the handler to self::$dbHandler.
     *
     * @param array $config
     *
     * @return bool
     * @throws DebugBarException
     */
    public function connect(array $config = []): bool
    {
        if (isset(self::$dbHandler)) {
            self::$debug->addMessage('SQL', "PDO: Already connected " . self::$dsn);
            return true;
        }
        self::$debug->addMessage('SQL', "PDO: " . self::$dsn);
        try {
            // Logs SQL queries. You need to wrap your PDO object into a DebugBar\DataCollector\PDO\TraceablePDO object.
            // http://phpdebugbar.com/docs/base-collectors.html
            self::$dbHandler = new TraceablePDO(new PDO(self::$dsn, self::$dbConfig['dbUser'], self::$dbConfig['dbPass'], $config));
            self::$debug->debugBar->addCollector(new PDOCollector(self::$dbHandler));
        } catch (PDOException $e) {
            self::$debug->addException($e);
            return false;
        }
        return isset(self::$dbHandler);
    }

    /**
     * Prepares a statement for execution and returns a statement object
     * http://php.net/manual/en/pdo.prepare.php
     *
     * @param string $sql
     * @param array  $options
     *
     * @return bool
     */
    final public function prepare(string $sql, array $options = []): bool
    {
        if (!isset(self::$dbHandler)) {
            return false;
        }
        self::$statement = self::$dbHandler->prepare($sql, $options);
        return (self::$statement != false);
    }
    /**
     * Transactions support
     * https://coderwall.com/p/rml5fa/nested-pdo-transactions
     */

    /**
     * Executes a prepared statement
     * http://php.net/manual/en/pdostatement.execute.php
     *
     * @param array $inputParameters
     *
     * @return bool
     */
    final public function execute(array $inputParameters = []): bool
    {
        if (!isset(self::$statement) || !self::$statement) {
            return false;
        }
        return self::$statement->execute($inputParameters);
    }

    /**
     * Start transaction
     * source: https://www.ibm.com/support/knowledgecenter/es/SSEPGG_9.1.0/com.ibm.db2.udb.apdv.php.doc/doc/t0023166.htm
     *
     * @return bool
     */
    final public function beginTransaction(): bool
    {
        if (self::$transactionDepth == 0 || !self::$savePointsSupport) {
            $ret = self::$dbHandler->beginTransaction();
        } else {
            $ret = $this->exec('SAVEPOINT LEVEL' . self::$transactionDepth);
        }

        if (!$ret) {
            return false;
        }
        self::$transactionDepth++;
        self::$debug->addMessage('SQL', 'Transaction started, savepoint LEVEL' . self::$transactionDepth . ' saved');

        return true;
    }

    /**
     * Commit current transaction
     *
     * @return bool
     */
    final public function commit(): bool
    {
        $ret = true;

        self::$debug->addMessage('SQL', 'Commit, savepoint LEVEL' . self::$transactionDepth);
        self::$transactionDepth--;

        if (self::$transactionDepth == 0 || !self::$savePointsSupport) {
            $ret = self::$dbHandler->commit();
        } else {
            $this->exec('RELEASE SAVEPOINT LEVEL' . self::$transactionDepth);
        }

        return $ret;
    }

    /**
     *    Decrypt sensitive data in database
     *
     * @param string $value Value to decrypt
     *
     * @return    string                    Decrypted value if used
     */
    public function decrypt($value)
    {
        global $conf;

        // Type of encryption (2: AES (recommended), 1: DES , 0: no encryption)
        $cryptType = (!empty($conf->db->dolibarr_main_db_encryption) ? $conf->db->dolibarr_main_db_encryption : 0);

        //Encryption key
        $cryptKey = (!empty($conf->db->dolibarr_main_db_cryptkey) ? $conf->db->dolibarr_main_db_cryptkey : '');

        $return = $value;

        if ($cryptType && !empty($cryptKey)) {
            if ($cryptType == 2) {
                $return = 'AES_DECRYPT(' . $value . ',\'' . $cryptKey . '\')';
            } elseif ($cryptType == 1) {
                $return = 'DES_DECRYPT(' . $value . ',\'' . $cryptKey . '\')';
            }
        }

        return $return;
    }

    /**
     * Execute an SQL request and return the resultset
     *
     * @param        $query
     * @param int    $usesavepoint
     * @param string $type
     * @param int    $result_mode
     *
     * @return false
     * @throws Exception
     */
    public function query($query, $usesavepoint = 0, $type = 'auto', $result_mode = 0)
    {
        global $conf, $dolibarr_main_db_readonly;

        $query = trim($query);

        if (!in_array($query, ['BEGIN', 'COMMIT', 'ROLLBACK'])) {
            $SYSLOG_SQL_LIMIT = 10000; // limit log to 10kb per line to limit DOS attacks
            dol_syslog('sql=' . substr($query, 0, $SYSLOG_SQL_LIMIT), LOG_DEBUG);
        }
        if (empty($query)) {
            return false; // Return false = error if empty request
        }

        if (!empty($dolibarr_main_db_readonly)) {
            if (preg_match('/^(INSERT|UPDATE|REPLACE|DELETE|CREATE|ALTER|TRUNCATE|DROP)/i', $query)) {
                $this->lasterror = 'Application in read-only mode';
                $this->lasterrno = 'APPREADONLY';
                $this->lastquery = $query;
                return false;
            }
        }

        /*
        if (!$this->database_name) {
            // Ordre SQL ne necessitant pas de connexion a une base (exemple: CREATE DATABASE)
            $ret = $this->db->query($query, $result_mode);
        } else {
            $ret = $this->db->query($query, $result_mode);
        }
        */
        $ret = self::$dbHandler->query($query, $result_mode);

        if (!preg_match("/^COMMIT/i", $query) && !preg_match("/^ROLLBACK/i", $query)) {
            // Si requete utilisateur, on la sauvegarde ainsi que son resultset
            if (!$ret) {
                $this->lastqueryerror = $query;
                $this->lasterror = $this->error();
                $this->lasterrno = $this->errno();

                if ($conf->global->SYSLOG_LEVEL < LOG_DEBUG) {
                    dol_syslog(get_class($this) . "::query SQL Error query: " . $query, LOG_ERR); // Log of request was not yet done previously
                }
                dol_syslog(get_class($this) . "::query SQL Error message: " . $this->lasterrno . " " . $this->lasterror, LOG_ERR);
                //var_dump(debug_print_backtrace());
            }
            $this->lastquery = $query;
            $this->_results = $ret;
        }

        return $ret;
    }

    /**
     *    Libere le dernier resultset utilise sur cette connexion
     *
     * @param mysqli_result $resultset Curseur de la requete voulue
     *
     * @return    void
     */
    public function free($resultset = null)
    {
        return;
        /*
        // If resultset not provided, we take the last used by connexion
        if (!is_object($resultset)) {
            $resultset = $this->_results;
        }
        // Si resultset en est un, on libere la memoire
        if (is_object($resultset)) {
            $resultset->free_result();
        }
        */
    }

    /**
     *    Return number of lines for result of a SELECT
     *
     * @param mysqli_result $resultset Resulset of requests
     *
     * @return    int                Nb of lines
     * @see    affected_rows()
     */
    public function num_rows($resultset)
    {
        if (!is_object($resultset)) {
            $resultset = $this->_results;
        }
        return $resultset->rowCount();
    }

    /**
     *    Returns the current line (as an object) for the resultset cursor
     *
     * @param mysqli_result $resultset Curseur de la requete voulue
     *
     * @return    object|null                    Object result line or null if KO or end of cursor
     */
    public function fetch_object($resultset)
    {
        // phpcs:enable
        // Si le resultset n'est pas fourni, on prend le dernier utilise sur cette connexion
        if (!is_object($resultset)) {
            $resultset = $this->_results;
        }
        return $resultset->fetchObject();
    }

    /**
     *    Escape a string to insert data
     *
     * @param string $stringtoencode String to escape
     *
     * @return    string                        String escaped
     *
     * @deprecated use prepare
     */
    public function escape($stringtoencode)
    {
        return $stringtoencode;
    }

    /**
     * Define sort criteria of request
     *
     * @param string $sortfield List of sort fields, separated by comma. Example: 't1.fielda,t2.fieldb'
     * @param string $sortorder Sort order, separated by comma. Example: 'ASC,DESC';
     *
     * @return    string                        String to provide syntax of a sort sql string
     */
    public function order($sortfield = null, $sortorder = null)
    {
        if (!empty($sortfield)) {
            $oldsortorder = '';
            $return = '';
            $fields = explode(',', $sortfield);
            $orders = explode(',', $sortorder);
            $i = 0;
            foreach ($fields as $val) {
                if (!$return) {
                    $return .= ' ORDER BY ';
                } else {
                    $return .= ', ';
                }

                $return .= preg_replace('/[^0-9a-z_\.]/i', '', $val); // Add field

                $tmpsortorder = (empty($orders[$i]) ? '' : trim($orders[$i]));

                // Only ASC and DESC values are valid SQL
                if (strtoupper($tmpsortorder) === 'ASC') {
                    $oldsortorder = 'ASC';
                    $return .= ' ASC';
                } elseif (strtoupper($tmpsortorder) === 'DESC') {
                    $oldsortorder = 'DESC';
                    $return .= ' DESC';
                } else {
                    $return .= ' ' . ($oldsortorder ? $oldsortorder : 'ASC');
                }

                $i++;
            }
            return $return;
        } else {
            return '';
        }
    }

    /**
     * Close database connexion
     *
     * @return  boolean                        True if disconnect successfull, false otherwise
     * @see        connect()
     *
     * @deprecated Not used.
     */
    public function close()
    {
        return true;
    }

    public function jdate($string, $gm = 'tzserver')
    {
        // TODO $string should be converted into a GMT timestamp, so param gm should be set to true by default instead of false
        if ($string == 0 || $string == "0000-00-00 00:00:00") {
            return '';
        }
        $string = preg_replace('/([^0-9])/i', '', $string);
        $tmp = $string . '000000';
        $date = dol_mktime((int) substr($tmp, 8, 2), (int) substr($tmp, 10, 2), (int) substr($tmp, 12, 2), (int) substr($tmp, 4, 2), (int) substr($tmp, 6, 2), (int) substr($tmp, 0, 4), $gm);
        return $date;
    }

    public function sanitize($stringtosanitize, $allowsimplequote = 0)
    {
        if ($allowsimplequote) {
            return preg_replace('/[^a-z0-9_\-\.,\']/i', '', $stringtosanitize);
        } else {
            return preg_replace('/[^a-z0-9_\-\.,]/i', '', $stringtosanitize);
        }
    }

    public function plimit($limit = 0, $offset = 0)
    {
        global $conf;
        if (empty($limit)) {
            return "";
        }
        if ($limit < 0) {
            $limit = $conf->liste_limit;
        }
        if ($offset > 0) {
            return " LIMIT " . ((int) $offset) . "," . ((int) $limit) . " ";
        } else {
            return " LIMIT " . ((int) $limit) . " ";
        }
    }

    public function idate($param, $gm = 'tzserver')
    {
        return date('Y-m-d H:i:s', $$param);
    }
}
