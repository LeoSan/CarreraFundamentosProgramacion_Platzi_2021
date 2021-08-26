#ifndef PLAYER_H
#define PLAYER_H

using namespace std;

class Player
{
    public:
        Player();
        char NombreHeroe;

        //Meotdo que permite ingresar los movimientos del jugador
        void CallInput();
        void ResetToSafePosition();
        //char IngreseNombre();
        //Getter para el movimiento del player
        int XAxis();
        int YAxis();
        int XLast();
        int YLast();

        //setter
        void setXLast(int x);
        void setYLast(int y);

        //Ultimas coordenedas


    //virtual ~Player();// Desctuctor

    protected:
        int x, y;
        int lastX, lastY;

    private:
};

#endif // PLAYER_H
