package org.hospital.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hospital.service.DocterUserpassService;
import org.hospital.service.DocterUserpassServiceImpl;

@WebServlet("/DocterLoginFromController")
public class DocterLoginFromController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DocterUserpassService  docterUserpassService = new DocterUserpassServiceImpl();

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String docusername = request.getParameter("docusername");
        String docpassword = request.getParameter("docpassword");
        


        boolean isvaliduser = docterUserpassService.validateUserCredentials(docusername, docpassword);

        if (isvaliduser) {
            HttpSession session = request.getSession();
            session.setAttribute("docusername", docusername);
            session.setAttribute("docpassword", docpassword);

            response.sendRedirect("MainDocter.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid credentials. Please try again.");
            request.getRequestDispatcher("new.jsp").forward(request, response);
        }

    }
        

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
