/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.CitizenDAO;
import DAO.OCPDDAO;
import Entity.Citizen;
import Entity.Files;
import Entity.Location;
import Entity.Project;
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
public class Citizen_FollowProject extends HttpServlet {

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
            OCPDDAO dao = new OCPDDAO();
            String id = request.getParameter("projId");
            Project p = dao.getProjectDetails(id);
            ArrayList<Location> projectLocation = p.getLocation();
            String location = new Gson().toJson(projectLocation);
            session.setAttribute("location", location);

            ArrayList<Testimonial> tList = new ArrayList<>();
            ArrayList<Files> fList;
            ArrayList<Integer> idList = new ArrayList<>();
            Testimonial t;

            for (Files f : p.getFiles()) {
                if (f.getTestimonial().getId() != 0) {
                    if (!idList.contains(f.getTestimonial().getId())) {
                        idList.add(f.getTestimonial().getId());
                    }
                }
            }
            for (int x : idList) {
                t = dao.getTestimonial(x);
                tList.add(t);
            }
            for (Testimonial tm : tList) {
                fList = new ArrayList<>();
                for (Files f : p.getFiles()) {
                    if (tm.getId() == f.getTestimonial().getId()) {
                        fList.add(f);
                    }
                }
                tm.setFiles(fList);
            }
            session.setAttribute("testimonials", tList);

            Citizen c = (Citizen) session.getAttribute("user");
            CitizenDAO ct = new CitizenDAO();

            ServletContext context = getServletContext();
            RequestDispatcher dispatch = context.getRequestDispatcher("/Citizen_ViewProjectDetails.jsp");
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
