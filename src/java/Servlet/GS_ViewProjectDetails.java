/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.GSDAO;
import DAO.OCPDDAO;
import Entity.Files;
import Entity.Location;
import Entity.Project;
import Entity.Schedule;
import Entity.Task;
import Entity.Testimonial;
import com.google.gson.Gson;
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
public class GS_ViewProjectDetails extends HttpServlet {

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
            OCPDDAO ocpdDAO = new OCPDDAO();
            GSDAO gdao = new GSDAO();
            
            String id = (request.getParameter("projid"));
            Project project = ocpdDAO.getProjectDetails(id);
            ArrayList<Location> projectLocation = project.getLocation();
            String location = new Gson().toJson(projectLocation);
            session.setAttribute("location", location);

            ArrayList<Schedule> sList = project.getSchedule();
            String startdate = "";
            for (Schedule s : sList) {
                if (s.getStage().equalsIgnoreCase("Implementation")) {
                    startdate = s.getStartdate();
                    break;
                }
            }
            session.setAttribute("startdate", startdate);

            String sList2 = new Gson().toJson(sList);
            session.setAttribute("calendar", sList2);
            session.setAttribute("cost", ocpdDAO.getCost(project));

            ArrayList<Testimonial> tList = new ArrayList<>();
            ArrayList<Files> fList;
            ArrayList<Integer> idList = new ArrayList<>();
            Testimonial t;

            for (Files f : project.getFiles()) {
                if (f.getTestimonial().getId() != 0) {
                    if (!idList.contains(f.getTestimonial().getId())) {
                        idList.add(f.getTestimonial().getId());
                    }
                }
            }
            for (int x : idList) {
                t = ocpdDAO.getTestimonial(x);
                tList.add(t);
            }
            for (Testimonial tm : tList) {
                fList = new ArrayList<>();
                for (Files f : project.getFiles()) {
                    if (tm.getId() == f.getTestimonial().getId()) {
                        fList.add(f);
                    }
                }
                tm.setFiles(fList);
            }
            session.setAttribute("testimonials", tList);
            Schedule meeting = new Schedule();
            ArrayList<Task> agenda = new ArrayList<>();
            if (project.getStatus().equalsIgnoreCase("on-hold")) {
                project.setAnnotations(ocpdDAO.getAnnotation(project, "Pending"));
                meeting = ocpdDAO.getMeeting(project);
                agenda = ocpdDAO.getAgenda(meeting);
            }
            
            session.setAttribute("project", project);
            session.setAttribute("meeting", meeting);
            session.setAttribute("agenda", agenda);
            session.setAttribute("Cost", ocpdDAO.getCost(project));
            
            
            //Set new arraylist of proposal files
            ArrayList<Files> projectFiles = gdao.getprojectfiles(project);
            session.setAttribute("pFiles", projectFiles);
            
            double percent = ocpdDAO.getPercentage(project);
            
            session.setAttribute("percentage", percent);
            ServletContext context = getServletContext();
            RequestDispatcher dispatch = context.getRequestDispatcher("/GS_ViewProjectDetails.jsp");
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
