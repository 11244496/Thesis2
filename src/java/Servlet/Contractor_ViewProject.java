/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.BACDAO;
import DAO.ContractorDAO;
import DAO.GSDAO;
import DAO.OCPDDAO;
import Entity.Files;
import Entity.InvitationToBid;
import Entity.Location;
import Entity.Project;
import Entity.Schedule;
import Entity.Task;
import Entity.Testimonial;
import com.google.gson.Gson;
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
@WebServlet(name = "Contractor_ViewProject", urlPatterns = {"/Contractor_ViewProject"})
public class Contractor_ViewProject extends HttpServlet {

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
        try {
            OCPDDAO ocpdDAO = new OCPDDAO();
            GSDAO gdao = new GSDAO();
            ContractorDAO contDAO = new ContractorDAO();
            String id = request.getParameter("projectID");

            Project project = ocpdDAO.getProjectDetails(id);
            ArrayList<InvitationToBid> invitation = contDAO.getInvitation(project);

            request.setAttribute("projectInfo", project);
            request.setAttribute("invitation", invitation);

            //Other Project Details
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
            session.setAttribute("project", project);
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
            session.setAttribute("Cost", ocpdDAO.getCost(project));

            double percent = ocpdDAO.getPercentage(project);

            session.setAttribute("percentage", percent);

            //Set new arraylist of proposal files
            ArrayList<Files> projectFiles = gdao.getprojectfiles(project);
            session.setAttribute("pFiles", projectFiles);
            
            ServletContext context = getServletContext();
            RequestDispatcher dispatch = null;
            if (!project.getStatus().equalsIgnoreCase("For Negotiation")) {
                dispatch = context.getRequestDispatcher("/Contractor_ViewProject.jsp");
            } else {
                dispatch = context.getRequestDispatcher("/Contractor_ViewProjectN.jsp");
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
