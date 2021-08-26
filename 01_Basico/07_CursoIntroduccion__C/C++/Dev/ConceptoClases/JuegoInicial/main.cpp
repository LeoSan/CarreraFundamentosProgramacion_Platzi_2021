#include <iostream>
#include <unistd.h>
#include <fstream>
#include <string>

void MapWarning()
{
  std::cout << "Estas saliendo del mapa y te puedes perder\n" << std::endl;
  sleep(2);
}

void InvalidKey()
{
  std::cout << "Tecla invalida, intenta nuevamente\n";
  sleep(2);
}

void Abandon()
{
  std::cout << "\nHas decidido abandonar el juego.\n";
  sleep(2);
}

void DrawMap(int HeroPosX, int HeroPosY, char GameMap[5][5])
{
  for(int i=0; i < 5; i++)
  {
    for(int j=0; j < 5; j++)
    {
      if(i != HeroPosY)
        std::cout << GameMap[j][i];
      else if(j != HeroPosX)
        std::cout << GameMap[j][i];
      else
        std::cout << '8';
    }
    std::cout << std::endl;
  }
}

void SaveProgress(int x, int y)
{
  std::cout << "Salvando tu progreso...\n";
  sleep(1);
  std::cout << "Listo!\n";
  sleep(1);
  int renglon = 0;
  std::string line;
  std::ofstream InputData("GameMap.txt");
  if(InputData.is_open())
  {
    InputData << x << std::endl;
    InputData << y << std::endl;
    InputData.close();
  }
  else
    std::cout << "No se pudo salvar el progreso";
}

int main()
{
  int HeroPosX = 0;
  int HeroPosY = 0;
  bool IsGameOver = false;
  char respuesta = ' ';
  char Input = ' ';
  std::string Name = "";
  char GameMap [5][5] =
  {
    {'1','1','1','1','1'},
    {'1','1','1','1','1'},
    {'1','1','1','1','1'},
    {'1','1','1','1','1'},
    {'1','1','1','1','1'}
  };
  std::cout << "Deseas iniciar desde 0 o desde la ultima partida guardada?: \n";
  std::cout << "(\"i\" para inicio, \"u\" para ultima partida salvada: \n";
  std::cin >> respuesta;
  std::cout << "\n";

  if(respuesta == 'i')
  {
    std::ofstream CreateFile("GameMap.txt");
    if(CreateFile.is_open())
    {
      CreateFile << "Hola jugadores\n";
      CreateFile << "Mi nombre es: \n";
      std::cout << "Introduce tu nombre de heroe: \n";
      std::cin >> Name;
      CreateFile << Name << std::endl;
      CreateFile.close();
      std::cout << "Ingresa posicion en X (recuerda, es un mapa de 5x5 que comienza con indices en 0 : \n";
      std::cin >> HeroPosX;
      std::cout << "Ingresa posicion en Y (recuerda, es un mapa de 5x5 que comienza con indices en 0 : \n";
      std::cin >> HeroPosY;
    }
    else
    {
      std::cout << "Error al crear archivo";
      return 0;
    }
  }
  else if(respuesta == 'u')
  {
    std::ifstream ReadMap("GameMap.txt");
    std::string line;
    int renglon = 0;
    if(ReadMap.is_open())
    {

      while (getline(ReadMap, line))
        {
          if (renglon == 0)
            //HeroPosX = stoi(line);
          if (renglon == 1)
            //HeroPosY = stoi(line);
          renglon ++;
        }
      ReadMap.close();
    }
    else
    {
      std::cout << "No existe el archivo o no pudo abrirse\nSe creara un nuevo archivo\n\n";
    }
  }
  else
  {
    std::cout << "Programa se cierra porque NO SABES LEER INSTRUCCIONES\n";
    std::cout << "Si no leiste lo primero, menos los controles del juego...\n";
    return 0;
  }

  DrawMap(HeroPosX, HeroPosY, GameMap);
  std::cout << "\nHola! Para mover tu avatar, usa las teclas: \n\n a - izquierda \n d - derecha \n w - arriba \n s - abajo \n p - para salir\n\n No te salgas del mapa!\n:";

  while(IsGameOver == false)
  {
    std::cin >> Input;

    switch(Input)
    {
      case 'd':
        if(HeroPosX < 4)
          HeroPosX++;
        else
          MapWarning();
        break;
      case 'a':
        if(HeroPosX > 0)
          HeroPosX--;
        else
          MapWarning();
        break;
      case 's':
        if(HeroPosY < 4)
          HeroPosY++;
        else
          MapWarning();
        break;
      case 'w':
        if(HeroPosY >0)
          HeroPosY--;
        else
          MapWarning();
        break;
      case 'p':
        IsGameOver = true;
        Abandon();
        SaveProgress(HeroPosX, HeroPosY);
        break;
      default:
        InvalidKey();
    }

    system("clear");
    DrawMap(HeroPosX, HeroPosY, GameMap);
  }
}
