/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ActivityDAO;
import DAO.AjaxDAO;
import DAO.NotificationDAO;
import Entity.Activity;
import Entity.Employee;
import Entity.Notification;
import Entity.Schedule;
import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author RoAnn
 */
public class confirmschedule extends HttpServlet {

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
            AjaxDAO adao = new AjaxDAO();
            NotificationDAO ndao = new NotificationDAO();
            Notification n = null;
            ActivityDAO actdao = new ActivityDAO();
            int schedID = Integer.parseInt(request.getParameter("scheduleID"));
            Schedule s = adao.getSchedule(schedID);

            adao.setMeetingDone(schedID, "Pending");
            String dept = "";
            if (e.getDepartment().equalsIgnoreCase("Engineering")) {
                dept = "GS";
                for (User u : ndao.getEmployeePerDept("OCPD")) {
                    n = new Notification();
                    n.setNotification("Meeting on " + s.getStartdate() + " " + s.getTime() + " has been confirmed.");
                    n.setUsers_ID(u);
                    ndao.addNotification(n);
                }
                actdao.addActivity(new Activity(0,
                        e.getFirstName() + " " + e.getLastName() + " confirmed the meeting on " + s.getStartdate(),
                        null, e.getUser()));

            } else if (e.getDepartment().equalsIgnoreCase("OCPD")) {
                dept = "OCPD";
                for (User u : ndao.getEmployeePerDept("GS")) {
                    n = new Notification();
                    n.setNotification("Meeting on " + s.getStartdate() + " " + s.getTime() + " has been confirmed.");
                    n.setUsers_ID(u);
                    ndao.addNotification(n);
                }
                actdao.addActivity(new Activity(0,
                        e.getFirstName() + " " + e.getLastName() + " confirmed the meeting on " + s.getStartdate(),
                        null, e.getUser()));

            }

            adao.changeDept(s, dept);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
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
