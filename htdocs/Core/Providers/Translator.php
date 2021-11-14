<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018-2020 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Core\Providers;

use Alxarafe\Core\Base\Provider;
use Alxarafe\Core\Singletons\DebugTool;
use Alxarafe\Core\Singletons\FlashMessages;
use Alxarafe\Core\Singletons\Logger;
use Alxarafe\Core\Utils\ClassUtils;
use Alxarafe\Dolibarr\Base\DolibarrGlobals;
use Alxarafe\Dolibarr\Libraries\DolibarrFunctions;
use NumberFormatter;
use Symfony\Component\Finder\Finder;
use Symfony\Component\Translation\Loader\YamlFileLoader;
use Symfony\Component\Translation\Translator as SymfonyTranslator;
use Symfony\Component\Yaml\Exception\ParseException;
use Symfony\Component\Yaml\Yaml;

/**
 * Class Lang, give support to internationalization.
 *
 * @package Alxarafe\Core\Providers
 */
class Translator extends Provider
{
    /**
     * Default language to use if language file not exists.
     */
    public const FALLBACK_LANG = 'en';

    /**
     * Base folder where languages files are stored.
     */
    public const LANG_FOLDER = DIRECTORY_SEPARATOR . 'Languages';

    /**
     * Default language to use.
     */
    public const LANG = 'es_ES';

    /**
     * Extension of language file.
     */
    public const EXT = '.yaml';

    /**
     * Format of language file.
     */
    public const FORMAT = 'yaml';

    /**
     * The Symfony translator.
     *
     * @var SymfonyTranslator
     */
    private static $translator;

    /**
     * List of used strings.
     *
     * @var array
     */
    private static $usedStrings;

    /**
     * List of strings without translation.
     *
     * @var array
     */
    private static $missingStrings;

    /**
     * Main language folder.
     *
     * @var string
     */
    private static $languageFolder;

    /**
     * Array of all language folders.
     *
     * @var array
     */
    private static $languageFolders;

    /**
     * Lang constructor.
     */
    public function __construct()
    {
        $shortName = ClassUtils::getShortName($this, static::class);
        $debugTool = DebugTool::getInstance();

        $debugTool->startTimer($shortName, $shortName . ' Constructor');

        parent::__construct();

        $debugTool->startTimer($shortName . '1', $shortName . ' getConfig');
        $config = $this->getConfig();
        $debugTool->stopTimer($shortName . '1', $shortName . ' getConfig');

        self::$languageFolder = constant('BASE_FOLDER') . self::LANG_FOLDER;
        self::$translator = new SymfonyTranslator($config['language'] ?? self::FALLBACK_LANG);
        self::$translator->setFallbackLocales([self::FALLBACK_LANG]);
        self::$translator->addLoader(self::FORMAT, new YamlFileLoader());
        self::$usedStrings = [];
        self::$missingStrings = [];
        self::$languageFolders = [];

        $debugTool->startTimer($shortName . '2', $shortName . ' loadLangs');
        $this->loadLangFiles();
        $debugTool->stopTimer($shortName . '2', $shortName . ' loadLangs');

        $debugTool->stopTimer($shortName, $shortName . ' Constructor');
    }

    /**
     * Load the translation files following the priorities.
     * In this case, the translator must be provided with the routes in reverse order.
     *
     * @return void
     */
    public function loadLangFiles(): void
    {
        $langFolders = $this->getLangFolders();
        if (count($langFolders) === 0 || empty($langFolders[0])) {
            die('No language folder found');
        }

        $langFiles = Finder::create()
            ->files()
            ->name('*' . self::EXT)
            ->in($langFolders)
            ->sortByName();

        foreach ($langFiles as $langFile) {
            $langCode = str_replace(self::EXT, '', $langFile->getRelativePathName());
            try {
                Yaml::parseFile($langFile->getPathName());
                self::$translator->addResource(self::FORMAT, $langFile->getPathName(), $langCode);
            } catch (ParseException $e) {
                Logger::getInstance()::exceptionHandler($e);
                FlashMessages::getInstance()::setError($e->getFile() . ' ' . $e->getLine() . ' ' . $e->getMessage());
            }
        }
    }

    /**
     * Return the lang folders.
     *
     * @return array
     */
    public function getLangFolders(): array
    {
        return array_merge(
            [$this->getBaseLangFolder()],
            self::$languageFolders
        );
    }

    /**
     * Returns the base lang folder.
     *
     * @return string
     */
    public function getBaseLangFolder(): string
    {
        return self::$languageFolder;
    }

    /**
     * Return default values
     *
     * @return array
     */
    public function getDefaultValues(): array
    {
        return ['language' => self::FALLBACK_LANG];
    }

    /**
     * Add additional language folders.
     *
     * @param array $folders
     */
    public function addDirs(array $folders = [])
    {
        foreach ($folders as $key => $folder) {
            $fullFolder = $folder . self::LANG_FOLDER;
            //            FileSystemUtils::mkdir($folders[$key], 0777, true);
            if (file_exists($fullFolder) && is_dir($fullFolder)) {
                $folders[$key] = $fullFolder;
                DebugTool::getInstance()->addMessage('messages', 'Added translation folder ' . $folders[$key]);
            }
        }
        self::$languageFolders = array_merge(self::$languageFolders, $folders);
        $this->loadLangFiles();
    }

    public function get_available_languages($langdir = DOL_DOCUMENT_ROOT, $maxlength = 0, $usecode = 0, $mainlangonly = 0)
    {
        return $this->getAvailableLanguages();
    }

    /**
     * Returns an array with the languages with available translations.
     *
     * @return array
     */
    public function getAvailableLanguages(): array
    {
        $languages = [];
        $dir = $this->getBaseLangFolder();
        //        FileSystemUtils::mkdir($dir, 0777, true);
        if (file_exists($dir) && is_dir($dir)) {
            $langFiles = Finder::create()
                ->files()
                ->name('*' . self::EXT)
                ->in($dir)
                ->sortByName();

            foreach ($langFiles as $langFile) {
                $langCode = str_replace(self::EXT, '', $langFile->getRelativePathName());
                $languages[$langCode] = $this->trans('language-' . $langCode);
            }
        }
        return $languages;
    }

    /**
     * Translate the text into the default language.
     *
     * @param string      $txt
     * @param array       $parameters
     * @param string|null $domain
     * @param string|null $locale
     *
     * @return string
     */
    public static function trans(string $txt, $parameters = [], ?string $domain = null, ?string $locale = null): string
    {
        if (is_string($parameters)) {
            $x = $parameters;
            $parameters = [];
            $parameters['s'] = $x;
        }
        $translated = self::$translator->trans($txt, $parameters, $domain, $locale);
        self::verifyMissing($translated, $txt, $domain);
        return $translated;
    }

    /**
     * Stores if translation is used and if is missing.
     *
     * @param string      $translated
     * @param null|string $txt
     * @param null|string $domain
     */
    private static function verifyMissing(string $translated, $txt, $domain = null)
    {
        $domain = $domain ?? 'messages';

        $txt = (string) $txt;
        $catalogue = self::$translator->getCatalogue(self::getLocale());

        while (!$catalogue->defines($txt, $domain)) {
            if ($cat = $catalogue->getFallbackCatalogue()) {
                $catalogue = $cat;
                $locale = $catalogue->getLocale();
                if ($catalogue->has($txt, $domain) && $locale !== self::getLocale()) {
                    self::$missingStrings[$txt] = $translated;
                }
            } else {
                break;
            }
        }
        if (!$catalogue->has($txt, $domain)) {
            self::$missingStrings[$txt] = $translated;
        }
    }

    /**
     * Returns the language code in use.
     *
     * @return string
     */
    public static function getLocale(): string
    {
        return self::$translator->getLocale();
    }

    /**    public function getCurrencySymbol($currency_code, $forceloadall = 0)
     * {
     * $currency_sign = ''; // By default return iso code
     *
     * if (function_exists("mb_convert_encoding")) {
     * $this->loadCacheCurrencies($forceloadall ? '' : $currency_code);
     *
     * if (isset($this->cache_currencies[$currency_code]) && !empty($this->cache_currencies[$currency_code]['unicode']) && is_array($this->cache_currencies[$currency_code]['unicode'])) {
     * foreach ($this->cache_currencies[$currency_code]['unicode'] as $unicode) {
     * $currency_sign .= mb_convert_encoding("&#{$unicode};", "UTF-8", 'HTML-ENTITIES');
     * }
     * }
     * }
     *
     * return ($currency_sign ? $currency_sign : $currency_code);
     * }
     * Returns the missing strings.
     *
     * @return array
     */
    public function getMissingStrings(): array
    {
        return self::$missingStrings;
    }

    /**
     * Returns the strings used.
     *
     * @return array
     */
    public function getUsedStrings(): array
    {
        return self::$usedStrings;
    }

    /**
     * Returns the original translator.
     *
     * @return SymfonyTranslator
     */
    public function getTranslator(): SymfonyTranslator
    {
        return self::$translator;
    }

    /**
     * @param string       $txt
     * @param string|array $parameters
     * @param string|null  $domain
     * @param string|null  $locale
     *
     * @return string
     * @deprecated Do not use
     */
    public function transnoentitiesnoconv(string $txt, string|array $parameters = []): string
    {
        return self::trans($txt, $parameters);
    }

    public function getCurrencySymbol($currency_code)
    {
        return trim($this->getCurrencyAmount($currency_code), '0,.');
    }

    public function getCurrencyAmount($currency_code, $amount = 0)
    {
        $obj = new NumberFormatter(null, NumberFormatter::CURRENCY);
        return $obj->formatCurrency($amount, $currency_code);
    }

    public function convToOutputCharset($str, $pagecodefrom = 'UTF-8')
    {
        $this->charset_output = 'UTF-8'; // TODO: Move db to UTF8_mb4?

        if ($pagecodefrom == 'ISO-8859-1' && $this->charset_output == 'UTF-8') {
            $str = utf8_encode($str);
        }
        if ($pagecodefrom == 'UTF-8' && $this->charset_output == 'ISO-8859-1') {
            $str = utf8_decode(str_replace('€', chr(128), $str));
        }
        return $str;
    }

    public function transcountry($str, $countrycode)
    {
        if (!empty($this->tab_translate["$str$countrycode"])) {
            return $this->trans("$str$countrycode");
        } else {
            return $this->trans($str);
        }
    }

    public function setDefaultLang($srclang = 'en_US')
    {
        if (empty($srclang) || $srclang == 'auto') {
            // $_SERVER['HTTP_ACCEPT_LANGUAGE'] can be 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,it;q=0.6' but can contains also malicious content
            $langpref = empty($_SERVER['HTTP_ACCEPT_LANGUAGE']) ? '' : $_SERVER['HTTP_ACCEPT_LANGUAGE'];
            $langpref = preg_replace("/;([^,]*)/i", "", $langpref); // Remove the 'q=x.y,' part
            $langpref = str_replace("-", "_", $langpref);
            $langlist = preg_split("/[;,]/", $langpref);
            $srclang = preg_replace('/[^_a-zA-Z]/', '', $langlist[0]);
        }

        $this->setlocale($srclang);
    }

    /**
     * Sets the language code in use.
     *
     * @param string $lang
     *
     * @return void
     */
    public function setlocale(string $lang): void
    {
        self::$translator->setLocale($lang);
    }

    public function getDefaultLang($mode = 0)
    {
        $lang = self::LANG; // TODO: FALLBACK_LANG or LANG?
        if (empty($mode)) {
            return $lang;
        } else {
            return substr($lang, 0, 2);
        }
    }

    public function transnoentities($string)
    {
        return $this->trans($string);
    }

    public function loadLangs(array $domains)
    {
    }

    public function loadCacheCurrencies()
    {
        $db = DolibarrGlobals::getDb();

        if ($this->cache_currencies_all_loaded) {
            return 0; // Cache already loaded for all
        }

        if (!empty($currency_code) && isset($this->cache_currencies[$currency_code])) {
            return 0; // Cache already loaded for the currency
        }

        $sql = "SELECT code_iso, label, unicode";
        $sql .= " FROM " . MAIN_DB_PREFIX . "c_currencies";
        $sql .= " WHERE active = 1";
        if (!empty($currency_code)) {
            $sql .= " AND code_iso = '" . $db->escape($currency_code) . "'";
        }
        //$sql.= " ORDER BY code_iso ASC"; // Not required, a sort is done later

        DolibarrFunctions::dol_syslog(get_class($this) . '::loadCacheCurrencies', LOG_DEBUG);

        $resql = $db->select($sql);
        if ($resql == false) {
            dol_print_error($db);
            return -1;
        }

        $num = count($resql);
        $this->load("dict");
        $label = [];
        if (!empty($currency_code)) {
            foreach ($this->cache_currencies as $key => $val) {
                $label[$key] = $val['label']; // Label in already loaded cache
            }
        }

        $i = 0;
        while ($i < $num) { // We can use a foreach
            $obj = (object) $resql[$i];

            // Si traduction existe, on l'utilise, sinon on prend le libelle par defaut
            $this->cache_currencies[$obj->code_iso]['label'] = ($obj->code_iso && $this->trans("Currency" . $obj->code_iso) != "Currency" . $obj->code_iso ? $this->trans("Currency" . $obj->code_iso) : ($obj->label != '-' ? $obj->label : ''));
            $this->cache_currencies[$obj->code_iso]['unicode'] = (array) json_decode($obj->unicode, true);
            $label[$obj->code_iso] = $this->cache_currencies[$obj->code_iso]['label'];
            $i++;
        }
        if (empty($currency_code)) {
            $this->cache_currencies_all_loaded = true;
        }
        //print count($label).' '.count($this->cache_currencies);

        // Resort cache
        array_multisort($label, SORT_ASC, $this->cache_currencies);
        //var_dump($this->cache_currencies);	$this->cache_currencies is now sorted onto label
        return $num;
    }

    public function load($domain, $alt = 0, $stopafterdirection = 0, $forcelangdir = '', $loadfromfileonly = 0, $forceloadifalreadynotfound = 0)
    {
    }
}