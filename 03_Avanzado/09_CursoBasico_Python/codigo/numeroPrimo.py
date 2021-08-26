'''para saber si un número es primo, se divide este entre los primeros números primos hasta su raiz cuadrada;
si el resultado de alguna de estas divisiones es exacto entonces el número no es primo'''

def es_primo(numero):
    
    validacion = True
    for i in range(1, int(round(numero**(1/2.0),0))):
        if i==1 or i==numero:
            continue
        if numero % i ==0:
            validacion=False
            break
    return validacion


def run():
    numero = int(input("Ingresa un número entero  "))
    if es_primo(numero):
        print("El número {} es primo".format(numero))
    else:
        print("El número {} no es primo".format(numero))        


if __name__ == "__main__":
    run()