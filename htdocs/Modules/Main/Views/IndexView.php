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

namespace Alxarafe\Modules\Main\Views;

use Alxarafe\Core\Base\View;
use Alxarafe\Core\Singletons\TemplateRender;
use DebugBar\DebugBarException;

/**
 * Class Login
 *
 * @package Alxarafe\Views
 */
class IndexView extends View
{
    /**
     * TODO: Undocummented
     */
    public function addCss()
    {
        parent::addCss();
        //        $this->addToVar('cssCode', $this->addResource('/css/login', 'css'));
    }

    /**
     * Assign the template.
     */
    public function setTemplate(): void
    {
        $this->template = 'default';
    }
}
