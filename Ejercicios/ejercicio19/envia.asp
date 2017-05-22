<%Dim ObjSendMail
Set ObjSendMail = CreateObject("CDO.Message")

'Configuramos el servidor SMTP que vamos a utilizar.

ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 'Envío del mensaje utilizando Internet (SMTP)
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") ="smtp.1and1.es" 'Configuracion del servidor smtp
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 587 'Puerto
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = false 'Usa SSL para la conexion??(True or False)
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60

'Si nuestro servidor SMTP require auntentificacion rellenamos
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1 'basic (clear-text) authentication
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") ="ruben@inforcant.com"
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") ="123qweQWE" 

ObjSendMail.Configuration.Fields.Update


ObjSendMail.To = "ruben@inforcant.com"
ObjSendMail.Subject = "Misterios de la comarca."
ObjSendMail.From = "ruben@inforcant.com"

ObjSendMail.HTMLBody = "<!DOCTYPE html><html lang='es'><head><meta charset='UTF-8'><title>Formulario</title></head><body><h1>Nuevos datos de la Página Web</h1>  <h2>"&request.Form("nombre")&"</h2><blockquote><p>Apellidos: "&request.Form("apellidos")&"</p><p>Correo: "&request.Form("correo")&"</p><p>Teléfono: "&request.Form("telefono")&"</p><p>Cómo nos conoció: "&request.Form("forma")&"</p><p>La frecuencia: "&request.Form("frecuencia")&"</p> <p>Comentario: "&request.Form("comentarios")&"</p></blockquote></body></html>"

'ObjSendMail.TextBody = "Desde hace meses se vienen observando sucesos extraños en las afueras de la villa."

ObjSendMail.Send
Set ObjSendMail = Nothing

Set ObjSendMail = CreateObject("CDO.Message")

'Configuramos el servidor SMTP que vamos a utilizar.

ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 'Envío del mensaje utilizando Internet (SMTP)
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") ="smtp.1and1.es" 'Configuracion del servidor smtp
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 587 'Puerto
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = false 'Usa SSL para la conexion??(True or False)
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60

'Si nuestro servidor SMTP require auntentificacion rellenamos
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1 'basic (clear-text) authentication
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") ="ruben@inforcant.com"
ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") ="123qweQWE" 

ObjSendMail.Configuration.Fields.Update


ObjSendMail.To = request.Form("correo")
ObjSendMail.Subject = "Misterios de la comarca."
ObjSendMail.From = "ruben@inforcant.com"

'ObjSendMail.HTMLBody = ""
ObjSendMail.TextBody = "Muchas gracias por tomarte tu tiempo para rellenar este extenso formulario. En breve nos pondremos en contacto contigo. Si pasados tres meses no sabes nada de nosotros, preocúpate."

ObjSendMail.Send
Set ObjSendMail = Nothing

response.redirect("mensaje.html")
%>
