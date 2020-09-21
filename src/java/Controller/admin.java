package Controller;

import Clases.Hash;
import Clases.Reserva;
import DAO.NewHibernateUtil;
import POJOS.Cliente;
import POJOS.Parametros;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;


public class admin extends HttpServlet {

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
            
            String user = request.getParameter("user");
            
            String password = request.getParameter("password");
            
            try{
                
            Parametros parametros = new DAO.Operaciones().admin(SessionBuilder);
                                  
                if(Hash.sha1(password).equals(parametros.getPassword()) && user.equals(parametros.getUser()))
                    {
                    
                    session.setAttribute("parametros", parametros);

                    response.sendRedirect("./buscarViajes");
                
                }else{
                    
                    String mensaje = "password";
                    
                    session.setAttribute("alert", mensaje);

                    response.sendRedirect("./administracion.jsp");
                        
                }
            
            }catch(Exception ex){
                
            String mensaje = "usuario";
                
            session.setAttribute("alert", mensaje);

            response.sendRedirect("./administracion.jsp");
            
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
