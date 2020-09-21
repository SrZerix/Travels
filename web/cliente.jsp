<%@page import="java.util.ArrayList"%>
<%@page import="POJOS.Tarjetabackup"%>
<%@page import="Clases.Fecha"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="POJOS.Tarjeta"%>
<%@page import="java.util.Iterator"%>
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
        
        <% Reserva reserva = (Reserva)session.getAttribute("reserva");
        
            if(request.getParameter("error") != null){
                
            %> <script> sweetAlert('Algo ha ocurrido',"Esta tarjeta ya se encuentra en nuestro sistema.","error") </script> <%
            }
        
        %>
        
      <main id="pasos">
            
                <aside id="migasMirror">
                    
                    <div>

                    </div>
                    
                    <div>
                    </div>
                    
                    
                    <div>
                    </div>
                    
                    <div>
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
                        <em> Elegir Asientos </em>
                    </div>
                    
                    <div class="active" style="border-top: solid ">
                        <em>  Resumen </em>
                    </div>
                    
                    <div class="active" style="border-top: solid ">
                        <em>  Pago </em>
                    </div>
                    
                    <div>
                        Billetes
                    </div>    
  
                </nav>
          
                 <section class="container" style="background-color: #FFF; width: 50%; margin-bottom: 50px;" >
            
                <div class="headerDivNew">
                    <i class="fas fa-user fa-2x "></i> <h4 style="margin-left:20px; margin-top: 15px">Buenas <%= reserva.getCliente().getNombre()+ " " +reserva.getCliente().getApellidos()%></h4>
                </div>
                
          
                <div class="contenidoCliente">
           
                    <h4> Estas son sus tarjetas </h4>
           
                </div>

                   
                <div class="contenidoClienteTarjeta" style="background-color: #FFF;">
           
                     <%   Iterator iterTarjetas = reserva.getCliente().getTarjetas().iterator();
                     
                        ArrayList<String> numeros = new ArrayList<String>();
                     
                     int i=0;
                       while(iterTarjetas.hasNext()){
                         Tarjeta tarjeta = (Tarjeta)iterTarjetas.next();
                         
                          String TarjetaString = new String(tarjeta.getNum(), StandardCharsets.UTF_8).substring(15,19);

                          numeros.add(TarjetaString);
                         
                          String img=tarjeta.getTipo();
                          
                          if(tarjeta.getTipo().equals("Visa")){
                                  
                               img = "assets/img/visa.webp";
                              
                          }else if(tarjeta.getTipo().equals("MasterCard")){
                          
                          
                               img = "assets/img/mastercard.webp";
                
                          }
                     %>
                         <div class="tarjeta"> 
                                                          
                             <span> <img src="<%=img%>" width="50px" height="50px"> </span>
                             
                             <span> <%= "•••• •••• •••• " + TarjetaString %> </span>
                            
                          <%   Fecha calculator = new Fecha();
                             
                             String fechaCaducidad = calculator.inversa(tarjeta.getCaducidad()); 
                          
                             String sinDia = fechaCaducidad.substring(3);
                             
                             String mes = sinDia.substring(0,2);
                             
                             String year = sinDia.substring(sinDia.length()-2, sinDia.length());
                             
                             String finalCaducidad = mes + "/" + year;
                          
                          %>
                             
                            <span> <%= finalCaducidad%> </span>
                            
       
                            
                             <span>
                                 
                                 <label style="margin-right: 10px"> <i title="Usar" onclick="<%session.setAttribute("tarjetaSelected", i); %> confirmarCVV(<%= tarjeta.getCvv() %>);" class="fas fa-money-check-alt"></i> </label>                  
                              
                                
                                 
                             </span>
                             
                         </div>
                     
                    <%i++; }%>
           
                </div>
                    
                     <div class="contenidoClienteTarjeta" style="background-color: #FFF;">
                
              <%  try{ %>
                     <%  Iterator iterTarjetasbackup = reserva.getCliente().getTarjetabackups().iterator();
                     
                     int y=0;
                       while(iterTarjetasbackup.hasNext()){
                         Tarjetabackup tarjetaBackup = (Tarjetabackup)iterTarjetas.next();
                         
                          String TarjetaString = new String(tarjetaBackup.getNum(), StandardCharsets.UTF_8).substring(15,19);
                          
                          //Evita duplicados
                          if(numeros.contains(TarjetaString)){
                              continue;
                          }
                         
                          String img=tarjetaBackup.getTipo();
                          
                          if(tarjetaBackup.getTipo().equals("Visa")){
                                  
                               img = "assets/img/visa.webp";
                              
                          }else if(tarjetaBackup.getTipo().equals("MasterCard")){
                          
                          
                               img = "assets/img/mastercard.webp";
                
                          }
                     %>
                         <div class="tarjeta"> 
                                                          
                             <span> <img src="<%=img%>" width="50px" height="50px"> </span>
                             
                             <span> <%= "•••• •••• •••• " + TarjetaString %> </span>
                            
                          <%   Fecha calculator = new Fecha();
                             
                             String fechaCaducidad = calculator.inversa(tarjetaBackup.getCaducidad()); 
                          
                             String sinDia = fechaCaducidad.substring(3);
                             
                             String mes = sinDia.substring(0,2);
                             
                             String year = sinDia.substring(sinDia.length()-2, sinDia.length());
                             
                             String finalCaducidad = mes + "/" + year;
                          
                          %>
                             
                            <span> <%= finalCaducidad%> </span>
                            
       
                            
                             <span>
                                 
                                 <label style="margin-right: 10px"> <i title="Usar" onclick="<%session.setAttribute("tarjetaSelected", y); %> confirmarCVV(<%= tarjetaBackup.getCvv() %>);" class="fas fa-money-check-alt"></i> </label>                  
                              
                                
                                 
                             </span>
                             
                         </div>
                     
                    <%y++; }%>
           
                </div>
              <%  }catch(Exception ex){}%>
                
                <hr id="separador"/>
                
                <div class="contenidoLoginFinal" style="background-color: #FFF;">
                    
                    <p style="text-align: center; margin-bottom: 20px; margin-top: 10px"> Si desea introducir una nueva tarjeta. </p>
                    
                    <button onclick="createOnlyTarjeta()" style="margin-left:auto; margin-right:auto; margin-bottom: 10px" type="submit"> Registrar tarjeta </button>
                    
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
