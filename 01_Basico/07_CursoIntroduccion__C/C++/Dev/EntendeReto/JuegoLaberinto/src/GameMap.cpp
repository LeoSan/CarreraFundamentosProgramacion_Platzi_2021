#include "GameMap.h"
#include <iostream>
#include <fstream>
#include<stdio.h>
#include "windows.h"

using namespace std;

//Nuestro constructor
GameMap::GameMap()
{
    //system("color 14");
    PlayerCell = NULL;
    LoadMapFromFile();
    isGameOver = false;

}

void GameMap::Draw(){
    for(int i = 0; i < 15; i++ ){
        for(int j = 0; j < 15; j++ ){
             cout << cells[i][j].id;
        }
        cout << endl;
    }
}

bool GameMap::SetPlayerCell(int PlayerX, int PlayerY){

            //Logica para ganar
            if ( cells[PlayerY][PlayerX].id == '$' ){
                DrawVictory();
                isGameOver = true;
                return true;

            }else{

                //Logica de colision
                if ( cells[PlayerY][PlayerX].IsBlocked() == false  ){

                    if ( PlayerCell != NULL){
                        PlayerCell->id = 0; //Esto permite borrar el paso del  heroe
                    }
                    //Magia negra
                    PlayerCell = &cells[PlayerY][PlayerX];
                    PlayerCell->id = '\1'; // Pinta del movimiento del heroe

                    return true;
                }else{
                    return false;
                }
        }
    //cout << " las coordenadas del jugador estan :" << PlayerX << "," << PlayerY;

}

void GameMap::DrawVictory(){
     string line;
    int row = 0;

    ifstream MyFile("Vic.txt"); // Input de flujo de datos

    if ( MyFile.is_open() ){

            //Permite pintar al jugador en la celda dentro del mapa creado en txt
            while(getline(MyFile, line)){
                    cout << line << endl;
            }
           // cin >>line;

    }else{
        cout << "No pude cargar la vistoria";

    }

}

void GameMap::DrawIntro(){
     string line;
    int row = 0;

    ifstream MyFile("Intro.txt"); // Input de flujo de datos

    if ( MyFile.is_open() ){

            //Permite pintar al jugador en la celda dentro del mapa creado en txt
            while(getline(MyFile, line)){
                    cout << line << endl;
            }
          // Sleep(3);

    }else{
        cout << "No pude cargar el intro";

    }

}

void GameMap::LoadMapFromFile(){

    string line;
    int row = 0;

    ifstream MyFile("Map.txt"); // Input de flujo de datos

    if ( MyFile.is_open() ){

            //Permite pintar al jugador en la celda dentro del mapa creado en txt
            while(getline(MyFile, line)){
                    cout << line << endl;
                    for (int p = 0;  p < line.length(); p++  ){
                       if ( line[p] == '0' ){
                            cells[row][p].id = 0; // 0 es vacio en ca++,  pinta el espacio vacio
                       }else{
                            cells[row][p].id = line[p]; // Pinta lo que trae el txt
                       }

                    }
                    row++;
            }

    }else{
        cout << "Fatal Error: Este archivo no se cargo";
        ofstream FileCreated("Map.txt");
            if ( FileCreated.is_open() ){



               /* for (int i = 0; i < ROW; i++){
                    for (int j = 0; j < COL; j++){
                        if (i == 0 || i == (ROW-1) || j == 0 || j == (COL-1)){
                            FileCreated << 1;
                        }else{
                            FileCreated << 0;
                        }
                    }
                    FileCreated << endl;
                }*/


            }else{
                cout << "Fatal Error: Este archivo no se creo";
            }
    }
}




