/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.CitizenDAO;
import DAO.GSDAO;
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
public class GS_ViewTestimonials extends HttpServlet {

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
            CitizenDAO c = new CitizenDAO();

            //Get All Testimonials
            ArrayList<Testimonial> allTestimonials = gs.getTestimonials();
            for (int x = 0; x < allTestimonials.size(); x++) {
                allTestimonials.get(x).setFiles(c.getFiles(allTestimonials.get(x), "Approved"));
            }

            //Get All Pending Testimonials (Testimonails without reply)
            ArrayList<Testimonial> allPendingTestimonials = gs.getTestimonialsNR();
            for (int x = 0; x < allPendingTestimonials.size(); x++) {
                allPendingTestimonials.get(x).setFiles(c.getFiles(allPendingTestimonials.get(x), "Approved"));
            }

            //Get All Testimonial With reply
            ArrayList<Integer> allreplied = gs.getTestimonialsWR();

            ArrayList<Testimonial> allRepliedTestimonials = new ArrayList<Testimonial>();
            for (int x = 0; x < allreplied.size(); x++) {
                allRepliedTestimonials.add(gs.getTestimonial(allreplied.get(x)));
            }

            for (int x = 0; x < allRepliedTestimonials.size(); x++) {
                allRepliedTestimonials.get(x).setFiles(c.getFiles(allRepliedTestimonials.get(x), "Approved"));
            }

            //Get All Testimonials with linked projects
            ArrayList<Integer> alllinked = gs.getLinkedTestimonials();

            ArrayList<Testimonial> allLinkedTestimonials = new ArrayList<Testimonial>();
            for (int x = 0; x < alllinked.size(); x++) {
                allLinkedTestimonials.add(gs.getTestimonial(alllinked.get(x)));
            }

            for (int x = 0; x < allLinkedTestimonials.size(); x++) {
                allLinkedTestimonials.get(x).setFiles(c.getFiles(allLinkedTestimonials.get(x), "Approved"));
            }

            //Request set attributes testimonials
            request.setAttribute("allTestimonials", allTestimonials);
            request.setAttribute("allPendingTestimonials", allPendingTestimonials);
            request.setAttribute("allRepliedTestimonials", allRepliedTestimonials);
            request.setAttribute("allLinkedTestimonials", allLinkedTestimonials);

            ServletContext context = getServletContext();

            RequestDispatcher dispatch = context.getRequestDispatcher("/GS_ViewCitizenTestimonial.jsp");
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
