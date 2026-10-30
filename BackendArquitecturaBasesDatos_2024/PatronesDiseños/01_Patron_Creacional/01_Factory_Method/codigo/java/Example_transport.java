//1. Interfaz del Producto 
public interface Transporte{
  String entregar();
}

//2. Productos Concretos
public class Camion implements  Transporte{
  @Override
  public String entregar(){
    return "Entrega por tierra en caja de carga cerrada.";
  }
}

public class Barco implements  Transporte{
  @Override
  public String entregar(){
    return "Entrega por mar en container";
  }
}

public class Avion implements  Transporte{
  @Override
  public String entregar(){
    return "Entregar en avión en caja presurizada";
  }
}

//3. creador abstrtato 
public abstract class Logistica{
  //Factory Method 
  public abstract Transporte crearTransporte();

  //Logica de negociación principal 
  public String planificarEntrega(){
    Transporte transporte  = crearTransporte();
    return "Logistica : operación Iniciada ->" + transporte.entregar();

  }

}
//4. Creadores Concretos 
public class LogisticaTerrestre extends Logistica{
  @Ovirride 
  public Transporte crearTransporte(){
    return new Camion();
  }

} 

public class LogisticaMaritima extends Logistica{
  @Override
  public Transporte crearTransporte(){
    return new Barco();
  }
}

public class LogisticaArea extends Logistica{
  @Override
  public Transporte crearTransporte(){
    return new Avion();
  }
}

// 5. Código Cliente 

public class Main{
  public static void ejecutar(Logistica logistica){
    System.out.println(logistica.planificarEntrega());
  }

  public static void main(String[] args){
    ejecutar(new LogisticaTerrestre);
    ejecutar(new LogisticaMaritima);
    ejecutar(new LogisticaArea);

  }
}