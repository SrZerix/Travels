<%@page import="java.util.ArrayList"%>
<%@page import="POJOS.Compra"%>
<%@page import="POJOS.Ruta"%>
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
        <link href="assets/css/all.min.css" rel="stylesheet">
        <link href="assets/css/animate.css" rel="stylesheet">
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
        
        <% 
            Reserva reserva = (Reserva)session.getAttribute("reserva");
            Viajes viaje = reserva.getViaje();
            
            Fecha calculator = new Fecha();
            
            String fechaInversa = calculator.inversa(viaje.getDia());
        %>
        
        <main id="pasos">
            
             <aside id="migasMirror">
                    
                    <div>

                    </div>
                    
                    <div class="activeIcon">
                        <i class="fas fa-walking fa-2x"></i>
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
                    
                    <div class="active" style="border-top: solid ">
                      <em>  Elegir Asientos </em>
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
                                
        <section id="contenedor" style="background-color:#FFF; display:flex; flex-direction: column;">
                
            <div class="headerDiv">

                <h4> ¿Quienes van a viajar? </h4>
                
            </div>
            
            <% ArrayList<Integer> asientosOcupados = reserva.getAsientosOcupados();%>
            
            <div class="contenido">

                <div style="width: 100%; display: flex; justify-content:center; flex-wrap: wrap">
                <% for(int i=0; i< reserva.getNumViajeros(); i++){ %>
                    <button class="colapsable" onclick="collapse(<%= i %>, this)">Viajero <%= i+1 %><i class="fas fa-plus" style="float:right"></i></button>
                <% } %>
                </div>   
                
                
                <div style="width: 100%;">
                    <% for(int i=0; i< reserva.getNumViajeros(); i++){ %>
                                <div class="content-pasajero">
                                    <form id="content-<%= i %>">
                                        <input type="hidden" id="maxValue" value="<%= reserva.getNumViajeros()%>"> 
                                        
                                      <div class="columnasAsientos">
                                          <span><strong style="margin-bottom:5px">DNI / NIE</strong><input class="inputAsiento" id="DNI<%=i%>" type="text" maxlength="9" onblur="validarDNI(this.value,this.id)" required></span>
                                          <span><strong style="margin-bottom:5px">Nombre</strong> <input class="inputAsiento" value="" type="text" maxlength="15" pattern="[a-zA-Z]{15}" title="Ha de ser alfabético." required></span>
                                       
                                          <span><strong style="margin-bottom:5px">Apellidos</strong> <input class="inputAsiento" value="" type="text" maxlength="20" pattern="[a-zA-Z]{15}" title="Ha de ser alfabético."  required></span>
                                          <span><strong style="margin-bottom:5px">Plaza</strong> <select class="inputAsiento plazas" value="" onchange="comprobarAsiento(this, <%=reserva.getViaje().getPlazas()%>)" required>
          
                                                <% 
                                                    
                                                 
                                                 %> <option value=""> Seleccionar Plaza </option> <%                                                 
                                                    for (int j = 0; j < 6; j++){
                                                           
                                                        boolean ocupado = false;
                                                     
                                                        for(int f=0; f < asientosOcupados.size(); f++){
                                                            if(j+1 == asientosOcupados.get(f)){
                                                                ocupado = true;
                                                            }
                                                        }
                                                        
                                                        if(ocupado == true){continue;}
                                                     
                                                 %> <option value="<%=j+1%>"> <%=j+1%> </option> <%
                                                       
                                                        }
                                                %>
                                                
                                            </select></span>
                                            
                                    </form>
                                </div>                                
                    <% } %>
                </div>

            </div>
                
          <%
            String size="100px";
            
            if(reserva.getNumViajeros() >= 4){
                size="400px";
            }
          
          %>      
                
            <div style="display:flex; width:100%; justify-content: center">    
                    
                <button style="margin-top: 20px;  width:<%=size%>" onclick="cargarViajeros(); return false;">Confirmar</button>
            </div>
                
        </section>

        </main>
        
        <footer>
            
            <div> Todos los derechos reservados. </div>
            <div> Viajex / 2020 </div>
        <script src="assets/js/main.js"></script>
        <script src="assets/js/ajax.js"></script>

        </footer>
    </body>
</html>

