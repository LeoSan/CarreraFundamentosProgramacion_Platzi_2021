<?php
require_once('../Car.php');
require_once('Driver.php');

class UberPool extends Car{
    public $brand;
    public $model;

    public function __construct($license, $driver, $brand, $model ) {
        parent ::__construct($license, $driver); //llamo al metodo consturctor de Car ->  esto es por que Car tiene un constructor 
        $this->brand = $brand;
        $this->model = $model;
    }

}
