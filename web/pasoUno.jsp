<%@page import="Clases.Fecha"%>
<%@page import="java.util.Date"%>
<%@page import="org.hibernate.Hibernate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="POJOS.Viajes"%>
<%@page import="POJOS.Horarios"%>
<%@page import="java.util.Iterator"%>
<%@page import="POJOS.Ruta"%>
<%@page import="Clases.Reserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="assets/css/main.css" rel="stylesheet">
        <link href="assets/css/all.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">
        <link rel="icon" type="image/webp" href="assets/img/logo.webp">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <script src="assets/js/main.js"></script>

        <title>Viajex</title>
    </head>
    <body>
        <header>
            <h3> VIAJEX / Acercando personas </h3>
            <h3 id="area" onclick="redirect('administracion.jsp')">Área de Administración</h3>
        </header>
        
        <main id="pasos">
            
                <aside id="migasMirror">
                    
                    <div>
                       <i class="fas fa-walking fa-2x"></i>
                    </div>
                    
                    <div>
                    </div>
                    
                    
                    <div>
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
                    
                    <div>
                        Elegir Asientos
                    </div>
                    
                    <div>
                        Resumen
                    </div>
                    
                    <div>
                        Pago
                    </div>
                    
                    <div>
                        Billetes
                    </div>    

                    
                </nav>
            
            <section id="container">
                       <% 
                
                Reserva reserva = (Reserva)session.getAttribute("reserva");
                
                Ruta ruta = reserva.getObjRuta();
                
                Iterator iterhorario = ruta.getHorarioses().iterator();
                
                while(iterhorario.hasNext()){
                    
                Horarios horario = (Horarios) iterhorario.next();
                
                Iterator iterviaje = horario.getViajeses().iterator();

                    while(iterviaje.hasNext()){
                        
                        Viajes viaje = (Viajes) iterviaje.next();
         
           Fecha calculator = new Fecha();
           
           String fechaInversa = calculator.inversa(viaje.getDia());
           
              if (viaje.getHorarios().getTipo().equals("Semana")){ %>
            <article id="posiblesViajes">
                <form action="./elegirAsientos" id="viajes">
                
                <div class="headerDiv">
                    
                    <span> <strong> Hora Salida: </strong>  <% out.print(horario.getHoraSalida()); %> </span> <br/>
                        <span> <strong> Hora Llegada: </strong> <% out.print(horario.getHoraLlegada()); %> </span> <br/>
                        <span> <strong> Día: </strong> <% out.print(fechaInversa); %> </span>
                    
                </div>
                   
                <div id="contenido">           
                    
                    <span>  <font color="#009c8c"> Estacion Origen: </font> <% out.print(ruta.getEstacionByIdOrigen().getLocalidad()); %> </span>
                    <span>  <font color="#009c8c"> Estacion Destino: </font> <%   out.print(ruta.getEstacionByIdDestino().getLocalidad()); %> </span>
                <span> <font color="#009c8c"> Distancia: </font> <%  out.print(ruta.getDistancia()+" km"); %> </span>   
    <span style="margin-bottom: 20px">  <font color="#009c8c"> Importe: </font> <%  out.print(ruta.getPrecio()+" €"); %> </span>


                <input type="hidden" value="<%= viaje.getId() %>" name="idViaje">

                <button type="button" onclick="comprobarPlazas(<%= viaje.getPlazas() %>)" style="margin-left: 75px; padding: 5px" id="button"> Elegir </button>
                <button id="botonEnvio" type="submit" style="display: none">
                </form>
                 </div>   
                  
            </article>
                 <%          
                    }

            %>
                
            <% }
                } %>
                
                </section>
                
    
        </main>
        
        <footer>
 
            <div> Todos los derechos reservados. </div>
            <div> Viajex / 2020 </div>

        </footer>
    </body>
</html>
