package Controller;

import Clases.Reserva;
import DAO.NewHibernateUtil;
import POJOS.Ruta;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;


public class cargarViajes extends HttpServlet {

    private SessionFactory SessionBuilder;
    
    public void init(){  
        SessionBuilder=NewHibernateUtil.getSessionFactory();  
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            int idOrigen = Integer.parseInt(request.getParameter("origen"));
                        
            int idDestino = Integer.parseInt(request.getParameter("destino"));
 
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        
            Date dia = formatter.parse(request.getParameter("dia"));
            
            int plazas = Integer.parseInt(request.getParameter("plazas"));
            
            Date fechaCompra = java.sql.Date.valueOf(LocalDate.now());
            
            Ruta ruta = new DAO.Operaciones().buscarRuta(idOrigen, idDestino, SessionBuilder);
            
            Reserva reserva = new Reserva(fechaCompra,dia,plazas,ruta);
            
            HttpSession session = request.getSession(true);
            
            session.setAttribute("reserva",reserva);
            
            response.sendRedirect("./pasoUno.jsp");
            

        } catch (Exception ex){}
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
