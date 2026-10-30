from abc import ABC, abstractmethod

# 1. Interfaz Producto
class CanalNotificacion(ABC):
    @abstractmethod
    def enviar(self, destinatario: str, mensaje: str) -> bool:
        pass

# 2. Productos Concretos
class ClienteEmailSMTP(CanalNotificacion):
    def enviar(self, destinatario: str, mensaje: str) -> bool:
        print(f"Enviando Email a {destinatario}: '{mensaje}' vía puerto 587.")
        return True

class ClienteWhatsAppAPI(CanalNotificacion):
    def enviar(self, destinatario: str, mensaje: str) -> bool:
        print(f"Enviando WhatsApp al número {destinatario}: '{mensaje}' vía Meta Graph API.")
        return True

# 3. Creador Base
class ServicioAlertas(ABC):
    @abstractmethod
    def crear_canal(self) -> CanalNotificacion:
        pass

    def disparar_alerta_seguridad(self, usuario: str, ip: str) -> None:
        mensaje_formateado = f"[ALERTA] Inicio de sesión detectado desde IP {ip}"
        # Invocamos al Factory Method
        canal = self.crear_canal()
        exito = canal.enviar(usuario, mensaje_formateado)
        if exito:
            print("-> Log guardado en base de datos de auditoría.\n")

# 4. Creadores Concretos
class AlertaPorCorreo(ServicioAlertas):
    def crear_canal(self) -> CanalNotificacion:
        return ClienteEmailSMTP()

class AlertaPorWhatsApp(ServicioAlertas):
    def crear_canal(self) -> CanalNotificacion:
        return ClienteWhatsAppAPI()

# --- USO ---
alerta = AlertaPorWhatsApp()
alerta.disparar_alerta_seguridad("+525512345678", "192.168.1.100")