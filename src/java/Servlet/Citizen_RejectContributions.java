/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.CitizenDAO;
import DAO.LoginDAO;
import DAO.NotificationDAO;
import Entity.Citizen;
import Entity.Files;
import Entity.Notification;
import Entity.Testimonial;
import java.io.File;
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
public class Citizen_RejectContributions extends HttpServlet {

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
            CitizenDAO ctDAO = new CitizenDAO();
            NotificationDAO ntDAO = new NotificationDAO();
            LoginDAO ldao = new LoginDAO();
            Testimonial t = (Testimonial) session.getAttribute("openTestimonial");
            Files f2 = null;
            String[] u = t.getFolderName().split("/");
            String folderName = u[u.length - 1];
            String fileURL = "";
            String[] ids = request.getParameterValues("checked");
            
            Citizen c2 = (Citizen) session.getAttribute("user");
            //loop:     get file info --> get filename --> create file url --> delete from directory     
            for (int x = 0; x < ids.length; x++) {
                
                f2 = ctDAO.getFile(Integer.parseInt(ids[x]));
                ntDAO.addNotification(new Notification(0, c2.getFirstName() + " " + c2.getLastName() + " has rejected your request to add additional files to testimonial entitled " + t.getTitle(), null, ldao.getUser(f2.getUploader())));
                
                fileURL = "D:\\Development\\NetBeans\\Projects\\CogitoFinal\\Testimonials" + folderName + "\\" + f2.getFileName();
                new File(fileURL).delete();
                ctDAO.disapproveAdded(Integer.parseInt(ids[x]));
                
            }


            //Retrieve all the images and videos linked to the testimonial
            ArrayList<Files> i = ctDAO.getFiles(t.getId(), t, "Image");
            ArrayList<Files> v = ctDAO.getFiles(t.getId(), t, "Video");
            ArrayList<Files> d = ctDAO.getFiles(t.getId(), t, "Document");

            if (ctDAO.getFiles(t, "Pending").size() > 0) {
                session.setAttribute("showAdd", true);
            } else {
                session.setAttribute("showAdd", false);
            }
            session.setAttribute("followCheck", ctDAO.isSubscribed(t, c2));
            session.setAttribute("openTestimonial", t);
            session.setAttribute("openImage", i);
            session.setAttribute("openVideo", v);
            session.setAttribute("openDocument", d);
            
            

            ServletContext context = getServletContext();
            RequestDispatcher dispatch = context.getRequestDispatcher("/Citizen_ViewTestimonial.jsp");
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
