package Controller;

import Clases.Reserva;
import Clases.ViajeroAsiento;
import DAO.NewHibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;

public class crearViajeros extends HttpServlet {

       private SessionFactory SessionBuilder;
    
    public void init(){  
        SessionBuilder=NewHibernateUtil.getSessionFactory();    
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
              HttpSession session = request.getSession(true);
                    
                    Reserva reserva = (Reserva)session.getAttribute("reserva");
            
            if(request.getParameter("array") != null){
                
                String datos = request.getParameter("array");
                
                ArrayList<ViajeroAsiento> viajeros = new ArrayList();
                
                String separador = Pattern.quote(",");
                String[] valores = datos.split(separador);
            
                    for (int i=0; i < valores.length; i++){

                        if (i == 0 || i == 4 || i == 8 || i == 12 || i == 16 || i == 20){
                          
                            ViajeroAsiento viajero = new ViajeroAsiento(valores[i],valores[i+1],valores[i+2],Integer.parseInt(valores[i+3]));
                            
                          viajeros.add(viajero);
                                                    
                        }
                                             
                    }
                    
                    reserva.setViajeros(viajeros);
                     
                    session.setAttribute("reserva", reserva);
                    
                    out.print("OK");
  
            }else{
                out.print("Faltan datos");
            }
            
            
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
