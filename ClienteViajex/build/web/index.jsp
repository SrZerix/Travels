<%@page import="servicios.ViajeService"%>
<%@page import="servicios.HorariosService"%>
<%@page import="java.util.Iterator"%>
<%@page import="servicios.RutaService"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Viajex</title>
    </head>
    <style>
        *{
            margin: 0;
            padding:0;
        }
        
        #tabla tr td, th{
            padding: 10px;
            margin: 5px;
            text-align: center;
        }
        

    </style>
    <body>
        <header style="background-color:#000; color:#FFF; padding: 20px; display: flex; justify-content: center">
            <h3> Rutas ofrecidas por Viajex </h3>
        </header>
        
        <main style="background-color: #FFF">
            <%
        try {
            servicios.ListarRutas_Service service = new servicios.ListarRutas_Service();
            servicios.ListarRutas port = service.getListarRutasPort();

            ArrayList<RutaService> result = (ArrayList) port.obtenerRutas();
         %>
         
        <section style=" display: flex; justify-content:center; padding: 20px;">
            <table id="tabla" style="background-color: #EAE6CA; border-radius:5px">

            <tr>

                <th> <u> Origen </u> </th>

                <th> <u> Destino </u> </th>

                <th> <u> Día </u> </th>

                <th> <u> Plazas </u> </th>

                <th> <u> Distancia </u> </th>

                <th> <u> Duración </u> </th>

                <th> <u> Precio </u> </th>

            </tr>
                            
            <%

            for(int i = 0; i < result.size(); i++){
                
                                        
          %>  <tr> <%

                RutaService  rutaService  = result.get(i);

                Iterator iterHorario  = rutaService.getHorarios().iterator();
                
                while(iterHorario.hasNext()){
                    
                    HorariosService horarioService = (HorariosService)iterHorario.next();
                    
                    Iterator iterViaje = horarioService.getViajes().iterator();
                    
                    while(iterViaje.hasNext()){
                        
                        ViajeService viajeService = (ViajeService)iterViaje.next();
                        
                        String fecha = viajeService.getDia();
                        
                            String anio = fecha.substring(0, 4);

                            String mes = fecha.substring(5, 7);

                            String dia = fecha.substring(8, 10);

                            String fechaInversa = dia+"-"+mes+"-"+anio;

                        %>
                            
                            <td> <%= rutaService.getEstacionOrigen().getLocalidad() %> </td>
                            
                            <td> <%= rutaService.getEstacionDestino().getLocalidad() %> </td>

                            <td> <%= fechaInversa %> </td>

                            <td> <%= viajeService.getPlazas()%> </td>
                            
                            <td> <%= rutaService.getDistancia() %> </td>

                            <td> <%= rutaService.getDuracion()%> </td>
                            
                            <td> <%= rutaService.getPrecio() %> </td>
                        
                        <%
                    
                    }
                %> </tr> <%

                }
     
            } %>
               


            </table>

            <%

        } catch (Exception ex) {

        }
        %>
         </section>
            </main>    

    </body>
</html>
