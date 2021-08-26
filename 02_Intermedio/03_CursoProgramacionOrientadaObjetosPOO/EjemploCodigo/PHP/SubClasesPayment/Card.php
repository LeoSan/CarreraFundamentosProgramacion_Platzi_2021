<?php
require_once('../Payment.php');

class Card extends Payment{
    public $numberCard;
    public $dateVec;
    public $cvv; 

    public function __construct($id, $fecha, $numberCard, $dateVec, $cvv ) {
        parent ::__construct($id, $fecha); //llamo al metodo consturctor de Payment ->  esto es por que Payment tiene un constructor 
        $this->numberCard = $numberCard;
        $this->dateVec = $dateVec;
        $this->cvv = $cvv;
    }

}
