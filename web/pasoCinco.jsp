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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="assets/js/main.js"></script>
        <script src="assets/js/qrcode.min.js"></script>

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
                 
                   <div>
                    </div>
                                 
                    <div>
                       
                    </div>
                    <div class="activeIcon">
                         <i class="fas fa-walking fa-2x"></i>

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
                   
                    <div class="active" style="border-top: solid">
                        <em> Billetes </em>
                    </div>    
                    
                </nav>   
        
                <%
                    Reserva reserva = (Reserva)session.getAttribute("reserva");
                    
                    Compra compra = (Compra)reserva.getCompra();
                    
                    Fecha calculator = new Fecha();

                %>
        
         <section class="container" style="background-color: #FFF; width: 75%" >
            
                <div class="headerDivNew">
                    <i class="fas fa-ticket-alt fa-2x"></i> <h4 style="margin-left:20px; margin-top: 10px">Estos son sus billetes.</h4>
                </div>
             
             <%
                for(int i=0; i < reserva.getNumViajeros(); i++){
             %>
                
             <div class="ticket" style="justify-content:center;">
                 
                 <div class="ticketContent">
                 <div class="ticketComun">
                     <span style="margin-left:20px"><em>Origen</em></span>
                     <span>
                         <i class="fas fa-bus"></i>
                         <%=
                         reserva.getObjRuta().getEstacionByIdOrigen().getLocalidad()
                         %>
                     </span>
                     <span style="margin-bottom: 10px">
                         <i class="far fa-clock"></i>
                         <%=
                         reserva.getViaje().getHorarios().getHoraSalida()
                         %>
                     </span>
                     
                     <hr/>
                     
                    <span style="margin-left:10px; margin-top:10px"><em>Destino</em></span>
                     <span>
                         <i class="fas fa-bus"></i>
                         <%=
                         reserva.getObjRuta().getEstacionByIdDestino().getLocalidad()
                         %>
                     </span>
                     <span>
                         <i class="far fa-clock"></i>
                         <%=
                         reserva.getViaje().getHorarios().getHoraLlegada()
                         %>
                     </span>
                 </div>
                     
                <div class="ticketRow">
                     <span style="margin-left:10px"><em>Fecha de viaje</em></span>
                     <span>
                        <i class="fas fa-calendar-alt"></i>
                         <%
                         String fechaViaje = calculator.toString(reserva.getFechaViaje());
                         out.print(fechaViaje);
                         %>
                     </span>
                      <span style="margin-left:10px"><em>Fecha de pago</em></span>
                     <span style="margin-bottom: 10px">
                         <i class="far fa-calendar-alt"></i>
                         <%
                         String fechaPago = calculator.inversa(reserva.getCompra().getFechaPago());
                            out.print(fechaPago);
                         %>
                     </span>
                       <span style="margin-left:20px;"><em>Viajero</em></span>
                     <span style="margin-bottom: 10px">
                         <i class="fas fa-user"></i>
                         <%
                        String dni = reserva.getViajeros().get(i).getDni();
                        String nombre = reserva.getViajeros().get(i).getNombre();
                        String apellidos = reserva.getViajeros().get(i).getApellidos();
                        
                            out.print(dni+" / "+nombre+" / "+apellidos); 
                         %>
                     </span> 
                    <span style="margin-left:200px"><em>Localizador</em></span>
                     <span style="margin-bottom: 10px">
                         <i class="fas fa-key"></i>
                         <%
                            String localizador = compra.getLocalizador();
                            out.print(localizador); 
                         %>
                     </span>
                    <span style="margin-left:auto; margin-right: auto;" id="qrcode<%=i%>">
                         
                    <script type="text/javascript">
                    new QRCode(
                            document.getElementById("qrcode<%=i%>"),
                        {
                           "text": "Localizador: <%= localizador %> DNI: <%= dni %> ",
                            "width": 100,
                            "height": 100
                        }
                    );
                    </script>

         
                </div>
                     
                   </div>
             </div> 
         
            <%}%>
            
            <div style="display:flex; margin-bottom: 20px; justify-content:center" >
            
              <button onclick="redirect('index.jsp')">Volver al Inicio</button>   
              
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
