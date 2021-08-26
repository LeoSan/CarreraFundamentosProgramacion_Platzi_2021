package Java;

public class Car {
    private Integer id;
    private String license;
    private Account driver;
    private Integer passgenger;

    public Car(String license, Account driver){
        this.license = license;
        this.driver  = driver;
    }

    void printDataCar(){
        System.out.println("\nCar Licencia:" + license);
        System.out.println("\nCar Conductor : " + driver.name +" Documentacion :"+driver.document);
    }

    public Integer getPassgenger(){
        return passgenger; 
    }
   
    public void setPassgenger(Integer passgenger){
        this.passgenger = passgenger; 
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLicense() {
        return license;
    }

    public void setLicense(String license) {
        this.license = license;
    }

    public Account getDriver() {
        return driver;
    }

    public void setDriver(Account driver) {
        this.driver = driver;
    }


}
