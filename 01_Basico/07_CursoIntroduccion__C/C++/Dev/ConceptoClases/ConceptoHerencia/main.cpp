#include <iostream>
#include <string.h>
using namespace std;

class Persona
{
	public:
		Persona(string nombre, int edad) //constructor persona
		{
			p_nombre=nombre;
			p_edad=edad;
		}

		void hi()
		{
			cout<<"Hola me llamo "<<p_nombre<<" y tengo "<<p_edad<<endl;
		}

	protected: //protected es private pero deja heredar los atributos
		string p_nombre;
		int p_edad;

};

class Profesor : public Persona
//hereda métodos y atributos publicos de persona
{
	public:
//se declaran las mismas variables que el constructor padre
//junto con las variables extras que tendrá la nueva clase
//y despues de los : se le pasan las variables sin declarar
//del objeto padre

	Profesor(string nombre, int edad, string grado) :Persona(nombre, edad)
		{
			p_nombre=nombre;
			p_edad=edad;
			p_grado=grado;
		}

		void grade()
		{
			cout<<"Doy clases a nivel "<<p_grado;
		}

	protected:
		string p_grado;
};


int main()
{
	Persona Juan("juan", 30);
	Juan.hi();

	Profesor Maria("maria",90, "Secundaria");

	Maria.hi();

	Maria.grade();

	return 0;
}
