/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ActivityDAO;
import DAO.AdjustSchedule;
import DAO.NotificationDAO;
import DAO.OCPDDAO;
import Entity.Activity;
import Entity.Annotation;
import Entity.Employee;
import Entity.Notification;
import Entity.Project;
import Entity.Schedule;
import Entity.Task;
import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class OCPD_PutOnHold extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Employee e = (Employee) session.getAttribute("user");
            OCPDDAO ocpd = new OCPDDAO();
            String projId = request.getParameter("projId");
            Project p = new Project();
            p = ocpd.getProjectDetails(projId);

            AdjustSchedule as = new AdjustSchedule();
            Schedule ev = as.getSchedDetails("Review Proposal", "Pending", p.getId());
            as.updateSchedule(ev);
            p = ocpd.getProjectDetails(projId);
            as.adjust(ev, p.getSchedule());

            Annotation an = new Annotation(0, request.getParameter("detailsTA"), request.getParameter("materialsTA"),
                    request.getParameter("scheduleTA"), request.getParameter("testimonialTA"), null, "Pending",
                    request.getParameter("addtcomments"), p);

            Schedule meeting = new Schedule(0, "Meeting with OCPD", request.getParameter("meetingDate"),
                    request.getParameter("meetingDate"), "Unconfirmed", "OCPD", "Planning");
            meeting.setTime(request.getParameter("meetingTime"));

            ocpd.sendAnnotations(an, p);
            ocpd.setMeeting(meeting, p);
            int mId = ocpd.getMeetingID(p);

            Task a;
            String[] agenda = request.getParameterValues("meetingagenda");
            if (agenda != null) {
                for (String task : agenda) {
                    a = new Task(0, 0, "Meeting", task, request.getParameter("meetingDate"), request.getParameter("meetingDate"), "OCPD", null);
                    a.setSchedule2(meeting);
                    ocpd.addTask(a,"Pending", mId);
                }
            }

            ocpd.changeProjStatus("On-Hold", p);

            NotificationDAO ndao = new NotificationDAO();
            Notification n = null;
            for (User u : ndao.getEmployeePerDept("GS")) {
                n = new Notification();
                n.setNotification("Project " + p.getName() + "was put on-hold.");
                n.setUsers_ID(u);
                ndao.addNotification(n);
                n.setNotification(e.getFirstName() + " " + e.getFirstName() + " set a meeting for project " + p.getName() + " on "
                        + meeting.getStartdate() + " at " + meeting.getTime() + ". Please confirm the schedule.");
                ndao.addNotification(n);
            }

            ActivityDAO actdao = new ActivityDAO();
            actdao.addActivity(new Activity(0,
                    e.getFirstName() + " " + e.getLastName() + " put " + p.getName() + " project on hold.",
                    null, e.getUser()));

            p = ocpd.getProjectDetails(projId);
            as.insertEdit(p);
            p = ocpd.getProjectDetails(projId);

            as.adjustForEdit(p.getSchedule());
        

        ServletContext context = getServletContext();
        RequestDispatcher dispatch = context.getRequestDispatcher("/OCPD_ViewProjectList");
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
        try {
            processRequest(request, response);

        } catch (ParseException ex) {
            Logger.getLogger(OCPD_PutOnHold.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);

        } catch (ParseException ex) {
            Logger.getLogger(OCPD_PutOnHold.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
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
