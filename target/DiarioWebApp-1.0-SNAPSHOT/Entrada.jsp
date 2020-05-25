<%-- 
    Document   : Entrada
    Created on : 17/05/2020, 07:03:52 PM
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />

        <title>Añadir entrada al diario</title>
    </head>
     <body background="imagen2.jpg">

        <h1><strong><center><font color="Sienna">Querido diario...</font></center></strong></h1>
		<center><img src="visual/intr.gif"></center>
		<br><br/>


        <form name="Registro" action="data.jsp" method="get">
		
<center>
            <p><strong>Escribe tus pensamientos: </strong></p>
			
            <textarea name="Entrada" rows="60" cols="100" wrap="hard" placeholder="Inicia tu escritura"></textarea>

				
            <p>Selecciona un estado de ánimo:</p>

            <img src="ok.png" style="max-width:03%;width:auto;height:auto;"><input type="radio" id="1" name="Estado" value="1">
            <label for="male">Bueno</label><br>
			<br/>

            <img src="reg.png" style="max-width:02.6%;width:auto;height:auto;"><input type="radio" id="2" name="Estado" value="2">
            <label for="female">Regular</label><br>
			<br/>
            <img src="mal.png" style="max-width:02.6%;width:auto;height:auto;"><input type="radio" id="3" name="Estado" value="3">
            <label for="other">Malo</label><br>
			<br/>

			
            </center>
<center>
            <p></p>
            <input type="submit" value="Ingresar entrada al diario">
</center>
        </form>

		
        <p></p>
<center>
</br>
<a href="index.html">
  <img src="inicio.png" style="max-width:04%;width:auto;height:auto;">
</a>
	</center>	

    </body>
</html>