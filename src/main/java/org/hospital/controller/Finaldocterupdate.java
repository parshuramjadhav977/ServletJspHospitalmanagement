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
	import org.hospital.service.*;
	
	@WebServlet("/finaldocterupdate")
	public class Finaldocterupdate extends HttpServlet {
	    
	
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        
	        try {
	            int did = Integer.parseInt(request.getParameter("did"));
	            String docname = request.getParameter("docname");
	            String speciality = request.getParameter("speciality");
	            String designation = request.getParameter("designation");
	            String degree = request.getParameter("degree");
	            String contact = request.getParameter("contact");
	            String address = request.getParameter("address");
	
	            // Validate input parameters
	            if (docname == null || docname.isEmpty() || speciality == null || speciality.isEmpty() || 
	                designation == null || designation.isEmpty() || degree == null || degree.isEmpty() ||
	                contact == null || contact.isEmpty() || address == null || address.isEmpty()) {
	                throw new IllegalArgumentException("Invalid input parameters");
	            }
	
	            // Create DocterModel object
	            DocterModel model = new DocterModel();
	            model.setId(did);
	            model.setName(docname);
	            model.setSpeciality(speciality);
	            model.setDesigination(designation); 
	            model.setDgree(degree);
	            model.setContact(contact);
	            model.setAddress(address);
	
	            // Call service to update doctor
	            Docterservice docterservice = new DocterserviceImpl();
	            boolean b = docterservice.isUpdateDocter(model);
	
	            if (b) {
	                // Successful update
	                RequestDispatcher r = request.getRequestDispatcher("viewDocter.jsp");
	                r.forward(request, response);
	            } else {
	                // Failed to update
	                out.println("<h1> Doctor Data Not updated </h1>");
	            }
	        } catch (NumberFormatException e) {
	            // Handle invalid number format for doctor ID
	            out.println("<h1>Error: Invalid doctor ID</h1>");
	        } catch (IllegalArgumentException e) {
	            // Handle invalid input parameters
	            out.println("<h1>Error: " + e.getMessage() + "</h1>");
	        } catch (Exception e) {
	            // Handle other exceptions
	            out.println("<h1>Error: " + e.getMessage() + "</h1>");
	            e.printStackTrace(); // Print stack trace for debugging
	        }
	    }
	
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        doGet(request, response);
	    }
	}
