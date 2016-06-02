/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.BACDAO;
import DAO.CitizenDAO;
import DAO.ContractorDAO;
import Entity.Contractor;
import Entity.Contractor_Has_Project;
import Entity.Contractor_User;
import Entity.Eligibility_Document;
import Entity.InvitationToBid;
import Entity.Project;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
 * @author Krist
 */
@WebServlet(name = "Contractor_UploadContractorDocuments", urlPatterns = {"/Contractor_UploadContractorDocuments"})
public class Contractor_UploadContractorDocuments extends HttpServlet {

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

                            if (value2.equals("ProjectID")) {
                                id = value;

                            }
                            if (value2.equals("ProjectName")) {
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
                            files.add(fileName);

                            String fieldname = item.getFieldName();
                            //Add the conditions here
                            if (fieldname.equalsIgnoreCase("SEC / DTI / CDA registration")) {

                                documentType = "SEC / DTI / CDA registration";

                            } else if (fieldname.equalsIgnoreCase("Mayor's permit")) {

                                documentType = "Mayor's permit";

                            } else if (fieldname.equalsIgnoreCase("On-going / Completed government and private contracts")) {

                                documentType = "On-going / Completed government and private contracts";

                            } else if (fieldname.equalsIgnoreCase("Income Tax Return (ITR)")) {

                                documentType = "Income Tax Return (ITR)";

                            } else if (fieldname.equalsIgnoreCase("Net financial contracting capacity")) {

                                documentType = "Net financial contracting capacity";

                            } else if (fieldname.equalsIgnoreCase("Cash, Cashier's / Manager's Check, Bank Draft / Guarantee")) {

                                documentType = "Cash, Cashier's / Manager's Check, Bank Draft / Guarantee";

                            } else if (fieldname.equalsIgnoreCase("Letter of credit")) {

                                documentType = "Letter of credit";

                            } else if (fieldname.equalsIgnoreCase("Surety bond")) {

                                documentType = "Surety bond";

                            } else if (fieldname.equalsIgnoreCase("Bid Security")) {

                                documentType = "Bid Security";

                            } else if (fieldname.equalsIgnoreCase("Authority of the signing official")) {

                                documentType = "Authority of the signing official";

                            } else if (fieldname.equalsIgnoreCase("Construction Schedule")) {

                                documentType = "Construction Schedule";

                            } else if (fieldname.equalsIgnoreCase("Manpower Schedule")) {

                                documentType = "Manpower Schedule";

                            } else if (fieldname.equalsIgnoreCase("Construction Methods")) {

                                documentType = "Construction Methods";

                            } else if (fieldname.equalsIgnoreCase("Organizational Chart")) {

                                documentType = "Organizational Chart";

                            } else if (fieldname.equalsIgnoreCase("Contractor Personnel list")) {

                                documentType = "Contractor Personnel list";

                            } else if (fieldname.equalsIgnoreCase("List of equipment owned")) {

                                documentType = "List of equipment owned";

                            } else if (fieldname.equalsIgnoreCase("Equipment Utilization Schedule")) {

                                documentType = "Equipment Utilization Schedule";

                            } else if (fieldname.equalsIgnoreCase("Affidavit of site Inspection")) {

                                documentType = "Affidavit of site Inspection";

                            } else if (fieldname.equalsIgnoreCase("Certificate of Non Blacklisted")) {

                                documentType = "Certificate of Non Blacklisted";

                            } else if (fieldname.equalsIgnoreCase("Construction Safety and Health Program")) {

                                documentType = "Construction Safety and Health Program";

                            } else if (fieldname.equalsIgnoreCase("Certificate of compliance with existing labor laws and standard")) {

                                documentType = "Certificate of compliance with existing labor laws and standard";

                            } else if (fieldname.equalsIgnoreCase("Omnibus Sworn")) {

                                documentType = "Omnibus Sworn";

                            }

                            fileType.add(documentType);

                        }

                    }

                    Project project = contDAO.getProjectInfo(id);
                    contDAO.addContractorHasProject(project, contractor);
                    Contractor_Has_Project contProject = contDAO.getContractorHasProject(project, contractor);

                    for (int x = 0; x < files.size(); x++) {
                        Eligibility_Document document = new Eligibility_Document(0, files.get(x), "chrome-extension://ckccpjpbccmlnbpdgdnelhddmgbjhfab/" + "Bids and Awards Department" + "/Eligibility Documents/" + title + "/" + contractor.getName(), null, contProject, fileType.get(x), null, "");
                        contDAO.uploadEligibilityDocuments(document);

                    }

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
