package org.hospital.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.*;
import java.text.DecimalFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.DocerModel.*;
import org.DocerModel.PatientModel.*;
import org.hospital.service.*;

@WebServlet("/newpatient")
public class PatientController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException, NumberFormatException {
	    response.setContentType("text/html");
	    PrintWriter out = response.getWriter();

	

		String ptName = request.getParameter("ptName");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String contact = request.getParameter("contact");
		String address = request.getParameter("address");
		String opdDate =request.getParameter("opdDate");
		int did = Integer.parseInt(request.getParameter("did"));
		Double fees = Double.parseDouble(request.getParameter("fees"));
		String appoinmentdate = request.getParameter("appointmentDate");
		String category = request.getParameter("category");

	        
	        PatientModel patient = new PatientModel();
	        patient.setPtName(ptName);
	        patient.setAge(age);
	        patient.setGender(gender);
	        patient.setContact(contact);

	        patient.setAddress(address);
	        patient.setOpdDate(opdDate);
	        patient.setDocid(did);
	        patient.setFess(fees);
	        patient.setAppointmentDate(appoinmentdate);
	        patient.setCategory(category);



	        PatientService patientService = new PatientServiceImpl();

	        boolean b = patientService.isAddPatient(patient);

	        out.println("<html><head><title>Add Patient</title></head><body>");

	        if (b) {
	        	RequestDispatcher rs=request.getRequestDispatcher("AddPatient.jsp");
	        	rs.include(request, response);
	            out.println("<center> <h1>Add Patient Success</h1> <center>");
	        	
	        	
	        	

	        } else {
	        	RequestDispatcher rs=request.getRequestDispatcher("AddPatient.jsp");
	        	rs.include(request, response);

	            out.println("center> <h1> Patient Failed</h1> <center>");
	        }

	    }
		

	

	  
	


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
























