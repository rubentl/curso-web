;
(function($) {
    function fecha() {
        var meses = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
        var diasSemana = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado");
        var f = new Date();
        laFecha = diasSemana[f.getDay()] + ", " + f.getDate() + " de " + meses[f.getMonth()] + " de " + f.getFullYear();
        return laFecha;
    };

    $('<p>' + fecha() + '</p>').appendTo('#fecha');
    $(document).on('mousemove', function(e){
        let mouseX = e.clientX;
        let mouseY = e.clientY;
    });

})(Zepto)
