/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.GSDAO;
import DAO.OCPDDAO;
import Entity.Project;
import Entity.Schedule;
import Entity.Testimonial;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author RoAnn
 */
public class OCPD_Home extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            GSDAO gsdao = new GSDAO();
            OCPDDAO odao = new OCPDDAO();

            ArrayList<Schedule> unconfirmedMeeting = gsdao.getAllMeetings("Unconfirmed");
            ArrayList<Project> unconfirmedMProjects = new ArrayList<>();
            OCPDDAO oc = new OCPDDAO();
                for (int x = 0; x < unconfirmedMeeting.size(); x++) {
                    unconfirmedMProjects.add(odao.getProjectDetails(unconfirmedMeeting.get(x).getProjectID()));
                    unconfirmedMeeting.get(x).setTasks(oc.getAgenda(unconfirmedMeeting.get(x)));
                
            }

            //Get Counts

            request.setAttribute("unconfirmedMeeting", unconfirmedMeeting);
            request.setAttribute("unconfirmedMProjects", unconfirmedMProjects);

            ServletContext context = getServletContext();
            RequestDispatcher dispatch = context.getRequestDispatcher("/OCPD_Home.jsp");
            dispatch.forward(request, response);

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
