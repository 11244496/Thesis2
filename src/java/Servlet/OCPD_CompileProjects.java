/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ActivityDAO;
import DAO.NotificationDAO;
import DAO.OCPDDAO;
import Entity.Activity;
import Entity.Employee;
import Entity.Notification;
import Entity.Project;
import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class OCPD_CompileProjects extends HttpServlet {

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
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Employee e = (Employee) session.getAttribute("user");
            OCPDDAO ocpd = new OCPDDAO();
            String[] check = request.getParameterValues("project");
            Project p;
            ArrayList<Project> pList = new ArrayList<>();
            ArrayList<Float> cList = new ArrayList<>();
            float cost = 0;
            NotificationDAO ndao = new NotificationDAO();
            Notification n = null;
            ActivityDAO actdao = new ActivityDAO();

            for (String i : check) {
                p = ocpd.getProjectDetails(i);
                cost = ocpd.getCost(p);
                ocpd.changeProjStatus("Approved", p);
                for (User u : ndao.getEmployeePerDept("GS")) {
                    n = new Notification();
                    n.setNotification("Project " + p.getName() + " has been compiled and is now waiting for approval.");
                    n.setUsers_ID(u);
                    ndao.addNotification(n);
                }

                pList.add(p);
                cList.add(cost);
                actdao.addActivity(new Activity(0,
                        e.getFirstName() + " " + e.getLastName() + " compiled " + p.getName() + " project.",
                        null, e.getUser()));
            }

            request.setAttribute("pList", pList);
            request.setAttribute("cList", cList);
            ServletContext context = getServletContext();

            RequestDispatcher dispatch = context.getRequestDispatcher("/OCPD_CompiledProjects.jsp");
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
