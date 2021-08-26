#Programa Palindromo -> una palabra palindromo que se lee al derecho y al reves 
#Ejemplo Luz azul 

def palindromo(palabra):
    palabra = palabra.replace(' ', '')
    palabra = palabra.lower()
    palabraInvertida = palabra[::-1]
    if (palabra == palabraInvertida):
        return True
    else:
        return False    


def run():
    print("Validemos si es un palindromo")
    palabra = input("Escribe tu palabra para validar:")
    if palindromo(palabra) == True:
        print("Es palindromo")
    else:
        print("NO Es palindromo")

#Inicia el programa desde aqui 
if __name__ == '__main__':
    run()
