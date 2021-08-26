from Payment import Payment

class Cash(Payment):
    email   = str 

    def __init__(self, id, fecha, email):
        super().__init__(id, fecha)
        self.email    = email
        