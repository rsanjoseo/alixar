<?php
/* Copyright (C) 2006-2016 	Laurent Destailleur  <eldy@users.sourceforge.net>
 * Copyright (C) 2012	 	Florian Henry			<florian.henry@open-concept.pro>
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
 *
 * Path to WSDL is: http://localhost/dolibarr/webservices/server_actioncomm.php?wsdl
 */

/**
 *       \file       htdocs/webservices/server_actioncomm.php
 *       \brief      File that is entry point to call Dolibarr WebServices
 */

if (!defined("NOCSRFCHECK")) {
    define("NOCSRFCHECK", '1');
}

require "../master.inc.php";
require_once NUSOAP_PATH . '/nusoap.php'; // Include SOAP
require_once DOL_DOCUMENT_ROOT . "/core/lib/ws.lib.php";

require_once DOL_DOCUMENT_ROOT . "/Modules/Comm/action/class/actioncomm.class.php";
require_once DOL_DOCUMENT_ROOT . "/Modules/Comm/action/class/cactioncomm.class.php";
require_once DOL_DOCUMENT_ROOT . '/core/class/extrafields.class.php';

dol_syslog("Call ActionComm webservices interfaces");

// Enable and test if module web services is enabled
if (empty($conf->global->MAIN_MODULE_WEBSERVICES)) {
    $langs->load("admin");
    dol_syslog("Call Dolibarr webservices interfaces with module webservices disabled");
    print $langs->trans("WarningModuleNotActive", 'WebServices') . '.<br><br>';
    print $langs->trans("ToActivateModule");
    exit;
}

// Create the soap Object
$server = new nusoap_server();
$server->soap_defencoding = 'UTF-8';
$server->decode_utf8 = false;
$ns = 'http://www.dolibarr.org/ns/';
$server->configureWSDL('WebServicesDolibarrActionComm', $ns);
$server->wsdl->schemaTargetNamespace = $ns;

// Define WSDL Authentication object
$server->wsdl->addComplexType(
    'authentication',
    'complexType',
    'struct',
    'all',
    '',
    [
        'dolibarrkey' => ['name' => 'dolibarrkey', 'type' => 'xsd:string'],
        'sourceapplication' => ['name' => 'sourceapplication', 'type' => 'xsd:string'],
        'login' => ['name' => 'login', 'type' => 'xsd:string'],
        'password' => ['name' => 'password', 'type' => 'xsd:string'],
        'entity' => ['name' => 'entity', 'type' => 'xsd:string'],
    ]
);

// Define WSDL Return object
$server->wsdl->addComplexType(
    'result',
    'complexType',
    'struct',
    'all',
    '',
    [
        'result_code' => ['name' => 'result_code', 'type' => 'xsd:string'],
        'result_label' => ['name' => 'result_label', 'type' => 'xsd:string'],
    ]
);

$actioncomm_fields = [
    'id' => ['name' => 'id', 'type' => 'xsd:string'],
    'ref' => ['name' => 'ref', 'type' => 'xsd:string'],
    'ref_ext' => ['name' => 'ref_ext', 'type' => 'xsd:string'],
    'type_id' => ['name' => 'type_id', 'type' => 'xsd:string'],
    'type_code' => ['name' => 'type_code', 'type' => 'xsd:string'],
    'type' => ['name' => 'type', 'type' => 'xsd:string'],
    'label' => ['name' => 'label', 'type' => 'xsd:string'],
    'datep' => ['name' => 'datep', 'type' => 'xsd:dateTime'],
    'datef' => ['name' => 'datef', 'type' => 'xsd:dateTime'],
    'datec' => ['name' => 'datec', 'type' => 'xsd:dateTime'],
    'datem' => ['name' => 'datem', 'type' => 'xsd:dateTime'],
    'note' => ['name' => 'note', 'type' => 'xsd:string'],
    'percentage' => ['name' => 'percentage', 'type' => 'xsd:string'],
    'author' => ['name' => 'author', 'type' => 'xsd:string'],
    'usermod' => ['name' => 'usermod', 'type' => 'xsd:string'],
    'userownerid' => ['name' => 'userownerid', 'type' => 'xsd:string'],
    'priority' => ['name' => 'priority', 'type' => 'xsd:string'],
    'fulldayevent' => ['name' => 'fulldayevent', 'type' => 'xsd:string'],
    'location' => ['name' => 'location', 'type' => 'xsd:string'],
    'socid' => ['name' => 'socid', 'type' => 'xsd:string'],
    'contactid' => ['name' => 'contactid', 'type' => 'xsd:string'],
    'projectid' => ['name' => 'projectid', 'type' => 'xsd:string'],
    'fk_element' => ['name' => 'fk_element', 'type' => 'xsd:string'],
    'elementtype' => ['name' => 'elementtype', 'type' => 'xsd:string'],
];

$elementtype = 'actioncomm';

//Retrieve all extrafield for actioncomm
// fetch optionals attributes and labels
$extrafields = new ExtraFields($db);
$extrafields->fetch_name_optionals_label($elementtype, true);
$extrafield_array = null;
if (is_array($extrafields) && count($extrafields) > 0) {
    $extrafield_array = [];
}
if (isset($extrafields->attributes[$elementtype]['label']) && is_array($extrafields->attributes[$elementtype]['label']) && count($extrafields->attributes[$elementtype]['label'])) {
    foreach ($extrafields->attributes[$elementtype]['label'] as $key => $label) {
        $type = $extrafields->attributes[$elementtype]['type'][$key];
        if ($type == 'date' || $type == 'datetime') {
            $type = 'xsd:dateTime';
        } else {
            $type = 'xsd:string';
        }

        $extrafield_array['options_' . $key] = ['name' => 'options_' . $key, 'type' => $type];
    }
}
if (is_array($extrafield_array)) {
    $actioncomm_fields = array_merge($actioncomm_fields, $extrafield_array);
}

// Define other specific objects
$server->wsdl->addComplexType(
    'actioncomm',
    'complexType',
    'struct',
    'all',
    '',
    $actioncomm_fields
);

$server->wsdl->addComplexType(
    'actioncommtype',
    'complexType',
    'array',
    'sequence',
    '',
    [
        'code' => ['name' => 'code', 'type' => 'xsd:string'],
        'libelle' => ['name' => 'libelle', 'type' => 'xsd:string'],
    ]
);

$server->wsdl->addComplexType(
    'actioncommtypes',
    'complexType',
    'array',
    'sequence',
    '',
    [
        'actioncommtype' => [
            'name' => 'actioncommtype',
            'type' => 'tns:actioncommtype',
            'minOccurs' => '0',
            'maxOccurs' => 'unbounded',
        ],
    ]
);

// 5 styles: RPC/encoded, RPC/literal, Document/encoded (not WS-I compliant), Document/literal, Document/literal wrapped
// Style merely dictates how to translate a WSDL binding to a SOAP message. Nothing more. You can use either style with any programming model.
// http://www.ibm.com/developerworks/webservices/library/ws-whichwsdl/
$styledoc = 'rpc'; // rpc/document (document is an extend into SOAP 1.0 to support unstructured messages)
$styleuse = 'encoded'; // encoded/literal/literal wrapped
// Better choice is document/literal wrapped but literal wrapped not supported by nusoap.

// Register WSDL
$server->register(
    'getListActionCommType',
    // Entry values
    ['authentication' => 'tns:authentication'],
    // Exit values
    ['result' => 'tns:result', 'actioncommtypes' => 'tns:actioncommtypes'],
    $ns,
    $ns . '#getListActionCommType',
    $styledoc,
    $styleuse,
    'WS to get actioncommType'
);

// Register WSDL
$server->register(
    'getActionComm',
    // Entry values
    ['authentication' => 'tns:authentication', 'id' => 'xsd:string'],
    // Exit values
    ['result' => 'tns:result', 'actioncomm' => 'tns:actioncomm'],
    $ns,
    $ns . '#getActionComm',
    $styledoc,
    $styleuse,
    'WS to get actioncomm'
);

// Register WSDL
$server->register(
    'createActionComm',
    // Entry values
    ['authentication' => 'tns:authentication', 'actioncomm' => 'tns:actioncomm'],
    // Exit values
    ['result' => 'tns:result', 'id' => 'xsd:string'],
    $ns,
    $ns . '#createActionComm',
    $styledoc,
    $styleuse,
    'WS to create a actioncomm'
);

// Register WSDL
$server->register(
    'updateActionComm',
    // Entry values
    ['authentication' => 'tns:authentication', 'actioncomm' => 'tns:actioncomm'],
    // Exit values
    ['result' => 'tns:result', 'id' => 'xsd:string'],
    $ns,
    $ns . '#updateActionComm',
    $styledoc,
    $styleuse,
    'WS to update a actioncomm'
);

/**
 * Get ActionComm
 *
 * @param array $authentication Array of authentication information
 * @param int   $id             Id of object
 *
 * @return    mixed
 */
function getActionComm($authentication, $id)
{
    global $db, $conf, $langs;

    dol_syslog("Function: getActionComm login=" . $authentication['login'] . " id=" . $id);

    if ($authentication['entity']) {
        $conf->entity = $authentication['entity'];
    }

    // Init and check authentication
    $objectresp = [];
    $errorcode = '';
    $errorlabel = '';
    $error = 0;
    $fuser = check_authentication($authentication, $error, $errorcode, $errorlabel);
    // Check parameters
    if ($error || (!$id)) {
        $error++;
        $errorcode = 'BAD_PARAMETERS';
        $errorlabel = "Parameter id, ref and ref_ext can't be both provided. You must choose one or other but not both.";
    }

    if (!$error) {
        $fuser->getrights();

        if ($fuser->rights->agenda->allactions->read) {
            $actioncomm = new ActionComm($db);
            $result = $actioncomm->fetch($id);
            if ($result > 0) {
                $actioncomm_result_fields = [
                    'id' => $actioncomm->id,
                    'ref' => $actioncomm->ref,
                    'ref_ext' => $actioncomm->ref_ext,
                    'type_id' => $actioncomm->type_id,
                    'type_code' => $actioncomm->type_code,
                    'type' => $actioncomm->type,
                    'label' => $actioncomm->label,
                    'datep' => dol_print_date($actioncomm->datep, 'dayhourrfc'),
                    'datef' => dol_print_date($actioncomm->datef, 'dayhourrfc'),
                    'datec' => dol_print_date($actioncomm->datec, 'dayhourrfc'),
                    'datem' => dol_print_date($actioncomm->datem, 'dayhourrfc'),
                    'note' => $actioncomm->note_private,
                    'percentage' => $actioncomm->percentage,
                    'author' => $actioncomm->authorid,
                    'usermod' => $actioncomm->usermodid,
                    'userownerid' => $actioncomm->userownerid,
                    'priority' => $actioncomm->priority,
                    'fulldayevent' => $actioncomm->fulldayevent,
                    'location' => $actioncomm->location,
                    'socid' => $actioncomm->socid,
                    'contactid' => $actioncomm->contact_id,
                    'projectid' => $actioncomm->fk_project,
                    'fk_element' => $actioncomm->fk_element,
                    'elementtype' => $actioncomm->elementtype,
                ];

                $elementtype = 'actioncomm';

                // Retrieve all extrafield for actioncomm
                // fetch optionals attributes and labels
                $extrafields = new ExtraFields($db);
                $extrafields->fetch_name_optionals_label($elementtype, true);
                //Get extrafield values
                $actioncomm->fetch_optionals();

                if (isset($extrafields->attributes[$elementtype]['label']) && is_array($extrafields->attributes[$elementtype]['label']) && count($extrafields->attributes[$elementtype]['label'])) {
                    foreach ($extrafields->attributes[$elementtype]['label'] as $key => $label) {
                        $actioncomm_result_fields = array_merge($actioncomm_result_fields, ['options_' . $key => $actioncomm->array_options['options_' . $key]]);
                    }
                }

                // Create
                $objectresp = [
                    'result' => ['result_code' => 'OK', 'result_label' => ''],
                    'actioncomm' => $actioncomm_result_fields,
                ];
            } else {
                $error++;
                $errorcode = 'NOT_FOUND';
                $errorlabel = 'Object not found for id=' . $id . ' nor ref=' . $ref . ' nor ref_ext=' . $ref_ext;
            }
        } else {
            $error++;
            $errorcode = 'PERMISSION_DENIED';
            $errorlabel = 'User does not have permission for this request';
        }
    }

    if ($error) {
        $objectresp = ['result' => ['result_code' => $errorcode, 'result_label' => $errorlabel]];
    }

    return $objectresp;
}

/**
 * Get getListActionCommType
 *
 * @param array $authentication Array of authentication information
 *
 * @return    mixed
 */
function getListActionCommType($authentication)
{
    global $db, $conf, $langs;

    dol_syslog("Function: getListActionCommType login=" . $authentication['login']);

    if ($authentication['entity']) {
        $conf->entity = $authentication['entity'];
    }

    // Init and check authentication
    $objectresp = [];
    $errorcode = '';
    $errorlabel = '';
    $error = 0;
    $fuser = check_authentication($authentication, $error, $errorcode, $errorlabel);

    if (!$error) {
        $fuser->getrights();

        if ($fuser->rights->agenda->myactions->read) {
            $cactioncomm = new CActionComm($db);
            $result = $cactioncomm->liste_array('', 'code');
            if ($result > 0) {
                $resultarray = [];
                foreach ($cactioncomm->liste_array as $code => $libeller) {
                    $resultarray[] = ['code' => $code, 'libelle' => $libeller];
                }

                $objectresp = [
                    'result' => ['result_code' => 'OK', 'result_label' => ''],
                    'actioncommtypes' => $resultarray,
                ];
            } else {
                $error++;
                $errorcode = 'NOT_FOUND';
                $errorlabel = 'Object not found for id=' . $id . ' nor ref=' . $ref . ' nor ref_ext=' . $ref_ext;
            }
        } else {
            $error++;
            $errorcode = 'PERMISSION_DENIED';
            $errorlabel = 'User does not have permission for this request';
        }
    }

    if ($error) {
        $objectresp = ['result' => ['result_code' => $errorcode, 'result_label' => $errorlabel]];
    }

    return $objectresp;
}

/**
 * Create ActionComm
 *
 * @param array      $authentication Array of authentication information
 * @param ActionComm $actioncomm     $actioncomm
 *
 * @return    array                            Array result
 */
function createActionComm($authentication, $actioncomm)
{
    global $db, $conf, $langs;

    $now = dol_now();

    dol_syslog("Function: createActionComm login=" . $authentication['login']);

    if ($authentication['entity']) {
        $conf->entity = $authentication['entity'];
    }

    // Init and check authentication
    $objectresp = [];
    $errorcode = '';
    $errorlabel = '';
    $error = 0;
    $fuser = check_authentication($authentication, $error, $errorcode, $errorlabel);

    if (!$error) {
        $newobject = new ActionComm($db);

        $newobject->datep = $actioncomm['datep'];
        $newobject->datef = $actioncomm['datef'];
        $newobject->type_code = $actioncomm['type_code'];
        $newobject->socid = $actioncomm['socid'];
        $newobject->fk_project = $actioncomm['projectid'];
        $newobject->note = $actioncomm['note'];
        $newobject->contact_id = $actioncomm['contactid'];
        $newobject->userownerid = $actioncomm['userownerid'];
        $newobject->label = $actioncomm['label'];
        $newobject->percentage = $actioncomm['percentage'];
        $newobject->priority = $actioncomm['priority'];
        $newobject->fulldayevent = $actioncomm['fulldayevent'];
        $newobject->location = $actioncomm['location'];
        $newobject->fk_element = $actioncomm['fk_element'];
        $newobject->elementtype = $actioncomm['elementtype'];

        $elementtype = 'actioncomm';

        //Retrieve all extrafield for actioncomm
        // fetch optionals attributes and labels
        $extrafields = new ExtraFields($db);
        $extrafields->fetch_name_optionals_label($elementtype, true);
        if (isset($extrafields->attributes[$elementtype]['label']) && is_array($extrafields->attributes[$elementtype]['label']) && count($extrafields->attributes[$elementtype]['label'])) {
            foreach ($extrafields->attributes[$elementtype]['label'] as $key => $label) {
                $key = 'options_' . $key;
                $newobject->array_options[$key] = $actioncomm[$key];
            }
        }

        $db->begin();

        $result = $newobject->create($fuser);
        if ($result <= 0) {
            $error++;
        }

        if (!$error) {
            $db->commit();
            $objectresp = ['result' => ['result_code' => 'OK', 'result_label' => ''], 'id' => $newobject->id];
        } else {
            $db->rollback();
            $error++;
            $errorcode = 'KO';
            $errorlabel = $newobject->error;
        }
    }

    if ($error) {
        $objectresp = ['result' => ['result_code' => $errorcode, 'result_label' => $errorlabel]];
    }

    return $objectresp;
}

/**
 * Create ActionComm
 *
 * @param array      $authentication Array of authentication information
 * @param ActionComm $actioncomm     $actioncomm
 *
 * @return    array                            Array result
 */
function updateActionComm($authentication, $actioncomm)
{
    global $db, $conf, $langs;

    $now = dol_now();

    dol_syslog("Function: updateActionComm login=" . $authentication['login']);

    if ($authentication['entity']) {
        $conf->entity = $authentication['entity'];
    }

    // Init and check authentication
    $objectresp = [];
    $errorcode = '';
    $errorlabel = '';
    $error = 0;
    $fuser = check_authentication($authentication, $error, $errorcode, $errorlabel);
    // Check parameters
    if (empty($actioncomm['id'])) {
        $error++;
        $errorcode = 'KO';
        $errorlabel = "Actioncomm id is mandatory.";
    }

    if (!$error) {
        $objectfound = false;

        $object = new ActionComm($db);
        $result = $object->fetch($actioncomm['id']);

        if (!empty($object->id)) {
            $objectfound = true;

            $object->datep = $actioncomm['datep'];
            $object->datef = $actioncomm['datef'];
            $object->type_code = $actioncomm['type_code'];
            $object->socid = $actioncomm['socid'];
            $object->contact_id = $actioncomm['contactid'];
            $object->fk_project = $actioncomm['projectid'];
            $object->note = $actioncomm['note'];
            $object->userownerid = $actioncomm['userownerid'];
            $object->label = $actioncomm['label'];
            $object->percentage = $actioncomm['percentage'];
            $object->priority = $actioncomm['priority'];
            $object->fulldayevent = $actioncomm['fulldayevent'];
            $object->location = $actioncomm['location'];
            $object->fk_element = $actioncomm['fk_element'];
            $object->elementtype = $actioncomm['elementtype'];

            $elementtype = 'actioncomm';

            //Retrieve all extrafield for actioncomm
            // fetch optionals attributes and labels
            $extrafields = new ExtraFields($db);
            $extrafields->fetch_name_optionals_label($elementtype, true);
            if (isset($extrafields->attributes[$elementtype]['label']) && is_array($extrafields->attributes[$elementtype]['label']) && count($extrafields->attributes[$elementtype]['label'])) {
                foreach ($extrafields->attributes[$elementtype]['label'] as $key => $label) {
                    $key = 'options_' . $key;
                    $object->array_options[$key] = $actioncomm[$key];
                }
            }

            $db->begin();

            $result = $object->update($fuser);
            if ($result <= 0) {
                $error++;
            }
        }

        if ((!$error) && ($objectfound)) {
            $db->commit();
            $objectresp = [
                'result' => ['result_code' => 'OK', 'result_label' => ''],
                'id' => $object->id,
            ];
        } elseif ($objectfound) {
            $db->rollback();
            $error++;
            $errorcode = 'KO';
            $errorlabel = $object->error;
        } else {
            $error++;
            $errorcode = 'NOT_FOUND';
            $errorlabel = 'Actioncomm id=' . $actioncomm['id'] . ' cannot be found';
        }
    }

    if ($error) {
        $objectresp = ['result' => ['result_code' => $errorcode, 'result_label' => $errorlabel]];
    }

    return $objectresp;
}

// Return the results.
$server->service(file_get_contents("php://input"));
