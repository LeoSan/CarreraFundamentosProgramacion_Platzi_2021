from Car import Car
from Acccount import Account

if __name__ == "__main__":
    print("Hello world")

    car = Car("AMS234", "LEONARD", Account("Leonard Jose", "AND876"))

    print( vars(car) )
    print( vars(car.driver) )
    

