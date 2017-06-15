;
(function($) {

    function diaSemana(index){
        var diasSemana = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado");
        return diasSemana[index];
    };

    function elMes(index){
        var meses = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
        return meses[index];
    };

    function fecha() {
        var f = new Date();
        laFecha = diaSemana(f.getDay()) + ", " + f.getDate() + " de " + elMes(f.getMonth()) + " de " + f.getFullYear();
        return laFecha;
    };

    $('<p>' + fecha() + '</p>').appendTo('#fecha');

    $(document).on('mousemove', function(e){
        var mouseX = e.clientX;
        var mouseY = e.clientY;
        return mouseX + mouseY * 1;
    });

})(Zepto)
