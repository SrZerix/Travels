<%@page import="POJOS.Viajes"%>
<%@page import="POJOS.Horarios"%>
<%@page import="java.util.Iterator"%>
<%@page import="POJOS.Ruta"%>
<%@page import="POJOS.Estacion"%>
<%@page import="java.util.ArrayList"%>
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
        
       <section class="container" style="display: flex; margin-top: 80px; width: 700px; flex-direction: column; justify-content: center">
                
                <div class="headerDiv">
                    <h4> ¿Que viaje desea dar por finalizado? </h4>
                </div>
                
                <div  class="contenidoCliente" style="padding:25px">
                    
                    <%
                        
                        ArrayList<Ruta> rutas = (ArrayList)session.getAttribute("rutas");
                        
                        %>
                    
                <form action="./generarBackup" style="width: 500px">

                <span>    
                    <strong> <i style="margin-right: 5px" class="fas fa-bus"></i> Viaje </strong>
                    
                    <select id="viaje" required name="viaje" style="width:330px">
                        
                        <%
                            
                        for(int j=0; j < rutas.size(); j++){
                            
                        Iterator iterhorario = rutas.get(j).getHorarioses().iterator();
                
                        while(iterhorario.hasNext()){

                        Horarios horario = (Horarios) iterhorario.next();

                        Iterator iterviaje = horario.getViajeses().iterator();

                            while(iterviaje.hasNext()){
                        
                        Viajes viaje = (Viajes) iterviaje.next();
                        
            
                        %>
                        
                        <option value="<%= viaje.getId() %>"><%= viaje.getHorarios().getRuta().getEstacionByIdOrigen().getLocalidad() + " -> " + viaje.getHorarios().getRuta().getEstacionByIdDestino().getLocalidad() + " / " + viaje.getHorarios().getHoraSalida() %></option>
                        
                       <% 
                       
                       }

                    }

                  }
                       
                       %>     
                            
                    </select>
                </span>
                        
                       <div style="justify-content: center; display: flex">   
                    <button type="submit" style="margin-top: 20px; margin-left:auto; margin-right: auto">  Elegir </button>
                    <div>
            </form>  
           
   
            
                </div>
 
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

                
