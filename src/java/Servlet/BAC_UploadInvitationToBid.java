/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ActivityDAO;
import DAO.AdjustSchedule;
import DAO.BACDAO;
import DAO.CitizenDAO;
import DAO.OCPDDAO;
import Entity.Activity;
import Entity.Citizen;
import Entity.Files;
import Entity.InvitationToBid;
import Entity.Project;
import Entity.Schedule;
import Entity.Testimonial;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Krist
 */
@WebServlet(name = "BAC_UploadInvitationToBid", urlPatterns = {"/BAC_UploadInvitationToBid"})
public class BAC_UploadInvitationToBid extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");

        try {

            InputStream inputStream = null;

            String category = null;

            ArrayList<String> files = new ArrayList<String>();
            String id2 = "";

            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if (isMultipart) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                try {
                    //ArrayList<String> 

                    List items = upload.parseRequest(request);
                    Iterator iterator = items.iterator();

                    String id = null;
                    String title = null;

                    File path = null;
                    File uploadedFiles = null;
                    String fileName = null;

                    while (iterator.hasNext()) {
                        FileItem item = (FileItem) iterator.next();

                        if (item.isFormField()) {

                            //Returns the string inside the field
                            String value = item.getString();
                            //returns the name of the field
                            String value2 = item.getFieldName();

                            if (value2.equals("projectId")) {
                                id = value;
                                id2 = value;
                            }
                            if (value2.equals("projectName")) {
                                title = value;
                            }

                        }

                        if (!item.isFormField()) {
                            fileName = item.getName();
                            String root = getServletContext().getRealPath("/");

                            //path where the file will be stored
                            path = new File("D:\\Development\\NetBeans\\Projects\\CogitoFinal\\Upload" + "/Bids and Awards Department" + "/Invitations to bid" + "/" + title + " invitation");
                            if (!path.exists()) {
                                boolean status = path.mkdirs();
                            }

                            uploadedFiles = new File(path + "/" + fileName);
                            item.write(uploadedFiles);
                            files.add(fileName);

                        }
                    }

                    BACDAO bacdao = new BACDAO();
                    Project project = bacdao.getProjectInfo(id);

                    bacdao.changeBACStatus1(id);

                    InvitationToBid invite = new InvitationToBid(0, fileName, null, project, "chrome-extension://ckccpjpbccmlnbpdgdnelhddmgbjhfab/" + "Bids and Awards Department" + "/Invitations to bid" + "/" + title + " invitation");
                    bacdao.uploadInvitation(invite);

                } catch (FileUploadException e) {
                    e.printStackTrace();
                } catch (Exception ex) {
                    Logger.getLogger(BAC_UploadInvitationToBid.class.getName()).log(Level.SEVERE, null, ex);
                }

            }

            AdjustSchedule as = new AdjustSchedule();
            Schedule ev = as.getSchedDetails("Post Invitation to bid", "Pending", id2);
            as.updateSchedule(ev);
            as.updateScheduleStatus(ev, "Done");
            ev = as.getSchedDetails("Pre-procurement Conference", id2);
            if (ev.getStatus().equalsIgnoreCase("Pending")) {
                as.updateSchedule(ev);
                as.updateScheduleStatus(ev, "Done");
            }

            request.setAttribute("success", "Success");
            ServletContext context = getServletContext();
            RequestDispatcher dispatch = context.getRequestDispatcher("/BAC_Home");
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(BAC_UploadInvitationToBid.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(BAC_UploadInvitationToBid.class.getName()).log(Level.SEVERE, null, ex);
        }
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
