-module(pruebas).
-author("Rubén Toca").
-vsn("0.0.1").

-include_lib("c:/Archivos de programa/erl8.3/lib/stdlib-3.3/include/qlc.hrl").

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

query(Query) ->
    F = fun() ->
                qlc:e(Query)
        end,
    {atomic, Valor} = mnesia:transaction(F),
    Valor.

info(Data) ->
    error_logger:info_report(Data).

crear_tablas() ->
    mnesia:create_table(
        libro,
            [{attributes, record_info(fields, libro)},
             {disc_copies, [node()]},
             {type, bag}]).

libro_add(Record) ->
    F = fun() ->
                mnesia:write(Record)
        end,
    {atomic, ok} = mnesia:transaction(F),
    ok.

libro_read(Query) ->
    Fun = fun() ->
                  mnesia:match_object(Query)
          end,
    {atomic, Valor} = mnesia:transaction(Fun),
    Valor.

main() ->
    application:start(mnesia),
    
    Record = #libro{
                titulo = <<"Escrito en el agua">>,
                autor = [<<"Paula Hawkins">>],
                editorial = <<"Planeta">>,
                ano = 2017,
                isbn = 9788408172178,
                descripcion = <<"Pocos días antes de morir, Nel Abbott estuvo llamando a su hermana, pero Jules no cogió el teléfono, ignoró sus súplicas de ayuda. Ahora Nel está muerta. Dicen que saltó al río. Y Jules se ve arrastrada al pequeño pueblo de los veranos de su infancia, un lugar del que creía haber escapado, para cuidar de la adolescente que su hermana deja atrás. Pero Jules tiene miedo. Mucho miedo. Miedo al agua, miedo de sus recuerdos enterrados largo tiempo atrás, y miedo,
                                sobre todo, de su certeza de que Nel nunca habría saltado?"/utf8>>,
                encuadernacion = <<"Tapa blanda">>,
                ubicacion = [<<"La casa del libro">>]
               },
    libro_add(Record),
    Q = qlc:q([L || L <- mnesia:table(libro)], cache),
    info(qlc:info(Q)),
    Result = query(Q),
    info(Result),
    application:stop(mnesia).
