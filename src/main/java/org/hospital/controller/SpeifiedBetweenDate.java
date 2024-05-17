package org.hospital.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
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

@WebServlet("/betweendate")
public class SpeifiedBetweenDate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");

        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = new Date(dateFormat.parse(startDateStr).getTime());
            Date endDate = new Date(dateFormat.parse(endDateStr).getTime());

            PatientService patientService = new PatientServiceImpl();
            List<PatientModel> patientsBetweenDates = patientService.getPatientsBetweenDates(startDate, endDate);

            request.setAttribute("patients", patientsBetweenDates);
        } catch (java.text.ParseException e) {
            // Handle invalid date format
            String errorMessage = "Invalid date format. Please enter the date in YYYY-MM-DD format.";
            request.setAttribute("errorMessage", errorMessage);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("datebetween.jsp");
        dispatcher.forward(request, response);
    }
}
