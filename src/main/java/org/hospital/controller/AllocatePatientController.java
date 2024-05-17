package org.hospital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.DocerModel.*;
import org.hospital.service.*;

@WebServlet("/AllocatePatientController")
public class AllocatePatientController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Retrieve list of allocated patients from service layer
	    AllocatePatientService allocatePatientService = new AllocatePatientServiceImpl();
	    List<AllocatePatientModel> allocatedPatients = allocatePatientService.getAllAllocatedPatients();

	    request.setAttribute("allocatedPatients", allocatedPatients);

	    request.getRequestDispatcher("/viewAllocatedPatients.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
