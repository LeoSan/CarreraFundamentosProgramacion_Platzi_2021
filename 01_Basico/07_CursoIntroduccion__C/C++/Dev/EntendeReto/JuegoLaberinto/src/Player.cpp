#include <iostream>
#include "Player.h"

Player::Player()//Esto es u un constructor
{
    //Declaro variables
    x=1;
    y=1;
    NombreHeroe = ' ';

}

int Player::XAxis(){
    return x;
}

int Player::YAxis(){
    return y;
}

int Player::XLast(){
    return lastX;
}
int Player::YLast(){
    return lastY;
}

void Player::setXLast(int x){
    lastX = x;
}
void Player::setYLast(int y){
    lastY = y;
}



 void Player::CallInput(){
    //Declaro Variables
    char UserInput = ' ';
    //Leo en pantalla
    // cout << "Tu \1 Mortal "<< nom << ",  pseudo Heroe. " <<endl;
     cout << "Tu \1 Mortal ,  pseudo Heroe. " <<endl;

    cout << "Recordar las reglas!!!!  " <<endl;
    cout << "Si no fallaras, Recuerda moverte en el laberinto de esta forma!!!" <<endl;
    cout << "\30 Tecla (w)" <<endl;
    cout << "\31 Tecla (s)" <<endl;
    cout << "\32 Tecla (d)" <<endl;
    cout << "\33 Tecla (a)" <<endl;

    //Permite solicitar entrada de variable por teclado
    cin >> UserInput;

    switch(UserInput){
        case 'w':
            setYLast(y);
            y=y-1;
            //cout << "El jugador se mueve arriba" <<endl;
        break;
        case 's':
            setYLast(y);
            y=y+1;
            //cout << "El jugador se mueve abajo" <<endl;
        break;
        case 'd':
            setXLast(x);
            x=x+1;
            //cout << "El jugador se mueve derecha" <<endl;
        break;
        case 'a':
            setXLast(x);
            x=x-1; //Validacion que no se vaya al negativo
            //cout << "El jugador se mueve izquierda" <<endl;
        break;
        default:
            cout << "Intenta otra vez con la tecla adecuada" << endl;
            break;

    }//fin del switch

    //cout << "Mi jugador esta en las coordendas :" << x << ","<< y <<endl;
 }

 void Player::ResetToSafePosition(){
     x = XLast();
     y = YLast();
 }















/* Es un Desctructor
Player::~Player()//Desctructor
{
    //dtor
}*/
