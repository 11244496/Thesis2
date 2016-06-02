/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.CitizenDAO;
import Entity.Citizen;
import Entity.Testimonial;
import Entity.User;
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
public class Citizen_Home extends HttpServlet {

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
            
            CitizenDAO citizenDAO = new CitizenDAO();

            CitizenDAO ctDAO = new CitizenDAO();
            Citizen c = (Citizen) session.getAttribute("user");
            User user = ctDAO.getUser(c);
            
            //Get ArrayList of ID of Testimonials that has the most followers
            ArrayList<Integer> toptestiID = citizenDAO.gettoptestimonialID(); 
            ArrayList<Integer> Subscribers = new ArrayList<Integer>();
            
            ArrayList<Testimonial> toptestifinal = new ArrayList<Testimonial>();
            
            for(int x = 0; x < toptestiID.size();x++){
                toptestifinal.add(ctDAO.getTestimonial(toptestiID.get(x)));
            }
            
            for(int x=0;x < toptestifinal.size();x++){
                toptestifinal.get(x).setFiles(ctDAO.getFiles(toptestifinal.get(x).getId(), toptestifinal.get(x), "Image"));
                Subscribers.add(ctDAO.getnumberofsubscribers(toptestifinal.get(x)));
            }
            
            

            //Get Count of Testimonials with this user
            int mytestimonialnumber = citizenDAO.gettestimonialcount(c);
            
            
            //Get Count of Testimonials without projet ID
            int unlinkedtestimonials = citizenDAO.getunlikedtestimonial(c);

            
            request.setAttribute("toptesti", toptestifinal);
            request.setAttribute("mytestimonialnumber", mytestimonialnumber);
            request.setAttribute("unlikedtestimonial", unlinkedtestimonials);
            request.setAttribute("Subscribers", Subscribers);
           
            
            ServletContext context = getServletContext();
            RequestDispatcher dispatch = context.getRequestDispatcher("/Citizen_Home.jsp");
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
