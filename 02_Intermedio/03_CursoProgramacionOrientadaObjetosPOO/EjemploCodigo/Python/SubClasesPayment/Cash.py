from Payment import Payment

class Cash(Payment):
    efectivo   = float 

    def __init__(self, id, fecha, efectivo):
        super().__init__(id, fecha)
        self.efectivo    = efectivo
    