#include "MapCell.h"
//Eto es su constructor
MapCell::MapCell()
{
    id = 0;

}

bool MapCell::IsBlocked(){
    if ( id == '1' ){
        return true;
    }else{
        return false;
    }
}
