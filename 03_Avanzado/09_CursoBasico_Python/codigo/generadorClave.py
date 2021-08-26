import random
import string

def generar_contrasena():
    
    #Es opcional 
    mayusculas = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'Ñ','O', 'P','Q', 'R', 'S', 'T', 'U', 'V','W', 'X', 'Y', 'Z']
    minusculas = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'ñ','o', 'p','q', 'r', 's', 't', 'u', 'v','w', 'x', 'y', 'z']
    simbolos = ['!', '#', '$', '%', '&', '/', '(', ')']
    numeros = ['1', '2', '3', '4', '5', '6', '7', '8','9','0']

    caracter = string.ascii_lowercase + string.digits + string.punctuation + string.ascii_uppercase

    contrasena = []

    while (len(contrasena) < 16):
        caracteres=random.choice(caracter)    
        contrasena.append(caracteres)

    contrasena = "".join(contrasena)
    return contrasena

def run():
    contrasena = generar_contrasena()
    print('Tu nueva contraseña es: '+ contrasena)

if __name__ == "__main__":
    run()