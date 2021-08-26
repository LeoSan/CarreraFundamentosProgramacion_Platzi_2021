<<?php
include_once("../Account.php");

class Driver extends Account{
    public $typeUser;

    public function __construct($id, $name, $document, $email, $password, $typeUser)
    {
        parent::__construct($id, $name, $document, $email, $password);
        $this->typeUser = $typeUser;
    }
}
?>>