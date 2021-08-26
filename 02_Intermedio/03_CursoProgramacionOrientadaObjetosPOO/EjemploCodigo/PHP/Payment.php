<?php
class Payment {
    private $id;  
    private $fecha;  

    public function __construct($id, $fecha) {
        $this->id = $id;
        $this->fecha = $fecha;
      }
}