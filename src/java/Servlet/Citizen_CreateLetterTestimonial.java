/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ActivityDAO;
import DAO.CitizenDAO;
import Entity.Activity;
import Entity.Citizen;
import Entity.Testimonial;
import java.io.IOException;
import java.io.PrintWriter;
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
public class Citizen_CreateLetterTestimonial extends HttpServlet {

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
        try{
            ActivityDAO actdao = new ActivityDAO();
            CitizenDAO cd = new CitizenDAO();
            Citizen c = (Citizen) session.getAttribute("user");
            
            String concern = request.getParameter("type");
            if (concern.equalsIgnoreCase("other"))
                concern = request.getParameter("concern");
            
            String location = request.getParameter("testimoniallocation");
            String locationdetails = request.getParameter("testimoniallocationdetails");
            
            Testimonial l= new Testimonial(0, request.getParameter("subject"), null, request.getParameter("content"), null,location, locationdetails, "letter", concern,"Pending", c);
            
            cd.sendLetter(l);
            //Add activity
            actdao.addActivity(new Activity(0, "you have submitted a letter which is about " + request.getParameter("subject"), null, c.getUser()));
                    
            request.setAttribute("success", "LetterSuccess");
            ServletContext context = getServletContext();
            RequestDispatcher dispatch = context.getRequestDispatcher("/Citizen_SearchTestimonial");
            dispatch.forward(request, response);

        }
        
        finally {
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
