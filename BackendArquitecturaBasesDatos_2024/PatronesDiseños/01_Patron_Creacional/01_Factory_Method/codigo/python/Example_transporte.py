from abc import ABC, abstractmethod

# 1. Interfaz del Producto
class Transporte(ABC):
    @abstractmethod
    def entregar(self) -> str:
        """Operación que todo producto concreto debe realizar."""
        pass

# 2. Productos Concretos
class Camion(Transporte):
    def entregar(self) -> str:
        return "Entrega por tierra en caja de carga cerrada."

class Barco(Transporte):
    def entregar(self) -> str:
        return "Entrega por mar en contenedor marítimo."

# 3. Creador Abstracto
class Logistica(ABC):
    @abstractmethod
    def crear_transporte(self) -> Transporte:
        """El Factory Method: las subclases deben implementar la instanciación."""
        pass

    def planificar_entrega(self) -> str:
        """Lógica de negocio central que consume el producto fabricado."""
        transporte = self.crear_transporte()
        resultado = transporte.entregar()
        return f"Logística: Operación iniciada -> {resultado}"

# 4. Creadores Concretos
class LogisticaTerrestre(Logistica):
    def crear_transporte(self) -> Transporte:
        return Camion()

class LogisticaMaritima(Logistica):
    def crear_transporte(self) -> Transporte:
        return Barco()

# 5. Código Cliente
def cliente_ejecutar(logistica: Logistica) -> None:
    print(logistica.planificar_entrega())

if __name__ == "__main__":
    cliente_ejecutar(LogisticaTerrestre())
    cliente_ejecutar(LogisticaMaritima())