# Mi Entendimiento

Por lo que puedo comprender es que este patron de diseño, se enfoca en mantener la logica principal en una clase creadora y nos apoyamos con subclases para equilibrar nuevas funcinalidades, aplicando una combicanción SOLID  

S: simple responsabilidad -> Una clase principal que contiene la responsabilidad principal 
O: Open/Closed -> subclases que permite crear nuevas funcionalidades sin afectar el nucleo original 
D: Principio de Inversión de Dependencias: fundamental ya que tenemos Modulo de alto nivel y modulos de bajo nivel y estos no deben depender uno del otro para no afectar o cambiar bloques principales del codigo por lo que usamos una clase abstrata (Interfaz) para lograr el acoplamiento.  
 
Ahora nos apoyamos en una interfaz y clases concretas que van de la mano para realizar el desarrollo por cada clase concreta lleva una interfaz, con el proposito de abstraer cada funcionalidad realacionada con la nueva funcionalidad. por ejemplo si usamos el caso de un notificador este tendra su interfaz Creador llamada **Notificador** es la clase abstrata del Producto, y clas clases concretas son su nuevas funcionalidades como NotificadorEmail, NotificadorSMS, NotificadorWhatsApp estas son modulos de bajo nivel y para no depender del modulo de alto nivel que viene siendo la logica principal de envios el **Notificador** permite el acomplamiento sin alterar bloque reglas de negocio. 

Mas alla de memorizar el concepto: Puedo comprender que es un mecanimos que impletamos una interfaz para crear objetos en una superclase, mienstras nos permite alterar el tipo de objeto que se usaran permitiendo reducir y eliminar el acoplamiento rigido entre el codigo del cliente y las clases concretas. 



## **Caracteristicas**
- Lo usamos cuando desconocemos las dependencias y no sabemos los tipos de objetos
- Filosofia de Crear Productos y subproductos conocer esto ayuda mucho para el desarrollo. 
- Principios SOLID Usados S y O. 

## **Ventajas**
- Al crear una instancia se logra un ahorro no en cuanto de computo y memoria, ahorro en mantenimiento, acomplamiento y desarrollo 
- Al no conocer las dependencias y tipos de objetos es comodo usar este patron
- Como usamos interfaz tenemos la ventaja de instanciar de manera abstrata sin afectar la linea principal
-  reduce y elimina el acoplamiento rígido entre el código cliente y las clases concretas.


## **Desventajas**
- Se vuelve complejo ya que se debe realizar muchas subclases para las nuevas implementaciones


## **Ejemplos**
- Tenemos un Negocio de Logisticas de entrega, el día de hoy es excelente entregando por Camiones, pero el día de mañana llega un nuevo cliente que desea que entregue por Mar y que se pueda entregar por Barco. 
- Tenemos un sistema de notificación principal pero esta funcionando solo por correo, pero ahora se necesita crear notificaciones por SMS, Whats, Telegram, Push Navegador. 



