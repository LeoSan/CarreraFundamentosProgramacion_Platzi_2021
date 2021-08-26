package Java.SubClasesCar;
import java.util.ArrayList;
import java.util.Map;

import Java.Account;
import Java.Car;

public class UberBlack extends Car {

    //Map<String, Map<String, Integer>> typeCarAccepted;
    Map<String, ArrayList<Integer>> typeCarAccepted;
    ArrayList<String> seatMaterial;


    public UberBlack(String license, Account driver, Map<String, ArrayList<Integer>> typeCarAccepted, ArrayList<String> seatMaterial){
        super(license, driver);//llamo al metodo consturctor de Car ->  esto es por que Car tiene un constructor 
        this.typeCarAccepted = typeCarAccepted; 
        this.seatMaterial = seatMaterial; 
    }

    
}
