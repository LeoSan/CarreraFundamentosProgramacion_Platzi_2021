<?php
require_once('../Payment.php');

class Paypal extends Payment{
    public $email;

    public function __construct($id, $fecha, $email ) {
        parent ::__construct($id, $fecha); //llamo al metodo consturctor de Payment ->  esto es por que Payment tiene un constructor 
        $this->email = $email;
    }

}
