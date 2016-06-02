/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.GSDAO;
import Entity.Project;
import Entity.Project_Progress;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Krist
 */
@WebServlet(name = "GS_SubmitProgressEntry", urlPatterns = {"/GS_SubmitProgressEntry"})
public class GS_SubmitProgressEntry extends HttpServlet {

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
        try {
            
            GSDAO gsDAO = new GSDAO();
            String [] materials = request.getParameterValues("material");
            String [] quantity = request.getParameterValues("quantity");
            String [] percentage = request.getParameterValues("percentage");
            String id = request.getParameter("projectid");
            
            Project_Progress pp;
            Project project = gsDAO.getProjectInfo(id);
            
            for (int x = 0; x<materials.length; x++){
                
                pp = new Project_Progress();
                pp.setMaterial(materials[x]);
                pp.setQuantity(Integer.parseInt(quantity[x]));
                pp.setProject_percentage(Float.parseFloat(percentage[x]));
                
                pp.setValue_of_work(Float.parseFloat(quantity[x]) * Float.parseFloat(percentage[x]));
                pp.setProject(project);
                gsDAO.submitProgressEntry(pp);
            }
            
            request.setAttribute("Success", "Success");
            ServletContext context = getServletContext();
            RequestDispatcher dispatch = context.getRequestDispatcher("/GS_Home");
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
