<%@page import="POJOS.Estacion"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Viajex</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="assets/css/main.css" rel="stylesheet"> 
        <link href="assets/css/all.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">
        <link rel="icon" type="image/webp" href="assets/img/logo.webp">
        <script src="assets/js/ajax.js"></script>
        <script src="assets/js/main.js"></script>

    </head>
    <body>    
        <header>
            <h3> VIAJEX / Acercando personas </h3>
            <h3 id="area" onclick="redirect('administracion.jsp')">  Área de Administración</h3>
        </header>
                
        <main>
            
    <iframe src="https://www.tutiempo.net/s-widget/app/?LocId=7992&sc=1" scrolling="no" frameborder="0" style="border:none; margin-top: 45px; margin-right: 40px; overflow:hidden; width:300px; height:411px;" allowTransparency="true"></iframe>  
    
            <section id="viajesBox" style="margin-right:90px; margin-left: 90px">
                
                <div class="headerDiv">
                    <h4> ¿Donde quieres ir? </h4>
                </div>
                
                <div  id="formViaje">
                    
            <form action="./cargarViajes">
                   
                <span>    
                    <strong> <i style="margin-right: 5px" class="fas fa-map-marked-alt"></i> Origen </strong>
                    
               <% 
               ArrayList<Estacion> listaEstacion = (ArrayList)session.getAttribute("listaEstaciones");
               %>
               
                    
                    <select id="origen" name="origen" required onChange="cargarDestinos(this.value)" >

                        <%
                            for (int i = 0; i < listaEstacion.size(); i++) {
                            %>

                            <option value="<%=listaEstacion.get(i).getId()%>"> <%=listaEstacion.get(i).getLocalidad()%>
                            </option>
                            <% }%> 
                    </select>
    

                </span>
                        
                <span>    
                    <strong> <i style="margin-right: 5px" class="fas fa-map-marked-alt"></i> Destino </strong>
                    
                    <select id="destino" required name="destino">
                    </select>
                </span>
                        

                    
                <span>    
                    <strong> <i style="margin-right: 5px" class="fas fa-calendar-day"></i> Salida </strong>
                    <input type="date" name="dia" maxlenght="" required>
                </span>
                        
                <span>    
                    <strong>  <i style="margin-right: 5px;" class="fas fa-users"></i> Viajeros </strong>
                    <input type="number" name="plazas" required placeholder="Máximo seis" min="1" max="6">
                </span>
                        
                    <button type="submit">  Buscar </button>
                    
            </form>  
           
   
            
                </div>
 
            </section>
            

        </main>
        
        <footer>
            
            <div> Todos los derechos reservados. </div>
            <div> Viajex / 2020 </div>

        </footer>
             
                    
        
    <script>cargarDestinos(document.getElementById("origen").value);</script>
    
    </body>
</html>