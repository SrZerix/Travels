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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="assets/js/main.js"></script>
        <title>Viajex</title>
    </head>
    <body>
        <header>
            <h5> VIAJEX / Acercando personas </h5>
       <h3 id="area" onclick="redirect('administracion.jsp')">Área de Administración</h3>
        </header>
        
    <main id="pasos">
        
        <% 
            Reserva reserva = (Reserva)session.getAttribute("reserva");
            ArrayList<ViajeroAsiento> viajeros = reserva.getViajeros();
            
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
                // catch
            }
            
            int numeroDatos = (reserva.getNumViajeros() * 3);
            
            String viajerosFinal[] = new String[numeroDatos];

            int contadorViajero = 0;
            
            int contadorFinal = 0;
            
            for(int i=0; i < numeroDatos; i++){
                   
                viajerosFinal[i] = viajeros.get(contadorViajero).getDni();
                i++;
                
                viajerosFinal[i] = viajeros.get(contadorViajero).getApellidos();
                i++;
                
                viajerosFinal[i] = viajeros.get(contadorViajero).getNombre();
                contadorViajero++;
            
            for (int j=0; j < 3; j++){
                                   
       %> <input type="hidden" class="viajerosData" value="<%=viajerosFinal[contadorFinal]%>"> <%
               
            contadorFinal++;
           
                }
 
            }
            
        %>

        
         <aside id="migasMirror">
                    
                    <div>

                    </div>

                    <div>
                    </div>
                 
                   <div>
                    </div>
                                 
                    <div  class="activeIcon">
                        <i class="fas fa-walking fa-2x"></i>
                    </div>
                    
                    <div>
                    </div>    

                    
                </aside>
           
                
                <nav id="migas">
                    
                    <div class="active" style="border-top: solid ">
                        <em>  Elegir Viaje </em>
                    </div>
                    
                    <div class="active" style="border-top: solid ">
                      <em>  Elegir Asientos </em>
                    </div>
                    
                    <div class="active" style="border-top: solid">
                        <em>  Resumen </em>
                    </div>
                    
                    <div class="active" style="border-top: solid">
                        <em> Pago </em>
                    </div>
                    
                    <div>
                        Billetes
                    </div>    
                    
                </nav>   
        
            <section class="container" style="background-color: #FFF; width: 35%" >
            
                <div class="headerDivNew">
                    <i class="fas fa-user fa-2x "></i> <h4 style="margin-left:20px; margin-top: 15px">Por favor, identifíquese</h4>
                </div>
                
                <form action="./login">  
                <div class="contenidoLogin" style="background-color: #FFF;">
           
                    <span><h5 style="padding:10px; margin-left:30px"> DNI / Correo </h5><input type="text" name="user" maxlength="20" id="user"></span>
                    
                    <span><h5 style="padding:10px; margin-left:10px"> Contraseña <i id="showpass" onmousedown="mostrarClave()" onmouseup="ocultarClave()" class="fas fa-eye showPassword"></i></h5><input id="password" name="password" type="password" maxlength="20"></span>
 
                </div>
                
                <div class="contenidoLogin" style="background-color: #FFF;">
                    
                    <button style="margin-bottom: 10px; margin-left: auto; margin-right: auto" type="submit"> Iniciar Sesión </button>
           
                </div>
                </form>
                <hr id="separador"/>
                
                <div class="contenidoLoginFinal" style="background-color: #FFF;">
                    
                    <p style="text-align: center; margin-bottom: 20px; margin-top: 10px"> Si no dispone aún de su cuenta, registrese. </p>
                    
                    <button onclick="formRegistro()" style="margin-left:auto; margin-right:auto; margin-bottom: 10px" type="submit"> Registrarse </button>
                    
                </div>
                
            
            </section>
        
    </main>
        
    <footer>
            
            <div> Todos los derechos reservados. </div>
            <div> Viajex / 2020 </div>
        <script src="assets/js/ajax.js"></script>
    </footer>
    </body>
</html>
