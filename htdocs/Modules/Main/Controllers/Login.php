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

namespace Alxarafe\Modules\Main\Controllers;

use Alxarafe\Core\Base\Controller;
use Alxarafe\Core\Base\View;
use Alxarafe\Core\Helpers\Auth;
use Alxarafe\Core\Singletons\Config;
use Alxarafe\Core\Singletons\FlashMessages;
use Alxarafe\Modules\Main\Views\IndexView;
use Alxarafe\Modules\Main\Views\LoginView;
use DebugBar\DebugBarException;

/**
 * Class Login
 *
 * @package Alxarafe\Controllers
 */
class Login extends Controller
{
    public function doAction(): bool
    {
        $auth = Auth::getInstance();
        switch ($this->action) {
            case 'login':
                if (!$auth->setUser($_POST['username'], $_POST['password'])) {
                    FlashMessages::setError('User authentication error. Please check the username and password.');
                    break;
                }
                // TODO: There should be a break here. We use the redirect to test that Dolibarr continues to run.
                header('Location: ' . BASE_URI . '?x');
                die();
            default:
                return parent::doAction();
        }
        return true;
    }

    /**
     * @throws DebugBarException
     */
    public function setView(): View
    {
        if (Config::getInstance()->getUsername() !== null) {
            return new IndexView($this);
        }
        return new LoginView($this);
    }
}
