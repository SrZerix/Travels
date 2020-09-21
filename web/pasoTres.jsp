<%@page import="Clases.Fecha"%>
<%@page import="POJOS.Viajes"%>
<%@page import="Clases.Reserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="assets/css/main.css" rel="stylesheet">
        <link href="assets/css/animate.css" rel="stylesheet">
        <link href="assets/css/all.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">
        <link rel="icon" type="image/webp" href="assets/img/logo.webp">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Viajex</title>
    </head>
    <body>
        <header>
            <h5> VIAJEX / Acercando personas </h5>
             <h3 id="area" onclick="redirect('administracion.jsp')">Área de Administración</h3>
        </header>
        
                <main id="pasos">
            
             <aside id="migasMirror">
                    
                    <div>

                    </div>

                    <div>
                    </div>
                 
                   <div class="activeIcon">
                        <i class="fas fa-walking fa-2x"></i>
                    </div>
                    
                    
                    <div>
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
                    
                    <div>
                        Pago
                    </div>
                    
                    <div>
                        Billetes
                    </div>    

                    
                </nav>

            <section id="contenedor" style="background-color: #FFF">
                        
                     <%    Reserva reserva = (Reserva)session.getAttribute("reserva"); 
                     
                            Viajes viaje = (Viajes)reserva.getViaje();
                            
                            Fecha calculator = new Fecha();
           
                            String fechaInversa = calculator.inversa(viaje.getDia());
                     %>
                        
                <div class="headerDiv">

                <h3> Este es su viaje </h3>
                
            </div>
            
                <div class="contenidoResumen">
                 
                    <div class="filasResumen">  
                    <span><i class="fas fa-map-marker-alt" style="margin-right: 10px;"></i><strong>Origen:</strong> <%= reserva.getObjRuta().getEstacionByIdOrigen().getLocalidad() %> </span>
                    <span><i class="fas fa-map-marker-alt" style="margin-right: 10px;"></i><strong>Destino:</strong> <%= reserva.getObjRuta().getEstacionByIdDestino().getLocalidad() %> </span>
                    <span><i class="far fa-clock" style="margin-right: 10px;"></i><strong>Hora de Salida:</strong> <%= viaje.getHorarios().getHoraSalida() %>  </span>
                    <span><i class="far fa-calendar-alt" style="margin-right: 10px;"></i><strong>Día:</strong> <%= fechaInversa %> </span>
                    <span><i class="fas fa-wallet" style="margin-right: 10px"></i> <strong> Total: </strong> <%= (reserva.getObjRuta().getPrecio() * reserva.getNumViajeros()) %> € </span>
                    </div>
                  
                    <hr style="margin-top:10px; margin-left: 15px; width: 95%; color: #9FD5D1;"/>
                    
                <div id="grupoColumnas">     
                    <div class="columnasResumen">
                      <!--  <span> <i class="fas fa-male"></i> <strong> Pasajeros </strong> </span> -->
                        <span><i class="fas fa-id-card"></i><strong>DNI / NIE</strong> </span>
                        <span><i class="fas fa-user"></i><strong>Nombre</strong> </span>
                        <span><i class="fas fa-user-friends"></i><strong>Apellido</strong> </span>
                        <span><i class="fas fa-couch"></i><strong>Asiento</strong> </span>
                        <span><i class="fas fa-money-bill"></i><strong>Precio</strong> </span>
                    </div>
                     
                                    
                   <%
                       for(int i=0; i<reserva.getViajeros().size(); i++){
                             
                   %> 
                    
                    <div class="columnasResumen">
                    <!--   <span style="margin-top:10px"><h5 style="color:#009c8c"> Viajero <%=i+1%></h5> </span> -->
                       <span> <%= reserva.getViajeros().get(i).getDni() %> </span>
                       <span> <%= reserva.getViajeros().get(i).getNombre() %> </span>
                       <span> <%= reserva.getViajeros().get(i).getApellidos() %>  </span>
                       <span> <%= reserva.getViajeros().get(i).getAsiento() %> </span>
                       <span> <%= reserva.getObjRuta().getPrecio() %> € </span> 
                    </div>
                    
         
                       <%
                       }
                   %> 
                    
            </div>       
                <div class="filasResumenFinal">
                    
                      <button type="submit" onclick="redirect('./pasoCuatro.jsp')"> Confirmar </button>
                        
                      <button style="margin-left: 30px" type="submit" onclick="redirect('./index.jsp')"> Cancelar </button>
                        
                    </div>
                   
                </div>
                                    
            </section>
                

            </main>    
                    
        <footer>
            
            <div> Todos los derechos reservados. </div>
            <div> Viajex / 2020 </div>
        <script src="assets/js/main.js"></script>
        <script src="assets/js/ajax.js"></script>
<%session.setAttribute("alert", null);  %>
        </footer>
    </body>
</html>
