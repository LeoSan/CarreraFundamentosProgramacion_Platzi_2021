package Java.SubClasesCar;

import Java.Account;
import Java.Car;

public class UberX extends Car{
    
    String brand;
    String model;

    public UberX(String license, Account driver, String brand,  String model){
        super(license, driver);//llamo al metodo consturctor de Car ->  esto es por que Car tiene un constructor 
        this.brand = brand;
        this.model  = model;
    }
}
