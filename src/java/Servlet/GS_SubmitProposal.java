/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.GSDAO;
import DAO.LoginDAO;
import DAO.NotificationDAO;
import Entity.Category;
import Entity.Component;
import Entity.Employee;
import Entity.Files;
import Entity.Location;
import Entity.Material;
import Entity.Notification;
import Entity.Project;
import Entity.Resources;
import Entity.Schedule;
import Entity.SubCategory;
import Entity.Task;
import Entity.Unit;
import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import json.JSONArray;
import json.JSONObject;

/**
 *
 * @author Lenovo
 */
public class GS_SubmitProposal extends HttpServlet {

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

        GSDAO gdao = new GSDAO();
        String action = request.getParameter("actionI");

        NotificationDAO ntDAO = new NotificationDAO();
        LoginDAO ldao = new LoginDAO();
        //===================================Initialize all arraylists===============================================
        Employee e = (Employee) session.getAttribute("user");
        ArrayList<String> longitude = new ArrayList<String>();
        ArrayList<String> latitude = new ArrayList<String>();
        ArrayList<Location> alllocation = new ArrayList<Location>();
        ArrayList<Material> allmaterials = new ArrayList<Material>();
        ArrayList<Schedule> allschedule = new ArrayList<Schedule>();
        ArrayList<Component> allcomponent = new ArrayList<Component>();
        ArrayList<Files> allfiles = new ArrayList<Files>();

        //===================================Set Basic Project Information===========================================
        Project p = new Project();

        p.setId(request.getParameter("projectid"));
        p.setName(request.getParameter("projectname"));
        p.setDescription(request.getParameter("projectdescription"));
        p.setType(request.getParameter("category"));

        SubCategory sc = new SubCategory();

        if (gdao.getSubCategory(request.getParameter("subcategory")) == null) {
            //Add the new category
            Category c = gdao.getCategory(request.getParameter("category"));
            sc.setSubCategory(request.getParameter("subcategory"));
            sc.setCategory(c);
            gdao.addnewSubCategory(sc);

            p.setCategory(gdao.getSubCategory(request.getParameter("subcategory")));

            //Get the new category and set it sa subcategory
        } else {
            sc = gdao.getSubCategory(request.getParameter("subcategory"));
            p.setCategory(sc);
        }

        if (action.equalsIgnoreCase("finish")) {
            p.setStatus("Pending");
        } else if (action.equalsIgnoreCase("draft")) {
            p.setStatus("Draft");
        }
        p.setEmployee(e);

        //===================================Set Location===============================================
        String allposition = request.getParameter("hiddenlocation");
        String[] location = allposition.split(",");

        for (int x = 0; x < location.length; x++) {
            String[] latlong = location[x].split("&");
            String thislat = latlong[0];
            String thislong = latlong[1];
            longitude.add(thislong);
            latitude.add(thislat);
        }

        for (int x = 0; x < location.length; x++) {
            Location l = new Location();
            l.setLongs(longitude.get(x));
            l.setLats(latitude.get(x));

            alllocation.add(l);
        }

        p.setLocation(alllocation);

        //Materials
        JSONArray materialstable = new JSONArray(request.getParameter("materialvalues"));
        for (Object obj : materialstable) {
            JSONObject materialjson = new JSONObject(obj.toString());
            Material material = new Material(0, materialjson.getString("material"),
                    Integer.parseInt(materialjson.getString("quantity")),
                    (float) materialjson.getInt("unitprice"),
                    p,
                    gdao.getUnit(materialjson.getString("unit")),
                    p.getCategory(),
                    null,
                    Float.parseFloat(materialjson.getString("percentage")));
            allmaterials.add(material);
        }
        p.setMaterials(allmaterials);

        //===================================Set Components===============================================
        JSONArray componentvalues = new JSONArray(request.getParameter("componentvalues"));
        for (Object obj : componentvalues) {
            JSONObject componentjson = new JSONObject(obj.toString());
            Component component = new Component(0,
                    componentjson.getString("component"),
                    componentjson.getString("duration"),
                    componentjson.getString("unit"),
                    p);
            allcomponent.add(component);
        }
        p.setComponents(allcomponent);

        //===================================Set Schedule===============================================
        JSONArray eventvalues = new JSONArray(request.getParameter("eventvalues"));
        for (Object obj : eventvalues) {
            JSONObject schedulejson = new JSONObject(obj.toString());
            Schedule sched = new Schedule(0,
                    schedulejson.getString("title"),
                    schedulejson.getString("start"),
                    schedulejson.getString("end"),
                    schedulejson.getString("status"),
                    schedulejson.getString("dept"),
                    schedulejson.getString("stage"));
            allschedule.add(sched);
        }

//        //Set the task to the schedule
//        ArrayList<Task> everytask = null;
//        for (int x = 0; x < allschedule.size(); x++) {
//            everytask = new ArrayList<Task>();
//            for (int y = 0; y < alltask.size(); y++) {
//                if (allschedule.get(x).getEvent().equalsIgnoreCase(alltask.get(y).getSchedule())) {
//                    everytask.add(alltask.get(y));
//                }
//            }
//            allschedule.get(x).setTasks(everytask);
//        }
        p.setSchedule(allschedule);

        //===================================Set Files===============================================
        JSONArray tfilevalues = new JSONArray(request.getParameter("tfilevalues"));
        for (Object obj : tfilevalues) {
            allfiles.add(gdao.setcitizenfiles(Integer.valueOf((String) obj), p));
        }
        p.setFiles(allfiles);

        //Submit all the easy inserts
        gdao.submitproject(p);

        //Submit all the compare and insert in new table inserts
        //Set Schedule Tasks based on schedule arraylist that was recently added
//        ArrayList<Schedule> recentlyaddedsched = gdao.getprojectSchedule(p);
//        for (int x = 0; x < p.getSchedule().size(); x++) {
//            for (int z = 0; z < p.getSchedule().get(x).getTasks().size(); z++) {
//                for (int y = 0; y < recentlyaddedsched.size(); y++) {
//                    if (p.getSchedule().get(x).getTasks().get(z).getSchedule().equalsIgnoreCase(recentlyaddedsched.get(y).getEvent())) {
//                        gdao.setScheduleTask(p.getSchedule().get(x).getTasks().get(z), recentlyaddedsched.get(y));
//                    }
//                }
//            }
//        }
        //Set Category
        gdao.setSubCategory(p, p.getCategory());

        //get update Project_ID from files based on ID
//        for (int x = 0; x < p.getFiles().size(); x++) {
//            gdao.updateCTFiles(p.getFiles().get(x), p);
//
//            gdao.setTestimonialProject(p, p.getFiles().get(x).getTestimonial().getId());
//
//            //Notification
//            ntDAO.addNotification(new Notification(0, e.getFirstName() + " " + e.getLastName() + " has used your file entitled " + p.getFiles().get(x).getFileName() + " in project entitled " + p.getName(), null, ldao.getUser(p.getFiles().get(x).getUploader())));
//        }

        //Get Current List of Materials, Compare and if same add sa table
        for (int x = 0; x < p.getMaterials().size(); x++) {
            if (gdao.CompareMaterials(p.getMaterials().get(x), p) != null) {
                gdao.setProjectMaterials(gdao.CompareMaterials(p.getMaterials().get(x), p), p, p.getMaterials().get(x).getQuantity(), p.getMaterials().get(x).getPercentage());
            } else {
                //add new material
                gdao.addnewmaterial(p.getMaterials().get(x), p);
                //add in project has materials the newly added material
                gdao.setProjectMaterials(gdao.getMaterialbyid(gdao.getLastMaterialID(), p), p, p.getMaterials().get(x).getQuantity(), p.getMaterials().get(x).getPercentage());
            }
        }


        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        ArrayList<Schedule> sList = gdao.getprojectSchedule(p);
        gdao.updateSchedule(sList.get(0), "Done");
        JSONObject jobj = new JSONObject();
        String urlToRedirect = "GS_ViewProjectDetails?projid=" + p.getId();
        jobj.put("url", urlToRedirect);
        response.getWriter().write(jobj.toString());

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
