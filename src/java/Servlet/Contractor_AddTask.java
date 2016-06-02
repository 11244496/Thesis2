/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ContractorDAO;
import DAO.GSDAO;
import Entity.Component;
import Entity.Employee;
import Entity.Files;
import Entity.Location;
import Entity.Material;
import Entity.Project;
import Entity.Schedule;
import Entity.Task;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import json.JSONArray;
import json.JSONObject;

/**
 *
 * @author Krist
 */
@WebServlet(name = "Contractor_AddTask", urlPatterns = {"/Contractor_AddTask"})
public class Contractor_AddTask extends HttpServlet {

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

        ContractorDAO cont = new ContractorDAO();
        GSDAO gs = new GSDAO();
        ArrayList<Schedule> allschedule = new ArrayList<Schedule>();
        ArrayList<Task> alltask = new ArrayList<Task>();
        String projId = (String) request.getParameter("projectid");
        Project p = new Project();
        p.setId(projId);

        //===================================Set Schedule===============================================
        JSONArray eventvalues = new JSONArray(request.getParameter("eventvalues"));
        for (Object obj : eventvalues) {
            JSONObject schedulejson = new JSONObject(obj.toString());
            Schedule sched = new Schedule(0,
                    schedulejson.getString("title"),
                    schedulejson.getString("start"),
                    schedulejson.getString("end"),
                    schedulejson.getString("status"),
                    schedulejson.getString("dept"),
                    schedulejson.getString("stage"));
            allschedule.add(sched);
        }

        //===================================Set Task===============================================
        JSONArray taskvalues = new JSONArray(request.getParameter("taskvalues"));
        for (Object obj : taskvalues) {
            JSONObject taskList = new JSONObject(obj.toString());
            Task task = new Task(0,
                    0, taskList.getString("Task"),
                    taskList.getString("Description"),
                    taskList.getString("StartDate"),
                    taskList.getString("EndDate"),
                    taskList.getString("PersonInCharge"),
                    taskList.getString("Activity"));
            alltask.add(task);
        }

        ArrayList<Task> everytask = null;
        for (int x = 0; x < allschedule.size(); x++) {
            everytask = new ArrayList<Task>();
            for (int y = 0; y < alltask.size(); y++) {
                if (allschedule.get(x).getEvent().equalsIgnoreCase(alltask.get(y).getSchedule())) {
                    everytask.add(alltask.get(y));
                }
            }
            allschedule.get(x).setTasks(everytask);
        }

        p.setSchedule(allschedule);

        ArrayList<Schedule> recentlyaddedsched = gs.getprojectSchedule(p);
        for (int x = 0; x < p.getSchedule().size(); x++) {
            for (int z = 0; z < p.getSchedule().get(x).getTasks().size(); z++) {
                for (int y = 0; y < recentlyaddedsched.size(); y++) {
                    if (p.getSchedule().get(x).getTasks().get(z).getSchedule().equalsIgnoreCase(recentlyaddedsched.get(y).getEvent())) {
                        gs.setScheduleTask(p.getSchedule().get(x).getTasks().get(z), recentlyaddedsched.get(y));
                    }
                }
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
