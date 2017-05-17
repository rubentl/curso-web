%% -*- coding: utf-8 -*-

-module(pruebas).
-author("Rubén Toca").
-vsn("0.0.1").

-include_lib("C:/Archivos de programa/erl8.3/lib/stdlib-3.3/include/qlc.hrl").

-export([main/0]).

-record(noticia,{
            titulo,
            texto,
            fecha = []
         }).

-record(evento,{
            titulo,
            fecha,
            lugar,
            responsable,
            enlace
         }).

-record(contacto,{
            nombre,
            direccion,
            telefono,
            horario
         }).

tablas() -> [contacto, record_info(fields, contacto),
             evento, record_info(fields, evento),
             noticia, record_info(fields, noticia)].
datos() -> [
            #noticia{titulo = <<"Campamento"/utf8>>,
                     texto = <<"Comienzan las subscripciones para el campamento de verano."/utf8>>,
                     fecha = calendar:local_time()},
            #noticia{titulo = <<"Semana santa"/utf8>>,
                     texto = <<"Comienza la Semana Santa"/utf8>>,
                     fecha = calendar:local_time()},
            #evento{titulo = <<"Fiesta de Mayores"/utf8>>,
                    fecha = {{2017,11,10},{18,30,00}},
                    lugar = <<"Locales parroquiales"/utf8>>,
                    responsable = <<"Pepe"/utf8>>,
                    _ = '_'},
            #evento{titulo = <<"Viaje de Santa Ana"/utf8>>,
                    fecha = {{2017,08,01},{07,00,00}},
                    lugar = <<"frente a la parroquia"/utf8>>,
                    _ = '_'},
            #contacto{nombre = <<"José García Albatros"/utf8>>, 
                      direccion = <<"C/ Los ciruelos nº 34, Santander"/utf8>>,
                      telefono = <<"555-555-555"/utf8>>,
                      horario = <<"Lunes a Viernes: 15:00 a 19:00"/utf8>>},
            #contacto{nombre = <<"Amalia Sánchez Camino"/utf8>>, 
                      direccion = <<"C/ Héroes de Mayo nº 1, Herrera de Camargo"/utf8>>, 
                      telefono = <<"000-444-555"/utf8>>,
                      horario = <<"">>}
           ].

query(Query) ->
    F = fun() ->
                qlc:e(Query)
        end,
    {atomic, Valor} = mnesia:transaction(F),
    Valor.

info(Data) ->
    error_logger:info_report(Data).

crear_tabla(Tabla) ->
    mnesia:create_table(
            element(1, Tabla),
            [{attributes, element(2, Tabla)},
             {disc_copies, [node()]}
            ]).

write(Record) ->
    F = fun() ->
                mnesia:write(Record)
        end,
    {atomic, ok} = mnesia:transaction(F),
    ok.

preparar_data(Tablas, Datos) ->
    [crear_tabla(Tabla) || Tabla <- Tablas],
    [write(Record) || Record <- Datos].

main() ->
    application:start(mnesia),
    % preparar_data(tablas(), datos()),
    Q = qlc:q([L#contacto.nombre || L <- mnesia:table(contacto)]),
    % info(qlc:info(Q)),
    Result = query(Q),
    info(Result),

    application:stop(mnesia).
