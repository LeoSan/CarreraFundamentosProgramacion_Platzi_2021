#ifndef GAMEMAP_H
#define GAMEMAP_H
#include "MapCell.h"


class GameMap
{
    public:

        GameMap();

        //Declaramos variables
        bool isGameOver = false;
        //Creamos un apuntador
        MapCell* PlayerCell;

        //Columnas y filas
        MapCell cells[15][15];

        //Dibujo el mapa sin actualizar
        void DrawVictory();
        void DrawIntro();
        void Draw();

        //Esta funciona permite obtener las coorodendas del player y actualiza el mapa
        bool SetPlayerCell(int PlayerX, int PlayerY);

         void LoadMapFromFile();

    protected:


    private:
};

#endif // GAMEMAP_H
