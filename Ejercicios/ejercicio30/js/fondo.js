;
(function($) {
    var duracion = parseInt($('#fondo').attr('duration')) * 1000; // en milisegundos
    var imgLen = $('#fondo li').length;
    var delay = (duracion / imgLen); // dividir duración entre el número de imágenes
    var efecto = delay / 2;

    $('body, ul, li').css({
        margin: '0',
        padding: '0'
    })

    $('#fondo').css({
        position: 'fixed',
        width: '100%',
        height: '100%',
        top: '0',
        left: '0',
        zIndex: '-1'
    });

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

    $('#fondo li').forEach(function(item, index) {
        item.style.backgroundImage = 'url(' + item.getAttribute('img') + ')';
        if (index != 0) {
            item.style.opacity = 0
        } else {
            item.style.opacity = 1
        };
        return true;
    });

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

    let origen = new Array();
    $('#fondo li').forEach(function(item, index) {
        origen.push(item);
    });
    let primero = origen.shift();
    origen.push(primero);

    origen.forEach(function(item, index) {
        setTimeout(siguienteFondo, index * delay, item, duracion);
    });
})(Zepto)
