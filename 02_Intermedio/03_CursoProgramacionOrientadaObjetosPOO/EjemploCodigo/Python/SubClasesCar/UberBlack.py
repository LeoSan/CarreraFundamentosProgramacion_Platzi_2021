from Car import Car

class UberBlack(Car):
    typeCarAccept = []
    seatMaterial  = []

    def __init__(self, license, driver, typeCarAccept, seatMaterial):
        super().__init__(license, driver)
        self.typeCarAccept = typeCarAccept
        self.seatMaterial = seatMaterial 
