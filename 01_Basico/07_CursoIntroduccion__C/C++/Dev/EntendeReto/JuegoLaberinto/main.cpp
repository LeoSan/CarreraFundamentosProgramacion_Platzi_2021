#include <iostream>
#include "Player.h"
#include "MapCell.h"
#include "GameMap.h"

using namespace std;

int main()
{

    //instancio objeto
    GameMap  Map;
    Player   Hero;

    //Carga el intro
    Map.DrawIntro();

    //Declaro vaiables
    char NomPlayer;

    cout << "Hooo!! ¿ Dices ser un Heroe? " <<endl;
    cout << "Identificate y acepta el reto!!" <<endl;
    cout << "¿ Tendras el valor ? para encontrar el tesoro en este laberinto de la muerte, Di tu nombre e inicia!!!" <<endl;

    cin >> NomPlayer;

    //Ciclo de nuestro juego
    while( Map.isGameOver == false ){
        //Proceso del juego
        Hero.CallInput();
        //system('CLS');
       // system("clear");
        //Se debe actualizar la información del heroe al mapa
       if ( Map.SetPlayerCell(Hero.XAxis(), Hero.YAxis()) ){
            //Aqui Dibujamos el mapa
            Map.Draw();
       }else{
            Hero.ResetToSafePosition();
            //Aqui Dibujamos el mapa
            Map.Draw();
       }

    }
    //cout << "Hello world!" << endl;
    return 0;
}

