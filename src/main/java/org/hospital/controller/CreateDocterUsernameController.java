package org.hospital.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.DocerModel.DocterUserpass;
import org.hospital.repository.DocterUserpassImpl;
import org.hospital.service.DocterUserpassService;
import org.hospital.service.DocterUserpassServiceImpl;



@WebServlet("/docusername")
public class CreateDocterUsernameController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			
			String docusername =request.getParameter("docusername"); 
			String docpassword=request.getParameter("docpassword");
			int did =Integer.parseInt(request.getParameter("did"));
			DocterUserpass doc = new DocterUserpass();
			doc.setDocusername(docusername);
			doc.setDocpassword(docpassword);
			doc.setDid(did);
	        
			
			DocterUserpassService  docterUserpassService = new DocterUserpassServiceImpl();

			
	        boolean isAddDocterUserPass = docterUserpassService.isAddDocterUserpass(doc);
	if(isAddDocterUserPass)
	{
    	RequestDispatcher rs=request.getRequestDispatcher("CreateDocterLogin.jsp");
    	rs.include(request, response);
        out.println("<center> <h1>Add Docterlogin Success</h1> <center>");	}
	else
	{
    	RequestDispatcher rs=request.getRequestDispatcher("CreateDocterLogin.jsp.jsp");
    	rs.include(request, response);

        out.println("center> <h1> Login Failed</h1> <center>");
	}
				
		}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
