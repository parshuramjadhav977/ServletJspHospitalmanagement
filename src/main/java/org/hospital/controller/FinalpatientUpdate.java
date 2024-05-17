package org.hospital.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.DocerModel.PatientModel;
import org.hospital.service.PatientService;
import org.hospital.service.PatientServiceImpl;


@WebServlet("/finalpatient")
public class FinalpatientUpdate extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        
            int ptid = Integer.parseInt(request.getParameter("ptid"));
            String ptName = request.getParameter("ptname");
            int age = Integer.parseInt(request.getParameter("age"));
            String gender = request.getParameter("gender");
            String contact = request.getParameter("contact");
            String address = request.getParameter("address");
            String opdDate = request.getParameter("opddate");
            int did = Integer.parseInt(request.getParameter("did"));
            Double fess = Double.parseDouble(request.getParameter("fess"));
            String appoinmentdate = request.getParameter("appoinmentdate");
            String category = request.getParameter("category");



            PatientModel model = new PatientModel();
            model.setPtid(ptid);
            model.setPtName(ptName);
            model.setAge(age);
            model.setGender(gender);
            model.setContact(contact);
            model.setAddress(address);
            model.setOpdDate(opdDate);
            model.setDid(did);
            model.setFess(fess);
            model.setAppointmentDate(appoinmentdate);
            model.setCategory(category);

            PatientService patientService = new PatientServiceImpl();
            boolean b = patientService.isUpdatePatient(model);


        
        
       		if (b) {
    			RequestDispatcher r = request.getRequestDispatcher("ViewPatient.jsp");
    			r.forward(request, response);

    		} else {
    			out.println("<h1> Machine Data Not updated </h1>");
    		}

    	}
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
