var procesoApp = {
    //Declaracion Variables
    EstruturaMesajeExito: '<h5> <div class="alert alert-success pCenter"> <span class="glyphicon glyphicon-ok"></span>  <span> i_mensaje</span> </div></h5>',
    EstruturaMesajeInfo: '<h5><div class="alert alert-info pCenter"> <span class="glyphicon glyphicon-ok"></span> <span> i_mensaje</span> </div></h5>',
    EstruturaMesajePeligro: '<h5><div class="alert alert-danger pCenter"> <span class="glyphicon glyphicon-info-sign"></span> <span> i_mensaje</span> </div></h5>',
    EstruturaMesajeAdvertencia: '<h5><div class="alert alert-warning pCenter"> <span class="glyphicon glyphicon-info-sign"></span> <span> i_mensaje</span> </div></h5>',
    mensajeExito01:  '! Almacenamiento exitoso de Datos ¡',

    //Metodo Inicial
    init: function () {
        procesoApp.readSelectors();
        procesoApp.eventHidden();
       
    },// fin init
    //Meetodo  nuevo con función Arrow function 
    readSelectors: () =>{
        const boton = document.querySelector('#boton');
        const menu = document.querySelector('#menu');

    },    
    //Metodo viejo  
    eventHidden:function () {
        boton.addEventListener('click', () => {
            console.log('click');
            menu.classList.toggle('hidden');
        })
    },
};

procesoApp.init();