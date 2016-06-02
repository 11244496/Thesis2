/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.CitizenDAO;
import Entity.Citizen;
import Entity.Files;
import Entity.Testimonial;
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
 * @author Lenovo
 */
public class Citizen_SearchTestimonial extends HttpServlet {

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

            CitizenDAO c = new CitizenDAO();

            //ADD Followed testimonials
            Citizen citizen = (Citizen) session.getAttribute("user");

            ArrayList<Integer> SubscribedID = c.getSubscribedTestimonials(citizen.getId());

            ArrayList<Testimonial> subscribedTestimonials = new ArrayList<Testimonial>();

            for (int x = 0; x < SubscribedID.size(); x++) {
                subscribedTestimonials.add(c.getTestimonial(SubscribedID.get(x)));
            }

            //Add Trending Testimonials
            ArrayList<Testimonial> allTestimonials = c.getTestimonials();
            for (int x = 0; x < allTestimonials.size(); x++) {
                allTestimonials.get(x).setFiles(c.getFiles(allTestimonials.get(x), "Approved"));
            }

            ArrayList<Testimonial> myTestimonials = c.getTestimonial(citizen);
            for (int x = 0; x < myTestimonials.size(); x++) {
                myTestimonials.get(x).setFiles(c.getFiles(myTestimonials.get(x), "Approved"));
            }

            ArrayList<Integer> toptestiID = c.gettoptestimonialID();

            ArrayList<Testimonial> trendingTestimonials = new ArrayList<Testimonial>();

            for (int x = 0; x < toptestiID.size(); x++) {
                trendingTestimonials.add(c.getTestimonial(toptestiID.get(x)));
            }

            for (int x = 0; x < trendingTestimonials.size(); x++) {
                trendingTestimonials.get(x).setFiles(c.getFiles(trendingTestimonials.get(x), "Approved"));
            }
            for (int x = 0; x < subscribedTestimonials.size(); x++) {
                subscribedTestimonials.get(x).setFiles(c.getFiles(subscribedTestimonials.get(x), "Approved"));
            }

            request.setAttribute("allTestimonials", allTestimonials);
            request.setAttribute("myTestimonials", myTestimonials);
            request.setAttribute("subscribedTestimonials", subscribedTestimonials);
            request.setAttribute("trendingTestimonials", trendingTestimonials);

            ServletContext context = getServletContext();
            String success = (String) request.getAttribute("success");

            request.setAttribute("success", success);
            RequestDispatcher dispatch = context.getRequestDispatcher("/Citizen_SearchTestimonial.jsp");
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
