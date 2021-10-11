<?php
/*
 * This file is part of the DebugBar package.
 *
 * (c) 2013 Maxime Bouroumeau-Fuseau
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace DebugBar\DataCollector;

/**
 * Collects info about the current localization state
 */
class LocalizationCollector extends DataCollector implements Renderable
{
    /**
     * @return array
     */
    public function collect()
    {
        return [
            'locale' => $this->getLocale(),
            'domain' => $this->getDomain(),
        ];
    }

    /**
     * Get the current locale
     *
     * @return string
     */
    public function getLocale()
    {
        return setlocale(LC_ALL, 0);
    }

    /**
     * Get the current translations domain
     *
     * @return string
     */
    public function getDomain()
    {
        return textdomain();
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'localization';
    }

    /**
     * @return array
     */
    public function getWidgets()
    {
        return [
            'domain' => [
                'icon' => 'bookmark',
                'map' => 'localization.domain',
            ],
            'locale' => [
                'icon' => 'flag',
                'map' => 'localization.locale',
            ],
        ];
    }
}
