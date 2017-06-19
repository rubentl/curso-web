;
(function($) {
    var duracion = parseInt($('#fondo').attr('duration')) * 1000; // en milisegundos
    var imgLen = $('#fondo li').length;
    var delay = (duracion / imgLen); // dividir duración entre el número de imágenes
    var efecto = delay / 2;

    $('body, ul, li').css({  // pequeño reset
        margin: '0',
        padding: '0'
    })

    // Aplicamos los estilos a la capa
    $('#fondo').css({
        position: 'fixed',
        width: '100%',
        height: '100%',
        top: '0',
        left: '0',
        zIndex: '-1'
    });

    // Aplicamos los estilos a los elementos
    $('#fondo li').css({
        width: '100%',
        height: '100%',
        position: 'absolute',
        top: '0',
        left: '0',
        color: 'transparent',
        backgroundSize: 'cover',
        backgroundPosition: '50% 50%',
        backgroundRepeat: 'no-repeat',
        zIndex: '-1'
    });

    // Todas las imagenes ocultas menos la primera
    $('#fondo li').forEach(function(item, index) {
        item.style.backgroundImage = 'url(' + item.getAttribute('img') + ')';
        if (index != 0) {
            item.style.opacity = 0
        } else {
            item.style.opacity = 1
        };
        return true;
    });

    // Efecto fadeIn y fadeOut
    function fondo(item, efecto){
        $(item)
            .animate({
                opacity: 1
            }, efecto, 'linear', function() {
                setTimeout(function(item) {
                    $(item).animate({
                        opacity: 0
                    }, efecto, 'linear');
                }, efecto, item)
            });
        return item;
    };

    function siguienteFondo(item, duracion) {
        setInterval(fondo, duracion, item, efecto);
        return item;
    };

    // Copia de los elementos con las imagenes
    let origen = new Array;
    $('#fondo li').forEach(function(item){
        origen.push(item);
    });

    // El primero pasa a ser el último
    let primero = origen.shift();
    origen.push(primero);

    // A cada elemento lo colocamos en la secuencia temporal
    // y le aplicamos los efectos
    origen.forEach(function(item, index) {
        setTimeout(siguienteFondo, index * delay, item, duracion);
    });
})(Zepto)
