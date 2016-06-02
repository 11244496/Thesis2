/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ActivityDAO;
import DAO.NotificationDAO;
import DAO.OCPDDAO;
import Entity.Activity;
import Entity.Employee;
import Entity.Notification;
import Entity.PlanningDocument;
import Entity.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author RoAnn
 */
public class OCPD_UploadCDPCLUP extends HttpServlet {

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
            Employee e = (Employee) session.getAttribute("user");
            /*String title = request.getParameter("title");
             String dateCaptured = request.getParameter("dateCaptured");
             String description = request.getParameter("description");
             String category = request.getParameter("category");
             citizenDAO.uploadTestimonial(title, dateCaptured, description, category, (String) session.getAttribute("user"));
             */
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            if (isMultipart) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                try {
                    List items = upload.parseRequest(request);
                    Iterator iterator = items.iterator();
                    String type = null;
                    File uploadedFile = null;
                    String fileName = null;

                    while (iterator.hasNext()) {
                        FileItem item = (FileItem) iterator.next();

                        if (item.isFormField()) {

                            //Returns the string inside the field
                            String value = item.getString();

                            //returns the name of the field
                            String value2 = item.getFieldName();

                            if (value2.equals("type")) {
                                type = value;
                            }

                        }

                        if (!item.isFormField()) {

                            fileName = item.getName();
                            String root = getServletContext().getRealPath("/");

                            //path where the file will be stored
                            File path = new File("D:\\Development\\NetBeans\\Projects\\CogitoFinal\\Upload" + "/Engineering Department" + "/planningdocuments_TEMP");
                            if (!path.exists()) {
                                boolean status = path.mkdirs();
                            }

                            uploadedFile = new File(path + "/" + fileName);
                            item.write(uploadedFile);

                        }
                    }

                    //
                    PlanningDocument d = new PlanningDocument();
                    d.setName(fileName);
                    d.setUrl("chrome-extension://ckccpjpbccmlnbpdgdnelhddmgbjhfab/Engineering Department/planningdocuments_TEMP/" + fileName);
                    d.setType(type);
                    d.setEmployee(e);
                    ocpdDAO.uploadDocument(d);
                } catch (FileUploadException x) {
                    x.printStackTrace();
                } catch (Exception x) {
                    x.printStackTrace();
                }

            }

            NotificationDAO ndao = new NotificationDAO();
            Notification n = null;
            for (User u : ndao.getEmployeePerDept("GS")) {
                n = new Notification();
                n.setNotification("New planning document has been uploaded by the OCPD");
                n.setUsers_ID(u);
                ndao.addNotification(n);
            }
            ActivityDAO actdao = new ActivityDAO();
            actdao.addActivity(new Activity(0,
                    e.getFirstName() + " " + e.getLastName() + " uploaded a new planning document/",
                    null, e.getUser()));
            response.sendRedirect("OCPD_ViewPlanningDocument");

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
