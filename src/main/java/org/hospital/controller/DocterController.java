package org.hospital.controller;

import java.io.IOException;


import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.DocerModel.DocterModel;
import org.hospital.service.Docterservice;
import org.hospital.service.DocterserviceImpl;

@WebServlet("/newdocter")
public class DocterController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String docName = request.getParameter("docname");
        String Speciality = request.getParameter("speciality");
        String Designation = request.getParameter("designation");
        String Degree = request.getParameter("degree");
        String Contact = request.getParameter("contact");
        String Address = request.getParameter("address");

        DocterModel model = new DocterModel();
        model.setName(docName);
        model.setSpeciality(Speciality);
        model.setDesigination(Designation);
        model.setDgree(Degree);
        model.setContact(Contact);
        model.setAddress(Address);

        Docterservice docterservice = new DocterserviceImpl();

        boolean b = docterservice.isAddDocterModel(model);

        out.println("<html><head><title>Add Doctor</title></head><body>");

        if (b) {
        	out.println("Doctor Added Successfully");
        	RequestDispatcher r=request.getRequestDispatcher("AddDocter.jsp");
        	r.forward(request, response);
        	
        } else {
        	 out.println("Not Added");
           
        }

        out.println("</body></html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

