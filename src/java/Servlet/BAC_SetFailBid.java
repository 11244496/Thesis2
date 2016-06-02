/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.AdjustSchedule;
import java.io.IOException;
import DAO.BACDAO;
import DAO.OCPDDAO;
import Entity.Contractor_Has_Project;
import Entity.Eligibility_Document;
import Entity.InvitationToBid;
import Entity.Project;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author RoAnn
 */
public class BAC_SetFailBid extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            BACDAO bac = new BACDAO();
            int itbId = Integer.parseInt(request.getParameter("itbId"));
            InvitationToBid itb = new InvitationToBid();
            itb.setID(itbId);
            itb.setStatus("Fail");
            String projid = request.getParameter("projId");
            OCPDDAO oc = new OCPDDAO();
            Project p = oc.getProjectDetails(projid);
            String reason = request.getParameter("failReason");
            String start = request.getParameter("failStart");
            oc.changeProjStatus("BAC", p);
            AdjustSchedule as = new AdjustSchedule();
            as.reschedITB(p.getSchedule(), start);
            bac.addReasonFail(reason, itb);

            ArrayList<Contractor_Has_Project> contractors = bac.getViewRespondents(projid);
            Contractor_Has_Project chp;
            ArrayList<Eligibility_Document> eds;
            for (int x = 0; x < contractors.size(); x++) {
                eds = bac.getEligibilityDocuments(contractors.get(x).getID());
                chp = new Contractor_Has_Project();
                chp.setID(contractors.get(x).getID());
                bac.removeContractor(eds, chp);
            }

            
            ServletContext context = getServletContext();
            RequestDispatcher dispatch = context.getRequestDispatcher("/BAC_Home");
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(BAC_SetFailBid.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(BAC_SetFailBid.class.getName()).log(Level.SEVERE, null, ex);
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
