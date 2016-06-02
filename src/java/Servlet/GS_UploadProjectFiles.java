/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.GSDAO;
import DAO.OCPDDAO;
import Entity.Employee;
import Entity.Files;
import Entity.Testimonial;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;
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
 * @author Lenovo
 */
public class GS_UploadProjectFiles extends HttpServlet {

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
        Employee e = (Employee) session.getAttribute("user");
        ArrayList<Files> files = new ArrayList<Files>();
        ArrayList<String> filesString = new ArrayList<String>();

        try {

            GSDAO gsDAO = new GSDAO();
            OCPDDAO ocpdDAO = new OCPDDAO();

            String projectID = null;
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            if (isMultipart) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                try {
                    List items = upload.parseRequest(request);
                    Iterator iterator = items.iterator();
                    String testimonialID = null;
                    File uploadedFile = null;
                    String fileName = null;
                    while (iterator.hasNext()) {
                        FileItem item = (FileItem) iterator.next();

                        if (item.isFormField()) {

                            //Returns the string inside the field
                            String value = item.getString();

                            //returns the name of the field
                            String value2 = item.getFieldName();

                            if (value2.equals("projectid")) {
                                projectID = value;
                            }

                            if (value2.equals("testimonialID")) {
                                testimonialID = value;
                            }

                        }

                        if (!item.isFormField()) {

                            fileName = item.getName();
                            String root = getServletContext().getRealPath("/");

                            //path where the file will be stored
                            File path = new File("D:\\Development\\NetBeans\\Projects\\CogitoFinal\\Upload" + "/Engineering Department/" + projectID);
                            if (!path.exists()) {
                                boolean status = path.mkdirs();
                            }

                            uploadedFile = new File(path + "/" + fileName);
                            item.write(uploadedFile);
                            filesString.add(fileName);
                        }
                    }

                    //Set the files based on the filestring
                    for (int x = 0; x < filesString.size(); x++) {

                        String filename = filesString.get(x);
                        if (!filename.isEmpty()) {

                            String[] parts = filename.split(Pattern.quote("."));
                            String extension = parts[1];
                            //Videos
                            if (extension.equalsIgnoreCase("mp4") || extension.equalsIgnoreCase("avi") || extension.equalsIgnoreCase("3gp") || extension.equalsIgnoreCase("flv") || extension.equalsIgnoreCase("wmv") || extension.equalsIgnoreCase("mkv")) {
                                Files f = new Files();
                                f.setFileName(filesString.get(x));
                                f.setType("Video");
                                f.setStatus("Approved");
                                f.setUploader(e.getUser().getUsername());
                                f.setProject(ocpdDAO.getProjectDetails(projectID));
                                files.add(f);
                            } //Images
                            else if (extension.equalsIgnoreCase("png") || extension.equalsIgnoreCase("jpeg") || extension.equalsIgnoreCase("jpg") || extension.equalsIgnoreCase("bmp")) {
                                Files f = new Files();
                                f.setFileName(filesString.get(x));
                                f.setType("Image");
                                f.setStatus("Approved");
                                f.setUploader(e.getUser().getUsername());
                                f.setProject(ocpdDAO.getProjectDetails(projectID));
                                files.add(f);
                            } //Documents 
                            else if (extension.equalsIgnoreCase("pdf") || extension.equalsIgnoreCase("docx") || extension.equalsIgnoreCase("doc") || extension.equalsIgnoreCase("pptx") || extension.equalsIgnoreCase("txt") || extension.equalsIgnoreCase("xlsx")) {
                                Files f = new Files();
                                f.setFileName(filesString.get(x));
                                f.setType("Document");
                                f.setStatus("Approved");
                                f.setUploader(e.getUser().getUsername());
                                f.setProject(ocpdDAO.getProjectDetails(projectID));
                                files.add(f);
                            }

                        }
                    }

                    //Add the files in DB
                    for (int x = 0; x < files.size(); x++) {
                        gsDAO.addProjectFiles(files.get(x));
                    }

                    gsDAO.updateProjectFolderName(ocpdDAO.getProjectDetails(projectID), "chrome-extension://ckccpjpbccmlnbpdgdnelhddmgbjhfab/Engineering Department/" + projectID);

                } catch (FileUploadException x) {
                    x.printStackTrace();
                } catch (Exception x) {
                    x.printStackTrace();
                }

            }

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/GS_ViewProjectDetails?projid=" + projectID);
            rd.forward(request, response);

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
