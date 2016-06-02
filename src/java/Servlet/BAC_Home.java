/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.BACDAO;
import DAO.CitizenDAO;
import Entity.Contractor_Has_Project;
import Entity.Project;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Krist
 */
@WebServlet(name = "BAC_Home", urlPatterns = {"/BAC_Home"})
public class BAC_Home extends HttpServlet {

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

            BACDAO bac = new BACDAO();
            ArrayList<Project> projectsBAC = bac.getProjects("BAC");
            ArrayList<Project> projectsWithInvite = bac.getProjectsWithInvitation();
            ArrayList<Project> projectsNego = bac.getNegotiatedProjects();
            ArrayList<Project> projectsIMPL = bac.getProjectsForImplementation("Implementation");

//           ArrayList<Contractor_Has_Project> contProject = bac.getRespondentContractors();
//            Citizen ct = new Citizen();
//            ct = citizenDAO.getInfo((String) request.getSession(false).getAttribute("user"));
//            ArrayList<CitizenNotification> notifList = citizenDAO.getallNotificationToday(ct.getId());
//            request.setAttribute("notifList", notifList);
//            session.setAttribute("NotifSize", notifList.size());
//            
//            
//            ArrayList<CitizenActivity> activityList = citizenDAO.getallActivity(ct.getId());
//            request.setAttribute("activityList", activityList);
//            
//            ArrayList<CitizenNotification> allnotifList = citizenDAO.getallNotification(ct.getId());
//            request.setAttribute("allnotifList", allnotifList);
            request.setAttribute("Projects", projectsBAC);
            request.setAttribute("projectsIMPL", projectsIMPL);
            request.setAttribute("projectsNego", projectsNego);
            request.setAttribute("Projects with Invitation", projectsWithInvite);

            ServletContext context = getServletContext();
            RequestDispatcher dispatch = context.getRequestDispatcher("/BAC_Home.jsp");
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
