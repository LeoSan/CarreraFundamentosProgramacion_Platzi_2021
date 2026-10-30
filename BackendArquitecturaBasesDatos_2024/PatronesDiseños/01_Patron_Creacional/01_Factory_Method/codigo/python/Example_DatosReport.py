from abc import ABC, abstractmethod

# 1. Interfaz Producto
class DocumentoReporte(ABC):
    @abstractmethod
    def renderizar(self, datos: dict) -> str:
        pass

# 2. Productos Concretos
class ArchivoCSV(DocumentoReporte):
    def renderizar(self, datos: dict) -> str:
        columnas = ",".join(datos.keys())
        valores = ",".join(str(v) for v in datos.values())
        return f"--- CSV ---\n{columnas}\n{valores}"

class ArchivoJSON(DocumentoReporte):
    def renderizar(self, datos: dict) -> str:
        import json
        return f"--- JSON ---\n{json.dumps(datos)}"

# 3. Creador Base
class GeneradorReportes(ABC):
    @abstractmethod
    def crear_documento(self) -> DocumentoReporte:
        pass

    def exportar_cierre_mensual(self, datos_crudos: dict) -> str:
        # Lógica común: sanitización o transformación previa
        datos_limpios = {k.upper(): v for k, v in datos_crudos.items()}
        
        # Delegación al Factory Method
        doc = self.crear_documento()
        return doc.renderizar(datos_limpios)

# 4. Creadores Concretos
class ExportadorContableCSV(GeneradorReportes):
    def crear_documento(self) -> DocumentoReporte:
        return ArchivoCSV()

class ExportadorAPIJSON(GeneradorReportes):
    def crear_documento(self) -> DocumentoReporte:
        return ArchivoJSON()

# --- USO ---
datos = {"ventas": 45000, "impuestos": 7200}
exportador = ExportadorContableCSV()
print(exportador.exportar_cierre_mensual(datos))