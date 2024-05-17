package org.hospital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.DocerModel.PatientModel;
import org.hospital.service.PatientService;
import org.hospital.service.PatientServiceImpl;

@WebServlet("/searchpatient")
public class SearchPatientController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        
        if (keyword != null && !keyword.isEmpty()) {
            PatientService patientService = new PatientServiceImpl();
            List<PatientModel> searchResults = patientService.searchPatient(keyword);
            request.setAttribute("searchResults", searchResults);
        } else {
            // Handle case when keyword is not provided
            request.setAttribute("errorMessage", "Please provide a keyword for the search.");
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("searchResults2.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // If needed, implement separate logic for handling POST requests
        doGet(request, response);
    }
}
