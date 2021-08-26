package Java.SubClasesCar;
import java.util.ArrayList;
import java.util.Map;

import Java.Account;
import Java.Car;

public class UberVan extends Car {

    private Integer passgenger; 

    //Map<String, Map<String, Integer>> typeCarAccepted;
    Map<String, ArrayList<Integer>> typeCarAccepted;
    ArrayList<String> seatMaterial;


    public UberVan(String license, Account driver, Map<String, ArrayList<Integer>> typeCarAccepted, ArrayList<String> seatMaterial){
        super(license, driver);//llamo al metodo consturctor de Car ->  esto es por que Car tiene un constructor 
        this.typeCarAccepted = typeCarAccepted; 
        this.seatMaterial = seatMaterial; 
    }

    @Override
    public void setPassgenger(Integer passgenger){
        //Ejemplo de Polimorfismo -> Car tiene su metodo definodo Superclase, pero esta subclase hija cambia el comportamiento sobreescribiento al original.
        if (passgenger <= 6 ){
            this.passgenger = passgenger;
        }else{
           System.out.println("Es Uber Van solo podemos llevar 6 personas o menos");
        }

    }

    
}
