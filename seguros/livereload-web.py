#!/usr/bin/python

from livereload import Server, shell

server = Server()

server.watch('src/css/*.less',
             shell('lessc --autoprefix -clean-css src/css/estilos.less',
                   output='css/estilos.min.css'))
server.watch('src/js/*.js',
             shell('sh -c "for file in src/js/*.js;'
                   'do uglifyjs -c -o js/`basename -s .js $file`.min.js $file; done"'))

server.serve(port=8080, host='localhost')
