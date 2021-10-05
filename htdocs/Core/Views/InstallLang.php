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

namespace Alxarafe\Core\Views;

use Alxarafe\Core\Base\View;
use Alxarafe\Core\Singletons\Config;
use Alxarafe\Database\Engine;
use DebugBar\DebugBarException;

/**
 * Class Login
 *
 * @package Alxarafe\Views
 */
class ConfigView extends View
{

    public $dbEngines;
    public $dbEngineName;
    public $languages;
    public $language;
    public $skins;
    public $skin;
    public $dbConfig;
    public $checkDebug;

    /**
     * Login constructor.
     *
     * @param $ctrl
     *
     * @throws DebugBarException
     */
    public function __construct($ctrl)
    {
        parent::__construct($ctrl);

        $config = Config::getInstance();

        $vars = $config->configFileExists() ? $config->loadConfigurationFile() : [];

        $this->dbEngines = Engine::getEngines();
        $this->dbEngineName = $vars['database']['main']['dbEngineName'] ?? $this->dbEngines[0] ?? '';

        $this->skins = $this->render->getSkins();
        $this->skin = $vars['templaterender']['main']['skin'] ?? $this->skins[0] ?? '';

        $this->checkDebug = $vars['constants']['boolean']['DEBUG'] ?? false;

        $this->languages = $this->translator->getAvailableLanguages();
        $this->language = $vars['translator']['main']['language'] ?? key($this->languages) ?? 'en';

        $this->dbConfig['dbUser'] = $vars['database']['main']['dbUser'] ?? 'root';
        $this->dbConfig['dbPass'] = $vars['database']['main']['dbPass'] ?? '';
        $this->dbConfig['dbName'] = $vars['database']['main']['dbName'] ?? 'alxarafe';
        $this->dbConfig['dbHost'] = $vars['database']['main']['dbHost'] ?? 'localhost';
        $this->dbConfig['dbPrefix'] = $vars['database']['main']['dbPrefix'] ?? 'tc_';
        $this->dbConfig['dbPort'] = $vars['database']['main']['dbPort'] ?? '';
    }

    /**
     * Assign the template.
     */
    function setTemplate(): void
    {
        $this->template = 'config';
    }
}
