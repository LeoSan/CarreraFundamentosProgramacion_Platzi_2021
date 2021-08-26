#include <iostream>
using namespace std;
class Humanos
{
public:
    int edad;

    Humanos(int M_edad)
    {
     edad= M_edad;
     react();
    }

    void react()
    {
        setHuman(60, 50, 10);
    }

    void think()
    {
     cout << GetThink() << endl;
    }



private:
    int socialLevel;
    int inteligencia;
    int suerte;

    string GetThink()
    {
        if (socialLevel+suerte>100)
        {
            return "estoy feliz";
        }else if(suerte>inteligencia){
            return " soy un suertudo";
        }else if(edad<18){
            return "soy un bebe";
        }else{
            return "no pienso";
        }

    }

    void setHuman(int s, int i, int so){

        suerte = s;
        inteligencia = i;
        socialLevel = so;
    }
};
int main()
{
    Humanos Bob (19);
    Bob.think(); //aunque hacemos pensar a Bob, no sabemos que es lo que esta pasando adentro.
    return 0;
}
