/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.AdjustSchedule;
import DAO.BACDAO;
import DAO.OCPDDAO;
import Entity.Bid_Notices;
import Entity.Contractor;
import Entity.Contractor_Has_Project;
import Entity.InvitationToBid;
import Entity.Project;
import Entity.Schedule;
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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Krist
 */
@WebServlet(name = "BAC_UploadNotices", urlPatterns = {"/BAC_UploadNotices"})
public class BAC_UploadNotices extends HttpServlet {

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

        try {

            InputStream inputStream = null;

            String category = null;
            String idd = "";
            ArrayList<String> files = new ArrayList<String>();
            ArrayList<String> fileType = new ArrayList<String>();
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if (isMultipart) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                try {
                    //ArrayList<String> 

                    List items = upload.parseRequest(request);
                    Iterator iterator = items.iterator();

                    String id = null;
                    String contractorName = null;
                    int cont_has_proj_ID = 0;

                    String title = null;

                    File path = null;
                    File uploadedFiles = null;
                    String fileName = null;
                    String documentType = null;

                    while (iterator.hasNext()) {
                        FileItem item = (FileItem) iterator.next();

//                         <input type="hidden" name="projectId" value="<%=project.getId()%>" >
//                         <input type="hidden" name="projectName" value="<%=project.getName()%>"> 
//                         <input type="hidden" name="contProject" value="<%=contProject%>" >
//                         <input type="hidden" name="contractor" value="<%=contractor%>">
                        if (item.isFormField()) {

                            //Returns the string inside the field
                            String value = item.getString();
                            //returns the name of the field
                            String value2 = item.getFieldName();

                            if (value2.equals("projectId")) {
                                id = value;
                                idd = value;
                            }
                            if (value2.equals("projectName")) {
                                title = value;
                            }
                            if (value2.equals("contProject")) {
                                cont_has_proj_ID = Integer.parseInt(value);
                            }
                            if (value2.equals("contractor")) {
                                contractorName = value;
                            }

                        }

                        if (!item.isFormField()) {
                            fileName = item.getName();
                            String root = getServletContext().getRealPath("/");

                            String fieldname = item.getFieldName();
                            //Add the conditions here
                            if (fieldname.equalsIgnoreCase("Notice of award")) {

                                documentType = "Notice of award";

                            }
                            if (fieldname.equalsIgnoreCase("Notice to proceed")) {

                                documentType = "Notice to proceed";

                            }
                            fileType.add(documentType);

                            //path where the file will be stored
                            path = new File("D:\\Development\\NetBeans\\Projects\\CogitoFinal\\Upload" + "/Bids and Awards Department" + "/Bid Notices/" + title + "/" + contractorName);
                            if (!path.exists()) {
                                boolean status = path.mkdirs();
                            }

                            uploadedFiles = new File(path + "/" + fileName);
                            item.write(uploadedFiles);
                            files.add(fileName);

                        }
                    }

                    BACDAO bacdao = new BACDAO();
                    //CHANGE
                    Project project = bacdao.getProjectInfo(id);
                    int contractorIdd = bacdao.getContractorID(cont_has_proj_ID);
                    Contractor contractor = bacdao.getContractorInfo(contractorIdd);
                    bacdao.changeBACStatus4(bacdao.getContUser(contractorIdd), id);
                    bacdao.changeBACStatus5(cont_has_proj_ID);
                    ArrayList<Contractor_Has_Project> respondents = bacdao.getViewRespondents(id);
                    for (int x = 0; x < respondents.size(); x++) {
                        if (respondents.get(x).getID() == contractorIdd) {
                            respondents.remove(x);
                        }
                    }
                    for (int x = 0; x < respondents.size(); x++) {
                        bacdao.deleteContractorProj(respondents.get(x).getID());
                    }
                    //CHANGE
                    for (int x = 0; x < files.size(); x++) {
                        Bid_Notices bidnotice = new Bid_Notices(0, files.get(x), null, project, contractor, "chrome-extension://ckccpjpbccmlnbpdgdnelhddmgbjhfab/" + "Bids and Awards Department" + "/Bid Notices/" + title + "/" + contractorName, fileType.get(x));
                        bacdao.uploadBidNotices(bidnotice);
                    }

                } catch (FileUploadException e) {
                    e.printStackTrace();
                } catch (Exception ex) {
                    Logger.getLogger(BAC_UploadInvitationToBid.class.getName()).log(Level.SEVERE, null, ex);
                }

            }

            AdjustSchedule as = new AdjustSchedule();
            OCPDDAO oc = new OCPDDAO();
            Project p = oc.getProjectDetails(idd);
            ArrayList<Schedule> sList = p.getSchedule();

            for (Schedule s : sList) {
                if (!s.getStatus().equalsIgnoreCase("Done") && s.getStage().equalsIgnoreCase("Bidding")) {
                    as.updateBiddingStatus(s, "Done");
                    p = oc.getProjectDetails(idd);
                }
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
