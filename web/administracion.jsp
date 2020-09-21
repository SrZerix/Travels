<%@page import="POJOS.Estacion"%>
<%@page import="POJOS.Viajes"%>
<%@page import="Clases.Fecha"%>
<%@page import="POJOS.Compra"%>
<%@page import="java.lang.Exception"%>
<%@page import="Clases.ViajeroAsiento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Reserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="assets/css/main.css" rel="stylesheet">
        <link href="assets/css/all.min.css" rel="stylesheet">
        <link href="assets/css/animate.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">
        <link rel="icon" type="image/webp" href="assets/img/logo.webp">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <script src="assets/js/main.js"></script>
        <script src="assets/js/ajax.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Viajex</title>
    </head>
    <body>
        <header>
            <h5> VIAJEX / Acercando personas </h5>
            <strong> <h5 id="area"> Área de Administración </h5> </strong>
        </header>
        
    <main id="pasos">
        
        <%
            try{
                String alert = String.valueOf(session.getAttribute("alert"));
                if(alert.equals("usuario")){
                session.setAttribute("alert", null);        
        %>  
                 <script> sweetAlert('¡Atención!','El cliente no existe.','error');  </script>
                 
        <%
            
                }else if(alert.equals("password")){
                session.setAttribute("alert", null);
        %> 
                <script> sweetAlert('¡Atención!','La contraseña no es válida.','error'); </script> 
        
        <%
                }
              
            }catch(Exception ex){
              }
           %>
        <section class="containerAdmin" style="background-color: #FFF; margin-top: 60px">
            
            <div class="headerDiv">
                <strong> Identifiquese </strong>
            </div>
                  <form action="./admin" style="padding:20px">  
                <div class="contenidoLogin" style="background-color: #FFF;">
           
                    <span><h5 style="padding:10px; margin-left:60px"> Usuario </h5><input type="text" name="user" maxlength="20" id="user"></span>
                    
                    <span><h5 style="padding:10px; margin-left:45px"> Contraseña <i id="showpass" onmousedown="mostrarClave()" onmouseup="ocultarClave()" class="fas fa-eye showPassword"></i></h5><input style="margin-left: 20px" id="password" name="password" type="password" maxlength="20"></span>
 
                </div>
                
                <div class="contenidoLogin" style="background-color: #FFF; justify-content: center">
                    
                    <button style="width: 200px; margin-bottom: 5px;" type="submit"> Iniciar Sesión </button>
           
                </div>
                </form>
            
        </section>
        
    </main>
        
        <footer>
          <!--  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
            <script src="assets/js/main.js"></script> -->
    <script>cargarDestinos(document.getElementById("origen").value);</script>

            <div> Todos los derechos reservados. </div>
            <div> Viajex / 2020 </div>

        </footer>
    </body>
</html>

                
