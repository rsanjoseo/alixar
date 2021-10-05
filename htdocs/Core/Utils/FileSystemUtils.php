<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018-2020 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Core\Helpers\Utils;

use Alxarafe\Core\Providers\Translator;
use Alxarafe\Core\Singletons\FlashMessages;
use DirectoryIterator;
use Exception;
use RuntimeException;
use SplFileInfo;

/**
 * Class FileSystemUtils
 *
 * @package Alxarafe\Core\Helpers
 */
class FileSystemUtils
{
    /**
     * Recursively removes a folder along with all its files and directories
     *
     * @param string $path
     *
     * @return bool
     */
    public static function rrmdir(string $path): bool
    {
        // Open the source directory to read in files
        if (!file_exists($path)) {
            return false;
        }
        $i = new DirectoryIterator($path);
        foreach ($i as $f) {
            if ($f->isFile()) {
                unlink($f->getRealPath());
            } elseif (!$f->isDot() && $f->isDir()) {
                self::rrmdir($f->getRealPath());
            }
        }
        return rmdir($path);
    }

    /**
     * Attempts to create the directory specified by pathname.
     *
     * @doc https://github.com/kalessil/phpinspectionsea/blob/master/docs/probable-bugs.md#mkdir-race-condition
     *
     * @param string $dir
     * @param int    $mode
     * @param bool   $recursive
     *
     * @return bool
     */
    public static function mkdir(string $dir, int $mode = 0777, bool $recursive = false): bool
    {
        $status = true;
        try {
            if (!is_dir($dir) && !mkdir($dir, $mode, $recursive) && !is_dir($dir)) {
                $message = Translator::getInstance()->trans('directory-not-created', ['%directory%' => $dir]);
                throw new RuntimeException($message);
            }
        } catch (Exception $e) {
            $status = false;
            FlashMessages::getInstance()::setError($e->getMessage());
        }
        return $status;
    }

    /**
     * List files and directories inside the specified path.
     *
     * @param string $path
     *
     * @return SplFileInfo[]
     */
    public static function scandir(string $path): array
    {
        $list = [];
        // Open the source directory to read in files
        $iterator = new DirectoryIterator($path);
        foreach ($iterator as $fileInfo) {
            if (!$fileInfo->isDot()) {
                $list[] = $fileInfo->getFileInfo();
            }
        }
        return $list;
    }

    /**
     * Locate a file in a subfolder, returning the FQCN or filepath.
     * The active modules of the last activated are traversed to the first, and finally the core.
     * The file is searched in the subfolder specified (for example Models).
     * If true (default), return the FQCN; if false, return the path to the file
     *
     * @param string $subfolder
     * @param string $file
     * @param bool   $fqcn
     *
     * @return ?string
     *
     * @deprecated See the code in case it needs to be reused!
     */
    public static function locate(string $subfolder, string $file, bool $fqcn = true): ?string
    {
        $modules = [];
        /*
        // ModuleManager does not exists!
        foreach (ModuleManager::getEnabledModules() as $value) {
            $cad = $value['path'];
            $modules[] = substr($cad, strlen('src/'));    // Delete initial 'src\'
        }
        */
        $modules[] = 'Alxarafe\Core';
        foreach ($modules as $module) {
            $filename = BASE_PATH . '/src/' . str_replace('\\', '/', $module) . '/' . $subfolder . '/' . $file . '.php';
            if (file_exists($filename)) {
                if ($fqcn) {
                    return '\\' . $module . '\\' . $subfolder . '\\' . $file;
                }
                return $filename;
            }
        }

        return null;
    }
}