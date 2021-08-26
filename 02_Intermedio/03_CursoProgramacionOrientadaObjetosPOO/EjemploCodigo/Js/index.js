import Car from 'Car.js';
import Cuenta from 'Account.js';
import uberX from 'UberX.js';

const Coche = new Car("LEO852", new Cuenta("Leonard Jose", "AMD123") );
Coche.passenger = 4; 
Coche.printDataCar();

var uberX = new UberX("AW456", new Cuenta("Andrea Ferran", "ANDA765"), "Chevrolet", "Spark")
uberX.passenger = 4;
uberX.printDataCar();