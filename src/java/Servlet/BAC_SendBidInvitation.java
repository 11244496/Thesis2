/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.BACDAO;
import DAO.OCPDDAO;
import Entity.Contractor;
import Entity.Contractor_Has_Project;
import Entity.Eligibility_Document;
import Entity.InvitationToBid;
import Entity.Project;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import json.JSONArray;
import json.JSONObject;

/**
 *
 * @author RoAnn
 */
public class BAC_SendBidInvitation extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            BACDAO bac = new BACDAO();
            String projid = request.getParameter("projId");
            OCPDDAO oc = new OCPDDAO();
            Project p = oc.getProjectDetails(projid);

            if (!p.getStatus().equalsIgnoreCase("For Negotiation")) {
                ArrayList<Contractor_Has_Project> contractors = bac.getViewRespondents(projid);
                Contractor_Has_Project chp2;
                ArrayList<Eligibility_Document> eds;
                for (int x = 0; x < contractors.size(); x++) {
                    eds = bac.getEligibilityDocuments(contractors.get(x).getID());
                    chp2 = new Contractor_Has_Project();
                    chp2.setID(contractors.get(x).getID());
                    bac.removeContractor(eds, chp2);
                }
            }

            int itbId = Integer.parseInt(request.getParameter("itbId"));
            InvitationToBid itb = new InvitationToBid();
            itb.setID(itbId);
            itb.setStatus("Negotiated");
            String reason = request.getParameter("messageN");
            oc.changeProjStatus("For Negotiation", p);
            bac.addReasonFail(reason, itb);

            ArrayList<Integer> conId = new ArrayList<>();
            JSONArray ids = new JSONArray(request.getParameter("contractor"));
            for (Object obj : ids) {
                conId.add(Integer.parseInt((String) obj));
            }

            Contractor_Has_Project chp;
            Contractor c;
            for (int x = 0; x < conId.size(); x++) {
                chp = new Contractor_Has_Project();
                chp.setProject(p);
                c = new Contractor();
                c.setID(conId.get(x));
                chp.setContractor(c);
                chp.setStatus("Invited");
                bac.addContractorHasProject(chp);
            }

            JSONObject obj = new JSONObject();
            String url = "BAC_Home";
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
