<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018-2020 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Core\DebugBarCollectors;

use Alxarafe\Core\Providers\Translator;
use DebugBar\DataCollector\AssetProvider;
use DebugBar\DataCollector\DataCollector;
use DebugBar\DataCollector\Renderable;

/**
 * This class collects the translations
 *
 * @source Based on: https://github.com/spiroski/laravel-debugbar-translations
 */
class TranslatorCollector extends DataCollector implements Renderable, AssetProvider
{
    /**
     * Translation engine
     *
     * @var Translator
     */
    protected static Translator $translator;

    /**
     * Array containing the translations
     *
     * @var array
     */
    protected array $translations;

    /**
     * TranslationCollector constructor.
     *
     * @param Translator $translator
     */
    public function __construct(Translator &$translator)
    {
        static::$translator = $translator;
        $this->translations = [];
    }

    /**
     * Returns the unique name of the collector
     *
     * @return string
     */
    public function getName(): string
    {
        return 'translations';
    }

    /**
     * Returns a hash where keys are control names and their values
     * an array of options as defined in {@see DebugBar\JavascriptRenderer::addControl()}
     *
     * @return array
     */
    public function getWidgets(): array
    {
        return [
            'translations' => [
                'icon' => 'language',
                'tooltip' => 'Translations',
                'widget' => 'PhpDebugBar.Widgets.TranslationsWidget',
                'map' => 'translations',
                'default' => '[]',
            ],
            'translations:badge' => [
                'map' => 'translations.nb_statements',
                'default' => 0,
            ],
        ];
    }

    /**
     * Returns the needed assets
     *
     * @return array
     */
    public function getAssets(): array
    {
        return [
            'css' => baseUrl('/html/common/css/phpdebugbar.custom-widget.css'),
            'js' => baseUrl('/html/common/js/phpdebugbar.custom-widget.js'),
        ];
    }

    /**
     * Called by the DebugBar when data needs to be collected
     *
     * @return array Collected data
     */
    public function collect(): array
    {
        $this->addTranslations();

        return [
            'nb_statements' => count($this->translations),
            'translations' => $this->translations,
        ];
    }

    /**
     * Add a translation key to the collector
     */
    private function addTranslations()
    {
        foreach (static::$translator->getMissingStrings() as $key => $value) {
            $this->translations[] = [
                'key' => $key,
                'value' => $value,
            ];
        }
    }
}