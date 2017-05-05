-module(pruebas).
-author("Rubén Toca").
-vsn("0.0.1").

-export([main/0]).

-record(libro,{
            titulo,
            autor=[],
            editorial,
            ano,
            isbn,
            descripcion,
            encuadernacion,
            ubicacion=[]
         }).

crear_tablas() ->
    mnesia:create_table(
        libro,
            [{attributes, record_info(fields, libro)},
             {index, [#libro.titulo]},
             {disc_copies, [node()]},
             {type, bag}]).

main() ->
    application:start(mnesia),
    io_lib:format("Crear tabla: ~s~n", [crear_tablas()]).
