package org.hospital.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.DocerModel.*;
import org.hospital.repository.PrescriptionRepository;
import org.hospital.repository.PrescriptionRepositoryImpl;
import org.hospital.service.*;

@WebServlet("/PrescriptionController")
public class PrescriptionController extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String prescriptionDetails = request.getParameter("prescription_details");
        int ptid = Integer.parseInt(request.getParameter("ptid"));
        int did = Integer.parseInt(request.getParameter("did"));

        PrescriptionModel prescription = new PrescriptionModel();
        prescription.setPrescriptionDetails(prescriptionDetails);
        prescription.setPtid(ptid);
        prescription.setDocid(did);

       PrescriptionService prescriptionService = new PrescriptionServiceImpl();
        boolean success = prescriptionService.allocatePrescriptionToPatient(prescription);

        out.println("<html><head><title>Add Prescription</title></head><body>");

        if (success) {
            // Forward the request with prescription details to Prescription.jsp
            request.setAttribute("prescriptionId", prescription.getPrescriptionId());
            request.setAttribute("prescriptionDetails", prescription.getPrescriptionDetails());
            request.setAttribute("patientId", prescription.getPtid());
            request.setAttribute("doctorId", prescription.getDocid());

            RequestDispatcher rs = request.getRequestDispatcher("MainDocter.jsp");
            rs.include(request, response);
            out.println("<center><h1>Add Prescription Success</h1></center>");
        } else {
            // Forward the request back to AddPatient.jsp if adding prescription fails
            RequestDispatcher rs = request.getRequestDispatcher("Main.jsp");
            rs.include(request, response);
            out.println("<center><h1>Add Prescription Failed</h1></center>");
        }

        out.println("</body></html>");
    }
}
