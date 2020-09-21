package Controller;

import Clases.Fecha;
import Clases.Reserva;
import DAO.NewHibernateUtil;
import POJOS.Cliente;
import POJOS.Tarjeta;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;


public class crearTarjeta extends HttpServlet {

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
        
        Cliente cliente = reserva.getCliente();
        
            String numeroTarjeta = request.getParameter("numeroTarjeta");
            
            String fechaTarjeta = request.getParameter("fechaTarjeta");
            
            int cvvTarjeta = Integer.parseInt(request.getParameter("cvvTarjeta"));
            
            String tipoTarjeta = request.getParameter("tipoTarjeta");
            
            Fecha calculator = new Fecha();
            
            Date fechaFinal = calculator.toDate(fechaTarjeta);
            
        Tarjeta tarjeta = new Tarjeta(cliente, tipoTarjeta, numeroTarjeta.getBytes(StandardCharsets.UTF_8), fechaFinal, cvvTarjeta);
        
        cliente.setTarjeta(tarjeta);
        
        try{
        new DAO.Operaciones().insertarTarjeta(tarjeta, SessionBuilder);
        }catch(Exception ex){
        
        response.sendRedirect("./cliente.jsp?error='tarjetaDuplicada'");
        }
        reserva.setCliente(cliente);
            
        response.sendRedirect("./cliente.jsp");
        
            
        }  catch (ParseException ex) {
               Logger.getLogger(crearTarjeta.class.getName()).log(Level.SEVERE, null, ex);
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
