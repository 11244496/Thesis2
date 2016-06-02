/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.AdjustSchedule;
import DAO.GSDAO;
import DAO.OCPDDAO;
import Entity.Component;
import Entity.Employee;
import Entity.Files;
import Entity.Location;
import Entity.Material;
import Entity.Project;
import Entity.Schedule;
import Entity.Task;
import Entity.Testimonial;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import json.JSONArray;
import json.JSONObject;

/**
 *
 * @author RoAnn
 */
public class GS_EditProposal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            GSDAO gs = new GSDAO();
            OCPDDAO oc = new OCPDDAO();

//==========DETAILS=============DETAILS===============DETAILS===========DETAILS===========//
            //project name, description, category, subcategory, target implementation
            Project origProj = (Project) session.getAttribute("project");
            Project newProj = new Project();
            newProj.setName(request.getParameter("projectname"));
            newProj.setDescription(request.getParameter("projectdescription"));
            newProj.setType(request.getParameter("category"));
            newProj.setStatus("On-Hold");
            newProj.setCategory(gs.getSubCategory(request.getParameter("subcategory")));
            newProj.setId(request.getParameter("projectid"));
            gs.editProjectDetails(newProj);

//=========LOCATION============LOCATION==============LOCATION==========LOCATION===========//
            ArrayList<Location> origLocation = origProj.getLocation();
            ArrayList<Location> newLocation = new ArrayList<>();

            String allposition = request.getParameter("hiddenlocation");
            String[] location = allposition.split(",");
            ArrayList<String> longitude = new ArrayList<String>();
            ArrayList<String> latitude = new ArrayList<String>();

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
                newLocation.add(l);
            }
            newProj.setLocation(newLocation);

//=========MATERIALS===========MATERIALS=============MATERIALS=========MATERIALS===========//
            ArrayList<Material> origMaterial = origProj.getMaterials();
            ArrayList<Material> newMaterial = new ArrayList<>();

            JSONArray materialstable = new JSONArray(request.getParameter("materialvalues"));
            for (Object obj : materialstable) {
                JSONObject materialjson = new JSONObject(obj.toString());
                Material material = new Material(0, materialjson.getString("material"),
                        Integer.parseInt(materialjson.getString("quantity")),
                        Float.parseFloat(materialjson.getString("unitprice")),
                        newProj,
                        gs.getUnit(materialjson.getString("unit")),
                        newProj.getCategory(),
                        null,
                        Float.parseFloat(materialjson.getString("percentage")));
                newMaterial.add(material);
            }
            newProj.setMaterials(newMaterial);
////=========COMPONENT============COMPONENT==============COMPONENT==========COMPONENT===========//
            ArrayList<Component> origComponent = origProj.getComponents();
            ArrayList<Component> newComponent = new ArrayList<>();

            JSONArray componentvalues = new JSONArray(request.getParameter("componentvalues"));
            for (Object obj : componentvalues) {
                JSONObject componentjson = new JSONObject(obj.toString());
                Component component = new Component(0,
                        componentjson.getString("component"),
                        componentjson.getString("duration"),
                        componentjson.getString("unit"),
                        newProj);
                newComponent.add(component);
            }
            newProj.setComponents(newComponent);

////=========SCHEDULE============SCHEDULE==============SCHEDULE==========SCHEDULE===========//
            ArrayList<Schedule> origSchedule = origProj.getSchedule();
            ArrayList<Schedule> newSchedule = new ArrayList<>();
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
                newSchedule.add(sched);
            }

            newProj.setSchedule(newSchedule);
//==========UPLOAD==============UPLOAD================UPLOAD============UPLOAD===========//
            ArrayList<Files> origFiles = origProj.getFiles();
            ArrayList<Files> newFiles = new ArrayList<>();

            JSONArray tfilevalues = new JSONArray(request.getParameter("tfilevalues"));
            for (Object obj : tfilevalues) {
                newFiles.add(gs.setcitizenfiles(Integer.valueOf((String) obj), newProj));
            }
            newProj.setFiles(newFiles);

            gs.editProjectDetails(newProj);

            for (Location l : origProj.getLocation()) {
                gs.editLocation("delete", l, origProj);
            }
            for (Location l : newProj.getLocation()) {
                gs.editLocation("add", l, newProj);
            }
            for (Component c : origProj.getComponents()) {
                gs.editComponents("delete", c, origProj);
            }
            for (Component c : newProj.getComponents()) {
                gs.editComponents("add", c, newProj);
            }
            
            for(int x = 0; x < origProj.getSchedule().size();x++){
                Schedule s = origProj.getSchedule().get(x);
                
                if (s.getStatus().equalsIgnoreCase("Pending")){
                    if (s.getEvent().equalsIgnoreCase("Meeting with OCPD")){
                        x++;
                    }
                    else {
                         gs.editSchedule("delete", s, origProj);
                    }
                }
            }
            
            for(int x = 0; x < newProj.getSchedule().size();x++){
                Schedule s = newProj.getSchedule().get(x);
                
                if (s.getStatus().equalsIgnoreCase("Pending")){
                    if (s.getEvent().equalsIgnoreCase("Meeting with OCPD")){
                        x++;
                    }
                    else {
                         gs.editSchedule("add", s, newProj);
                    }
                }
            }
          
            for (Material m : origMaterial) {
                gs.editMaterials("delete", m, origProj);
            }
            for (int x = 0; x < newProj.getMaterials().size(); x++) {
                if (gs.CompareMaterials(newProj.getMaterials().get(x), newProj) != null) {
                    gs.setProjectMaterials(gs.CompareMaterials(newProj.getMaterials().get(x), newProj), newProj, newProj.getMaterials().get(x).getQuantity(), newProj.getMaterials().get(x).getPercentage());
                } else {
                    //add new material
                    gs.addnewmaterial(newProj.getMaterials().get(x), newProj);
                    //add in project has materials the newly added material
                    gs.setProjectMaterials(gs.getMaterialbyid(gs.getLastMaterialID(), newProj), newProj, newProj.getMaterials().get(x).getQuantity(), newProj.getMaterials().get(x).getPercentage());
                }
            }

            for (int x = 0; x < origProj.getFiles().size(); x++) {
                origProj.getFiles().get(x).setProject(null);
                gs.setProjFilesNull(origProj.getFiles().get(x));
            }

            for (int x = 0; x < newProj.getFiles().size(); x++) {
                gs.updateCTFiles(newProj.getFiles().get(x), newProj);
            }


            oc.changeProjStatus("Pending", newProj);

            gs.editAnnotationStat(origProj.getAnnotations(), "Done");
            AdjustSchedule as = new AdjustSchedule();
            
            Schedule edit = as.getSchedDetails("Edit Proposal", "Pending", newProj.getId());
            as.updateSchedule(edit);
            newProj = oc.getProjectDetails(newProj.getId());
            as.adjust(edit, newProj.getSchedule());

            JSONObject obj = new JSONObject();
            String url = "GS_ViewProjectDetails?projid=" + newProj.getId();
            obj.put("url", url);
            response.getWriter().write(obj.toString());
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
            Logger.getLogger(GS_EditProposal.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(GS_EditProposal.class.getName()).log(Level.SEVERE, null, ex);
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
