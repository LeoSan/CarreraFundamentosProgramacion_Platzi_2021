from Acccount import Account

class Drive(Account):
    type     = int
    activo   = int
    
    def __init__(self, name, document, type, activo):
        super().__init__(name, document)
        self.type    = type
        self.activo  = activo 