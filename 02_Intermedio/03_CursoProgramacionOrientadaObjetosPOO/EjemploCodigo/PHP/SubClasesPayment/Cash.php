<?php
require_once('../Payment.php');

class Cash extends Payment{
    public $efectivo;

    public function __construct($id, $fecha, $efectivo ) {
        parent ::__construct($id, $fecha); //llamo al metodo consturctor de Payment ->  esto es por que Payment tiene un constructor 
        $this->efectivo = $efectivo;
    }

}
