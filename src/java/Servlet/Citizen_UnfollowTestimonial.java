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
import Entity.Files;
import Entity.Supporter;
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
 * @author RoAnn
 */
public class Citizen_UnfollowTestimonial extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        try {
            int idd = Integer.parseInt(request.getParameter("idd"));
            ActivityDAO actdao = new ActivityDAO();
            CitizenDAO ctDAO = new CitizenDAO();
            Testimonial t = ctDAO.getTestimonial(idd);
            t.setReplies(ctDAO.getReplies(t));
            Citizen c = (Citizen) session.getAttribute("user");

            //Retrieve all the images and videos linked to the testimonial
            ArrayList<Files> i = ctDAO.getFiles(idd, t, "Image");
            ArrayList<Files> v = ctDAO.getFiles(idd, t, "Video");
            ArrayList<Files> d = ctDAO.getFiles(idd, t, "Document");
            ctDAO.unfollowTestimonial(new Supporter(0, t, c));
            int supporter = ctDAO.getnumberofsubscribers(t);

            session.setAttribute("followCheck", ctDAO.isSubscribed(t, c));
            session.setAttribute("openTestimonial", t);
            session.setAttribute("openImage", i);
            session.setAttribute("openVideo", v);
            session.setAttribute("openDocument", d);
            request.setAttribute("supporters", Integer.toString(supporter));
            if (ctDAO.getFiles(t, "Pending").size() > 0) {
                session.setAttribute("showAdd", true);
            } else {
                session.setAttribute("showAdd", false);
            }
            //Add activity
            actdao.addActivity(new Activity(0, "you unsubscribed to " + t.getTitle(), null, c.getUser()));

            //request.setAttribute("success", "LetterSuccess");
            ServletContext context = getServletContext();
            RequestDispatcher dispatch = context.getRequestDispatcher("/Citizen_ViewTestimonial.jsp");
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
