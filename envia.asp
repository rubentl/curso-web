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


ObjSendMail.To = "ruben@inforcant.es"
ObjSendMail.Subject = "Misterios de la comarca."
ObjSendMail.From = "ruben@inforcant.es"

'ObjSendMail.HTMLBody = "this is the body"
ObjSendMail.TextBody = "Desde hace meses se vienen observando sucesos extraños en las afueras de la villa."

ObjSendMail.Send

Set ObjSendMail = Nothing
response.redirect("ok.html")
%>
