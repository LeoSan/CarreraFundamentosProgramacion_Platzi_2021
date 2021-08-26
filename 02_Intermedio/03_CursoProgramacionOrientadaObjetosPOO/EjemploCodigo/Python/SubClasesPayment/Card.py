from Payment import Payment

class Card(Payment):
    number     = int
    fechaVec   = str
    cvv        = str
    
    def __init__(self, id, fecha, number, cvv, fechaVec):
        super().__init__(id, fecha)
        self.number    = number
        self.fechaVec  = fechaVec 
        self.cvv       = cvv 