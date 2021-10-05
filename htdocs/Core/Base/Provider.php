<?php

namespace Alxarafe\Core\Base;

use Alxarafe\Core\Helpers\Utils\ArrayUtils;
use Alxarafe\Core\Singletons\Config;
use Alxarafe\Core\Singletons\FlashMessages;
use Symfony\Component\Yaml\Exception\ParseException;
use Symfony\Component\Yaml\Yaml;

abstract class Provider extends Singleton
{
    /**
     * The base path where config files are placed.
     *
     * @var string
     */
    private static string $basePath;

    /**
     * Contains an associative array with the default values of each descendant, indexed by the name of the class.
     *
     * @var array
     */
    private static array $defaultValues;

    /**
     * Provider constructor
     *
     * @param string $index
     */
    public function __construct(string $index = 'main')
    {
        parent::__construct($index);

        // Save the default values in the first instantiation of the class
        $className = self::getClassName();
        if (!isset(self::$defaultValues[$className])) {
            self::$defaultValues[$className] = $this->getDefaultValues();
        }
    }

    /**
     * Returns an associative array with the default values for the class.
     *
     * @return array
     */
    public abstract function getDefaultValues(): array;

    /**
     * The object is created from within the class itself only if the class
     * has no instance.
     *
     * We opted to use an array to make several singletons according to the
     * index passed to getInstance
     *
     * Unlike the Singleton class, Provider can read and write data in the
     * configuration file.
     *
     * @param string $index
     *
     * @return mixed
     */
    public static function getInstance(string $index = 'main')
    {
        self::$basePath = constant('BASE_FOLDER') . '/config';
        return parent::getInstance($index);
    }

    /**
     * Returns the yaml config params.
     *
     * @param string $index
     *
     * @return array
     */
    public static function getConfig(string $index = 'main'): array
    {
        $className = self::getClassName();
        $result = self::$defaultValues[$className];
        $yamlContent = self::getYamlContent();
        if (isset($yamlContent[$index])) {
            $result = array_merge($result, $yamlContent[$index]);
        }
        return $result;
    }

    /**
     * Returns the content of the Yaml file.
     *
     * @return array
     */
    private static function getYamlContent(): array
    {
        $className = self::getClassName();
        $yamlContent = self::$defaultValues[$className];
        $file = self::getFilePath();
        if (self::fileExists($file)) {
            try {
                $yamlContent = Yaml::parseFile($file);
            } catch (ParseException $e) {
                //                Logger::getInstance()::exceptionHandler($e);
                FlashMessages::getInstance()::setError($e->getFile() . ' ' . $e->getLine() . ' ' . $e->getMessage());
                $yamlContent = [];
            }
        }
        $content = $yamlContent;
        return $content ?? [];
    }

    /**
     * Returns if file exists.
     *
     * @param string $filename
     *
     * @return bool
     */
    protected static function fileExists(string $filename): bool
    {
        return (file_exists($filename) && is_file($filename));
    }

    /**
     * Save config to file.
     *
     * @param array  $params
     * @param bool   $merge
     * @param string $index
     *
     * @return bool
     */
    public function setConfig(array $params, bool $merge = true, string $index = 'main'): bool
    {
        $paramsToSave = [];
        $content = Config::getInstance()->getConfig();
        if (!$merge) {
            unset($content[self::yamlName()][$index]);
        }
        $paramsToSave[self::yamlName()][$index] = $params;
        $content = ArrayUtils::arrayMergeRecursiveEx($content, $paramsToSave);
        return file_put_contents($this->getFilePath(), Yaml::dump($content, 3), LOCK_EX) !== false;
    }

    /**
     * Return the classname for yaml file.
     *
     * @return string
     */
    public static function yamlName(): string
    {
        return strtolower(parent::getClassName());
    }

    /**
     * Return the full file config path.
     *
     * @return string
     */
    public static function getFilePath(): string
    {
        return realpath(self::$basePath) . constant('DIRECTORY_SEPARATOR') . self::getFileName() . '.yaml';
    }

    /**
     * Return the file name.
     *
     * @return string
     */
    public static function getFileName(): string
    {
        return (self::yamlName());
    }

}