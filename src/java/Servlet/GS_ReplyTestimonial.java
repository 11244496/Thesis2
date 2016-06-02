/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.GSDAO;
import DAO.LoginDAO;
import DAO.NotificationDAO;
import Entity.Employee;
import Entity.Notification;
import Entity.Reply;
import Entity.Testimonial;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author RoAnn
 */
public class GS_ReplyTestimonial extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        try {
            GSDAO gs = new GSDAO();
            NotificationDAO ntDAO = new NotificationDAO();
            LoginDAO ldao = new LoginDAO();
            Testimonial t = (Testimonial) session.getAttribute("openTestimonial");

            Employee e = (Employee) session.getAttribute("user");
            Reply r = new Reply(0, request.getParameter("replyMsg"), e.getUser().getUsername(), t, null);
            gs.sendReply(t, r);
            t.setReplies(gs.getReplies(t));

            //Notification
            ntDAO.addNotification(new Notification(0, e.getFirstName() + " " + e.getLastName() + " has replied to your testimonial entitled " + t.getTitle(), null, t.getCitizen().getUser()));
            
            ServletContext context = getServletContext();
            RequestDispatcher dispatch;
            if (t.getCategory().equalsIgnoreCase("letter")) {
                dispatch = context.getRequestDispatcher("/GS_ViewCitizenLetter.jsp");
            } else {
                dispatch = context.getRequestDispatcher("/GS_ViewCitizenTestimonialDetails.jsp");
            }
            dispatch.forward(request, response);

        } finally {
            out.close();
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
