<?php
require_once('../Car.php');


class UberVan extends Car{
    public $typeCarAccepted;
    public $seatMaterial;

    public function __construct($license, $driver, $typeCarAccepted, $seatMaterial ) {
        parent ::__construct($license, $driver); //llamo al metodo consturctor de Car ->  esto es por que Car tiene un constructor 
        $this->typeCarAccepted = $typeCarAccepted;
        $this->model = $seatMaterial;
    }

}
