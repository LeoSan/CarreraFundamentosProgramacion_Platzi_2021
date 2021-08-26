print("Hola, Usuario... Este programa te permite validar la conversion en distintas monedas");

print("Puedes escoger las siguientes opciones para realizar tu calculo:");
print("Marca(1): Para convertir a Pesos Mexicanos");
print("Marca(2): Para convertir a Pesos Colombianos");
print("Marca(3): Para convertir a Bolivares");

opcion = int(input("¿Que opción deseas ?:"))

def bloqueCalculo(pregunta, valor_dolar):
    moneda = input(pregunta)
    moneda = float(moneda)
    dolares = round(moneda / valor_dolar, 2)
    dolares = str(dolares)
    print( " Tu total de dolares convertidos son:  "+ dolares +"$" );


if opcion == 1:
    bloqueCalculo("¿Cuantos Pesos Mexicanos Tienes?:", 21)
elif opcion == 2:
    bloqueCalculo("¿Cuantos Pesos Colombianos Tienes?:", 3800)
else: 
    bloqueCalculo("¿Cuantos Bolivares Tienes?:", 3800)    

print("Gracias por usar el sistema");

