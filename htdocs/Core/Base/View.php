<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Core\Base;

use Alxarafe\Core\Singletons\Config;
use Alxarafe\Core\Singletons\DebugTool;
use Alxarafe\Core\Singletons\FlashMessages;
use Alxarafe\Core\Utils\ClassUtils;
use Alxarafe\Modules\Main\Models\Menu;
use DebugBar\DebugBarException;

/**
 * Class View
 *
 * @package Alxarafe\Base
 */
abstract class View extends Globals
{
    /**
     * Error messages to show
     *
     * @var string[]
     */
    public array $errors;

    /**
     * Dolibarr requires a body ID.
     *
     * @var string
     */
    public string $bodyId = 'mainbody';

    /**
     * Title of the HTML page
     *
     * @var string
     */
    public string $title;

    /**
     * Contiene el nombre de la plantilla a utilizar.
     *
     * @var ?string
     */
    public ?string $template = null;

    /**
     * Contains an array with the main menu options. (top menu)
     *
     * @var array
     */
    public array $menu;

    /**
     * Contains an array with the submenu options. (left menu)
     *
     * @var array
     */
    public array $submenu;

    public bool $hasMenu = false;
    public BasicController $controller;
    /**
     * Array that contains the variables that will be passed to the template.
     * Among others it will contain the user name, the view and the controller.
     *
     * @var array
     */
    private array $vars;

    /**
     * Load the JS and CSS files and define the ctrl, view and user variables
     * for the templates.
     *
     * @param Controller $controller
     *
     * @throws DebugBarException
     */
    public function __construct(BasicController $controller)
    {
        parent::__construct();

        $this->controller = $controller;

        $title = ClassUtils::getShortName($controller, $controller);
        $this->title = $this->trans(strtolower($title)) . ' - ' . self::APP_NAME . ' ' . self::APP_VERSION;

        $this->setTemplate();
        $this->render->setTemplate($this->template);
        $this->vars = [];
        $this->vars['ctrl'] = $controller;
        $this->vars['view'] = $this;
        $this->vars['user'] = Config::getInstance()->getUsername();
        $this->vars['templateuri'] = $this->render->getTemplatesUri();
        $this->addCSS();
        $this->addJS();
        $this->hasMenu = $controller->hasMenu;
        if ($this->hasMenu) {
            $this->getMenu();
            $this->getSubmenu();
        }
    }

    /**
     * Method to assign the template to the view.
     */
    public abstract function setTemplate(): void;

    /**
     * addCSS includes the common CSS files to all views templates. Also defines CSS folders templates.
     *
     * @return void
     * @throws DebugBarException
     */
    public function addCSS()
    {
        //        $this->addToVar('cssCode', $this->addResource('/bower_modules/bootstrap/dist/css/bootstrap.min', 'css'));
        //        $this->addToVar('cssCode', $this->addResource('/css/alxarafe', 'css'));
    }

    /**
     * addJS includes the common JS files to all views templates. Also defines JS folders templates.
     *
     * @return void
     * @throws DebugBarException
     */
    public function addJS()
    {
        //        $this->addToVar('jsCode', $this->addResource('/bower_modules/jquery/dist/jquery.min', 'js'));
        //        $this->addToVar('jsCode', $this->addResource('/bower_modules/bootstrap/dist/js/bootstrap.min', 'js'));
        //        $this->addToVar('jsCode', $this->addResource('/js/alxarafe', 'js'));
    }

    /**
     * The menu options in Dolibarr are defined in eldy.lib.php in the print_eldy_menu function.
     * In the case of using the Auguria template, change eldy to auguria.
     *
     * TODO: The options not allowed for the user should be disabled
     * TODO: Soon, this information will be in a template yaml file
     *
     * @author  Rafael San José Tovar <info@rsanjoseo.com>
     * @version sept. 2021
     *
     */
    private function getMenu()
    {
        /**
         * Array
         * (
         * [0] => Array (
         *   [name] => Home
         *   [link] => /index.php?mainmenu=home&leftmenu=home
         *   [title] => Home
         *   [level] => 0
         *   [enabled] => 1
         *   [target] =>
         *   [mainmenu] => home
         *   [leftmenu] =>
         *   [position] => 10
         *   [id] => mainmenu
         *   [idsel] => home
         *   [classname] => class="tmenusel"
         *   [prefix] => fa fa-home
         * )
         *
         * [1] => Array (
         *   [name] => Members
         *   [link] => /adherents/index.php?mainmenu=members&leftmenu=
         *   [title] => MenuMembers
         *   [level] => 0
         *   [enabled] => 0
         *   [target] =>
         *   [mainmenu] => members
         *   [leftmenu] =>
         *   [position] => 18
         *   [id] => mainmenu
         *   [idsel] => members
         *   [classname] => class="tmenu"
         *   [prefix] => fas fa-user-alt
         * )
         *
         * [2] => Array (
         *   [name] => Companies
         *   [link] => /societe/index.php?mainmenu=companies&leftmenu=
         *   [title] => ThirdParties
         *   [level] => 0
         *   [enabled] => 1
         *   [target] =>
         *   [mainmenu] => companies
         *   [leftmenu] =>
         *   [position] => 20
         *   [id] => mainmenu
         *   [idsel] => companies
         *   [classname] => class="tmenu"
         *   [prefix] => fas fa-building
         *   [session] => 1
         * )
         *
         * [3] => Array (
         *   [name] => Products
         *   [link] => /product/index.php?mainmenu=products&leftmenu=
         *   [title] => Array (
         *     [0] => TMenuProducts
         *     [1] =>  |
         *     [2] => TMenuServices
         *   )
         *   [level] => 0
         *   [enabled] => 1
         *   [target] =>
         *   [mainmenu] => products
         *   [leftmenu] =>
         *   [position] => 30
         *   [id] => mainmenu
         *   [idsel] => products
         *   [classname] => class="tmenu"
         *   [prefix] => fas fa-cube
         *   [session] => 1
         * )
         *
         * [4] => Array (
         *   [name] => TMenuMRP
         *   [link] => /mrp/index.php?mainmenu=mrp&leftmenu=
         *   [title] => TMenuMRP
         *   [level] => 0
         *   [enabled] => 1
         *   [target] =>
         *   [mainmenu] => mrp
         *   [leftmenu] =>
         *   [position] => 31
         *   [id] => mainmenu
         *   [idsel] => mrp
         *   [classname] => class="tmenu"
         *   [prefix] => fas fa-cubes
         *   [session] => 1
         * )
         *
         * [5] => Array (
         *   [name] => Projet
         *   [link] => /projet/index.php?mainmenu=project&leftmenu=
         *   [title] => Projects
         *   [level] => 0
         *   [enabled] => 1
         *   [target] =>
         *   [mainmenu] => project
         *   [leftmenu] =>
         *   [position] => 35
         *   [id] => mainmenu
         *   [idsel] => project
         *   [classname] => class="tmenu"
         *   [prefix] => fas fa-project-diagram
         *   [session] => 1
         * )
         *
         * [6] => Array (
         *   [name] => Commercial
         *   [link] => /comm/index.php?mainmenu=commercial&leftmenu=
         *   [title] => Commercial
         *   [level] => 0
         *   [enabled] => 1
         *   [target] =>
         *   [mainmenu] => commercial
         *   [leftmenu] =>
         *   [position] => 40
         *   [id] => mainmenu
         *   [idsel] => commercial
         *   [classname] => class="tmenu"
         *   [prefix] => fas fa-suitcase
         *   [session] => 1
         * )
         *
         * [7] => Array (
         *   [name] => Compta
         *   [link] => /compta/index.php?mainmenu=billing&leftmenu=
         *   [title] => MenuFinancial
         *   [level] => 0
         *   [enabled] => 1
         *   [target] =>
         *   [mainmenu] => billing
         *   [leftmenu] =>
         *   [position] => 50
         *   [id] => mainmenu
         *   [idsel] => billing
         *   [classname] => class="tmenu"
         *   [prefix] => fas fa-file-invoice-dollar
         *   [session] => 1
         * )
         *
         * [8] => Array (
         *   [name] => Bank
         *   [link] => /compta/bank/list.php?mainmenu=bank&leftmenu=
         *   [title] => MenuBankCash
         *   [level] => 0
         *   [enabled] => 0
         *   [target] =>
         *   [mainmenu] => bank
         *   [leftmenu] =>
         *   [position] => 52
         *   [id] => mainmenu
         *   [idsel] => bank
         *   [classname] => class="tmenu"
         *   [prefix] => fas fa-university
         *   [session] => 1
         * )
         *
         * [9] => Array (
         *   [name] => Accounting
         *   [link] => /accountancy/index.php?mainmenu=accountancy&leftmenu=
         *   [title] => MenuAccountancy
         *   [level] => 0
         *   [enabled] => 0
         *   [target] =>
         *   [mainmenu] => accountancy
         *   [leftmenu] =>
         *   [position] => 54
         *   [id] => mainmenu
         *   [idsel] => accountancy
         *   [classname] => class="tmenu"
         *   [prefix] => fas fa-search-dollar
         *   [session] => 1
         * )
         *
         * [10] => Array (
         *   [name] => HRM
         *   [link] => /hrm/index.php?mainmenu=hrm&leftmenu=
         *   [title] => HRM
         *   [level] => 0
         *   [enabled] => 0
         *   [target] =>
         *   [mainmenu] => hrm
         *   [leftmenu] =>
         *   [position] => 80
         *   [id] => mainmenu
         *   [idsel] => hrm
         *   [classname] => class="tmenu"
         *   [prefix] => fas fa-user-tie
         *   [session] => 1
         * )
         *
         * [11] => Array (
         *   [name] => Ticket
         *   [link] => /ticket/index.php?mainmenu=ticket&leftmenu=
         *   [title] => Tickets
         *   [level] => 0
         *   [enabled] => 1
         *   [target] =>
         *   [mainmenu] => ticket
         *   [leftmenu] =>
         *   [position] => 88
         *   [id] => mainmenu
         *   [idsel] => ticket
         *   [classname] => class="tmenu"
         *   [prefix] => fas fa-ticket-alt
         *   [session] => 1
         * )
         *
         * [12] => Array (
         *   [name] => Tools
         *   [link] => /core/tools.php?mainmenu=tools&leftmenu=
         *   [title] => Tools
         *   [level] => 0
         *   [enabled] => 1
         *   [target] =>
         *   [mainmenu] => tools
         *   [leftmenu] =>
         *   [position] => 90
         *   [id] => mainmenu
         *   [idsel] => tools
         *   [classname] => class="tmenu"
         *   [prefix] => fas fa-tools
         *   [session] => 1
         * )
         */
        $module = strtolower(filter_input(INPUT_GET, 'module'));
        $this->menu = [];
        $this->menu[] = $this->addItem(
            'home',
            $this->trans('home'),
            '/dolibarr/htdocs/index.php?mainmenu=home&amp;leftmenu=home',
            $module === 'main' || empty($module)
        );
        $this->menu[] = $this->addItem(
            'members',
            $this->trans('MenuMembers'),
            '/dolibarr/htdocs/adherents/index.php?mainmenu=members&leftmenu=',
            $module === 'members'
        );
        $this->menu[] = $this->addItem(
            'companies',
            $this->trans('companies'),
            '/dolibarr/htdocs/societe/index.php?mainmenu=companies&amp;leftmenu=',
            $module === 'companies'
        );
        $this->menu[] = $this->addItem(
            'products',
            $this->trans('products'),
            '/dolibarr/htdocs/product/index.php?mainmenu=products&leftmenu=',
            $module === 'products'
        );
        $this->menu[] = $this->addItem(
            'mrp',
            $this->trans('TMenuMRP'),
            '/dolibarr/htdocs/mrp/index.php?mainmenu=mrp&leftmenu=',
            $module === 'mrp'
        );
        $this->menu[] = $this->addItem(
            'project',
            $this->trans('Projects'),
            '/dolibarr/htdocs/mrp/index.php?mainmenu=mrp&leftmenu=',
            $module === 'project'
        );
        $this->menu[] = $this->addItem(
            'commercial',
            $this->trans('commercial'),
            '/dolibarr/htdocs/fourn/commande/index.php?mainmenu=commercial&amp;leftmenu=',
            $module === 'commercial'
        );
        $this->menu[] = $this->addItem(
            'compta',
            $this->trans('Compta'),
            '/dolibarr/htdocs/compta/index.php?mainmenu=billing&amp;leftmenu=',
            $module === 'billing'
        );
        $this->menu[] = $this->addItem(
            'billing',
            $this->trans('billing'),
            '/dolibarr/htdocs/compta/index.php?mainmenu=billing&amp;leftmenu=',
            $module === 'billing'
        );
        $this->menu[] = $this->addItem(
            'tools',
            $this->trans('tools'),
            '/dolibarr/htdocs/portfolio/portfolioindex.php?idmenu=1&mainmenu=portfolio&amp;leftmenu=',
            $module === 'tools'
        );
        $this->menu[] = $this->addItem(
            'portfolio',
            $this->trans('portfolio'),
            '?module=Portfolio&controller=Index',
            $module === 'portfolio'
        );
    }

    private function addItem($id, $title, $href, $active = false)
    {
        return [
            'id' => $id,
            'title' => $title,
            'href' => $href,
            'active' => $active,
        ];
    }

    /**
     * The left menu options in Dolibarr are defined in eldy.lib.php in the print_left_eldy_menu function.
     * In the case of using the Auguria template, change eldy to auguria.
     *
     * TODO: The options not allowed for the user should be disabled
     * TODO: The initial implementation is very basic. Needs improvements.
     *
     * @author  Rafael San José Tovar <info@rsanjoseo.com>
     * @version sept. 2021
     *
     */
    private function getSubmenu()
    {
        $module = strtolower(filter_input(INPUT_GET, 'module'));
        $menu = new Menu();
        $this->submenu = $menu->getSubmenu($module);
    }

    /**
     * Add a new element to a value saved in the array that is passed to the
     * template.
     * It is used when what we are saving is an array and we want to add a
     * new element to that array.
     *
     * @param $name
     * @param $value
     *
     * @return void
     */
    public function addToVar(string $name, string $value)
    {
        $this->vars[$name][] = $value;
    }

    /**
     * Check if the resource is in the application's resource folder (for example, in the css or js folders
     * of the skin folder). It's a specific file.
     *
     * If it can not be found, check if it is in the templates folder (for example in the css or
     * js folders of the templates folder). It's a common file.
     *
     * If it is not in either of the two, no route is specified (it will surely give loading error).
     *
     * @param string  $resourceName      , is the name of the file (without extension)
     * @param string  $resourceExtension , is the extension (type) of the resource (js or css)
     * @param boolean $relative          , set to false for use an absolute path.
     *
     * @return string the complete path of resource.
     * @throws DebugBarException
     */
    public function addResource(string $resourceName, string $resourceExtension = 'css', $relative = true): string
    {
        $path = $resourceName . '.' . $resourceExtension;
        if ($relative) {
            if (file_exists($this->render->getTemplatesFolder() . $path)) {
                return $this->render->getTemplatesUri() . $path;
            }
            if (file_exists($this->render->getCommonTemplatesFolder() . $path)) {
                return $this->render->getCommonTemplatesUri() . $path;
            }
            if (file_exists(BASE_FOLDER . $path)) {
                return BASE_URI . $path;
            }
            $this->debug->addMessage('messages', "Relative resource '$path' not found!");
        }
        if (!file_exists($path)) {
            $this->debug->addMessage('messages', "Absolute resource '$path' not found!");
        }
        return $path;
    }

    /**
     * Finally render the result.
     *
     * @throws DebugBarException
     */
    public function __destruct()
    {
        if (!isset($this->render)) {
            return;
        }
        if (!$this->render->hasTemplate()) {
            $this->render->setTemplate('default');
        }

        if (method_exists($this, 'printPage')) {
            /**
             * TODO: At the moment we are not using Twig because it is easier to debug that way.
             */
            $this->printPage(); // This replaces the call to Twig as long as we do not have it activated.
        } else {
            echo $this->render->render($this->vars);
        }
    }

    /**
     * Saves a value in the array that is passed to the template.
     *
     * @param string $name
     * @param string $value
     *
     * @return void
     */
    public function setVar(string $name, string $value)
    {
        $this->vars[$name] = $value;
    }

    /**
     * Returns a previously saved value in the array that is passed to the
     * template.
     *
     * @param $name
     *
     * @return array|string|boolean|null
     */
    public function getVar(string $name)
    {
        return isset($this->vars[$name]) ?? [];
    }

    /**
     * Returns the necessary html code in the header of the template, to
     * display the debug bar.
     */
    public function getHeader(): string
    {
        return DebugTool::getRenderHeader();
    }

    /**
     * Returns the necessary html code at the footer of the template, to
     * display the debug bar.
     */
    public function getFooter(): string
    {
        return DebugTool::getRenderFooter();
    }

    /**
     * Obtains an array with all errors messages in the stack
     *
     * @return array
     */
    public function getErrors(): array
    {
        return FlashMessages::getContainer();
    }

}
