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
import Entity.Task;
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
 * @author Lenovo
 */
public class GS_ViewTasks extends HttpServlet {

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
            OCPDDAO oc = new OCPDDAO();
            GSDAO gs = new GSDAO();

            String projid = (String) request.getParameter("projid");
            Project p = oc.getProjectDetails(projid);

            ArrayList<Schedule> allsched = p.getSchedule();
            ArrayList<Task> alltasks = gs.getTasks(p);
            ArrayList<Task> temp;
            
            
            for (int y = 0; y < allsched.size(); y++) {
                temp = new ArrayList<Task>();
                for (int x = 0; x < alltasks.size(); x++) {
                    if(allsched.get(y).getId() == alltasks.get(x).getSchedule2().getId()){
                    temp.add(alltasks.get(x));
                    }
                }
                allsched.get(y).setTasks(temp);
            }

            request.setAttribute("Project", p);
            request.setAttribute("allsched", allsched);

            ServletContext context = getServletContext();
            RequestDispatcher dispatch = context.getRequestDispatcher("/GS_ViewTask.jsp");
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
