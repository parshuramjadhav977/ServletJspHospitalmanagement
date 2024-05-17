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


@WebServlet("/deletePrescription")
public class DeletePrescriptions extends HttpServlet {
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        int Prescription_id = Integer.parseInt(request.getParameter("Prescription_id"));
       
        PrescriptionService prescriptionService = new PrescriptionServiceImpl();
        try {
            boolean deleted = prescriptionService.isDeletePrescriptionById(Prescription_id);
            if (deleted) {
                RequestDispatcher r = request.getRequestDispatcher("ViewPrescription.jsp");
                r.forward(request, response);
            } else {
                out.println("<h1>Prescription with ID " + Prescription_id + " could not be deleted.</h1>");
            }
        } catch (Exception ex) {
            // Log the exception for debugging
            ex.printStackTrace();
            out.println("<h1>An error occurred during deletion.</h1>");
            out.println("<p>Please check the logs for more information.</p>");
        }
    }
        
        


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
