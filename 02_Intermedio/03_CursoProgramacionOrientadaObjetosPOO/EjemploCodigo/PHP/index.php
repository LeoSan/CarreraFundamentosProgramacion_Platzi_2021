<?php

require_once("SubClasesAccount/Driver.php");
require_once("Car.php");
include_once("SubClasesCar/UberX.php");


$driver = new Driver(1235, "Leonard Cuenca", "AMS123", "Driver@g.com", "mipasdword", "driver");

$car = new Car("AW456", new Account("Leonard Cuenca", "AMS123"));
$car->printDataCar();

$uberX = new UberX("AMD852", $driver, "Chevrolet", "Spark 2017" );
$uberX ->printDataCar();