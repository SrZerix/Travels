package Controller;

import Clases.Reserva;
import DAO.NewHibernateUtil;
import POJOS.Compra;
import POJOS.Ocupacion;
import POJOS.Viajes;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;


public class elegirAsientos extends HttpServlet {
    
    private SessionFactory SessionBuilder;
    
    public void init(){  
        SessionBuilder=NewHibernateUtil.getSessionFactory();    
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            ArrayList<Integer> asientosOcupados = new ArrayList();
            
        HttpSession session = request.getSession(true);
        
            Reserva reserva = (Reserva)session.getAttribute("reserva");
            
            int idViaje = Integer.parseInt(request.getParameter("idViaje"));
            
            Viajes viaje = new DAO.Operaciones().buscarViaje(idViaje, SessionBuilder);
            
            reserva.setViaje(viaje);
            
            ArrayList<Compra> compra = new DAO.Operaciones().buscarCompras(reserva.getViaje().getId(), SessionBuilder); 
           
           Iterator iterCompras = compra.iterator();
           
            while(iterCompras.hasNext()){
           
              Compra compraObj = (Compra)iterCompras.next();
               
              Iterator iterOcupaciones = compraObj.getOcupacions().iterator();

                while(iterOcupaciones.hasNext()){

                Ocupacion ocupacionObj = (Ocupacion)iterOcupaciones.next();
                
                asientosOcupados.add(ocupacionObj.getNumAsiento());
                      
            }
           
           }
           
           reserva.setAsientosOcupados(asientosOcupados);
           
           session.setAttribute("reserva", reserva);
            
           response.sendRedirect("./pasoDos.jsp");
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
