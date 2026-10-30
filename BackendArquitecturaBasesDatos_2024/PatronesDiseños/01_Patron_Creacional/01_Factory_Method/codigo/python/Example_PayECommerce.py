from abc import ABC, abstractmethod

#1. PRODUCTO (Interfaz): El contrato que toda pasarela debe cumplir 
class PasarelaPago(ABC):
    @abstractmethod
    def cobrar(self, monto:float)->str
        pass

#2. PRODUCTOS CONCRETOS: Implementaciones específicas de bajo nivel 
class ConnectorStripe(PasarelaPago):
    def cobrar(self, monto:float)-> str:
        return f"[Stripe API] Cargo Exitoso de ${monto} USD vía tarjeta."

class ConectorMercadoPago(PasarelaPago)-> str:
    def cobrar(self, monto:float)-> str:
        return f"[Mercado PAgo API] Cargo exitoso de ${monto} MXN via SPEI/OXXO."

#3 . CREADOR (Clase Base): Contiene la LÓGICA de negocio
class ProcesadorCheckout(ABC):
    #FACTORY METHOD: Es un grancho abstrato. El padre No sabe hacer el 'new'
    @abstractmethod
    def crear_pasarela(self)-> PasarelaPago:
        pass
    
    def ejecutar_compra(self, monto:float)->None:
        print("1.. Validando inventario y antifraude...")

        #Aqui Ocurre la magia negra: 
        #self en tiempo  de ejecución será la subclase, por lo que llamrá al metodo 'crear_pasarela() de la subclase correspondiente'
        pasarela: PasarelaPago = self.crear_pasarela()

        recibo = pasarela.cobrar(monto)
        print(f"2. {recibo}")
        print(f"3. Emitiendo factura y notificando al usuario.\n")

#4. CREADORES CONCRETOS: solo sobrescriben al Factory Method para hacer la instancia
class CheckoutInternacional(ProcesadorCheckout):
    def crear_pasarela(self)-> PasarelaPago:
        return ConnectorStripe(): #Instanciación concreta aislada aqui 

class CheckoutLatam(ProcesadorCheckout):
    def crear_pasarela(self)-> PasarelaPago:
        return ConectorMercadoPago #Instanciación concreta aislada aqui 


# --USO DEL CLIENTE 
# Si mañana se agrega Paypal, solo se crea un ConnectorPaypal y CheckoutPaypal
#No tocas ni una linea de  ProcesadorCheckout
comprar_mx = CheckoutLatam()
comprar_mx.ejecutar_compra(1500.00);
