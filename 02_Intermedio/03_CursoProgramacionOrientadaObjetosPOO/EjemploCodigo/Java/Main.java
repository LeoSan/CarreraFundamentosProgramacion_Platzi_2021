package Java;

class Main {

    public static void main(String[] args) {
        System.out.println("Instancio objetos ");
        
        //Instancias  Objetos 
        Car car = new Car("LEO852",  new Account("Leonard Cuenca", "123648"));
        car.printDataCar();

        Car car2 = new Car("JOSE852",  new Account("kENNY", "AMD3648"));
        car2.printDataCar();        

    }

}
