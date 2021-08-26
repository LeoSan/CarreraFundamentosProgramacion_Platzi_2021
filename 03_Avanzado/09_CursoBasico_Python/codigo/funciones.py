#Programa ejemplo para usar función 

#funcion sin parametros
def imprimir_mensaje():
    print("Mensaje especial:")
    print("Estoy aprendiendo:")

imprimir_mensaje()    

#funcion con parametros
valorA= "Hola mundo"
valorB= "Función con parametros"

def imprimir_mensaje_param(mensaje1, mensaje2):
    print(mensaje1)
    print(mensaje2)

imprimir_mensaje_param(valorA, valorB)
