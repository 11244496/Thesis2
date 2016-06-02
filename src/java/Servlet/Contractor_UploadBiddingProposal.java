/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.BACDAO;
import DAO.ContractorDAO;
import DAO.OCPDDAO;
import Entity.Contractor;
import Entity.Contractor_Has_Project;
import Entity.Contractor_User;
import Entity.Eligibility_Document;
import Entity.InvitationToBid;
import Entity.Project;
import Entity.Schedule;
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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
public class Contractor_UploadBiddingProposal extends HttpServlet {

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

            InputStream inputStream = null;

            ArrayList<String> files = new ArrayList<String>();
            ArrayList<String> fileType = new ArrayList<String>();
            ContractorDAO contDAO = new ContractorDAO();

            //Gets the contractor
            Contractor_User contractor_user = (Contractor_User) session.getAttribute("user");
            Contractor contractor = contractor_user.getContractor();

            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if (isMultipart) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                try {

                    List items = upload.parseRequest(request);
                    Iterator iterator = items.iterator();

                    String id = null;
                    String title = null;
                    File path = null;

                    //File path = null;
                    File uploadedFiles = null;
                    String fileName = null;
                    String documentType = null;

                    while (iterator.hasNext()) {
                        FileItem item = (FileItem) iterator.next();
                        if (item.isFormField()) {

                            //Returns the string inside the field
                            String value = item.getString();
                            //returns the name of the field
                            String value2 = item.getFieldName();

                            if (value2.equals("projectId")) {
                                id = value;

                            }
                            if (value2.equals("projectName")) {
                                title = value;

                            }

                        }

                        if (!item.isFormField()) {
                            fileName = item.getName();
                            String root = getServletContext().getRealPath("/");
                            //path where the file will be stored
                            path = new File("D:\\Development\\NetBeans\\Projects\\CogitoFinal\\Upload" + "/Bids and Awards Department" + "/Eligibility Documents/" + title + "/" + contractor.getName());

                            if (!path.exists()) {
                                boolean status = path.mkdirs();
                            }

                            uploadedFiles = new File(path + "/" + fileName);
                            item.write(uploadedFiles);

                        }

                    }

                    Project project = contDAO.getProjectInfo(id);
                    Contractor_Has_Project contProject = contDAO.getContractorHasProject(project, contractor);
                    contDAO.updateConHasProject(contProject.getID());

                    Eligibility_Document document = new Eligibility_Document(0, fileName, "chrome-extension://ckccpjpbccmlnbpdgdnelhddmgbjhfab/" + "Bids and Awards Department" + "/Eligibility Documents/" + title + "/" + contractor.getName(), null, contProject, "Bidding Proposal", null, "");
                    contDAO.uploadEligibilityDocuments(document);

                } catch (FileUploadException e) {
                    e.printStackTrace();
                } catch (Exception ex) {
                    Logger.getLogger(Contractor_UploadContractorDocuments.class.getName()).log(Level.SEVERE, null, ex);
                }

            }

            request.setAttribute("success", "Success");
            ServletContext context = getServletContext();
            RequestDispatcher dispatch = context.getRequestDispatcher("/Contractor_HandleInvitations");
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
