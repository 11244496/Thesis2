/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.AdjustSchedule;
import DAO.GSDAO;
import DAO.OCPDDAO;
import Entity.Employee;
import Entity.Project;
import Entity.Schedule;
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
 * @author Lenovo
 */
public class GS_UpdateTask extends HttpServlet {

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
            OCPDDAO oc = new OCPDDAO();
            String projectID = request.getParameter("projID");
            Employee e = (Employee) session.getAttribute("user");

            //initialize the project with schedules
            Project p = oc.getProjectDetails(projectID);

            //Update Tasks status
            String[] checkboxChecked = request.getParameterValues("taskID");

            //Working
            for (int x = 0; x < checkboxChecked.length; x++) {
                gs.setTaskStatus(Integer.parseInt(checkboxChecked[x]), "Done");
            }

            for (int x = 0; x < p.getSchedule().size(); x++) {
                p.getSchedule().get(x).setTasks(gs.getscheduleTask(p.getSchedule().get(x).getId()));
            }

            //Add Remarks
            String[] remarks = request.getParameterValues("remarks");
            String[] allTaskID = request.getParameterValues("allTaskID");

            for (int x = 0; x < allTaskID.length; x++) {
                if (remarks[x].equalsIgnoreCase(".")) {
                } else {
                    gs.addInspection(Integer.parseInt(allTaskID[x]), remarks[x], e.getUser().getId());
                }
            }

            //Check if Project Schedule has all tasks Done, if so, Change Schedule status to done
            for (int x = 0; x < p.getSchedule().size(); x++) {
                if (p.getSchedule().get(x).getStage().equalsIgnoreCase("Implementation")) {
                    if (alltaskdone(p.getSchedule().get(x)) == true) {
                        if (p.getSchedule().get(x).getStatus().equalsIgnoreCase("Done")) {
                        } else {
                            gs.updateSchedule(p.getSchedule().get(x), "Done");
                        }
                    } else {

                    }
                }
            }
            //Working
            
            Project p2 = oc.getProjectDetails(projectID);

            //Adjust Schedule Here
            AdjustSchedule a = new AdjustSchedule();
            try {
                a.adjustImplementation(p2.getSchedule());
            } catch (ParseException ex) {
                Logger.getLogger(GS_UpdateTask.class.getName()).log(Level.SEVERE, null, ex);
            }

            Project p3 = oc.getProjectDetails(projectID);

            if (allscheduledone(p3) == true) {
                oc.changeProjStatus("Finished", p3);
            }

            ServletContext context = getServletContext();
            RequestDispatcher dispatch = context.getRequestDispatcher("/GS_ViewImplementedProjects");
            dispatch.forward(request, response);

        } finally {
            out.close();
        }
    }

    public boolean alltaskdone(Schedule s) {

        boolean count = false;

        for (int x = 0; x < s.getTasks().size(); x++) {

            if (!s.getTasks().isEmpty()) {
                if (s.getTasks().get(x).getStatus().equalsIgnoreCase("Done")) {
                    count = true;
                } else {
                    count = false;
                    break;
                }
            }

        }

        return count;

    }

    public boolean allscheduledone(Project p) {

        boolean allscheduledone = false;

        for (int x = 0; x < p.getSchedule().size(); x++) {
            if (p.getSchedule().get(x).getStatus().equalsIgnoreCase("Done")) {
                allscheduledone = true;
            } else {
                return false;
            }
        }
        
        return allscheduledone;
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
