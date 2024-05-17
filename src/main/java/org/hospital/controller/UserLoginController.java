package org.hospital.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hospital.service.UserService;
import org.hospital.service.UserServiceImpl;

@WebServlet("/UserLogin")
public class UserLoginController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    UserService userService = new UserServiceImpl();

	        response.setContentType("text/html");
	        PrintWriter out = response.getWriter();

	        String username = request.getParameter("username");
	        String password = request.getParameter("password");

	        boolean isvaliduser = userService.validateUserCredentials(username, password);

	        if (isvaliduser) {
	            HttpSession session = request.getSession();
	            session.setAttribute("username", username);
	            session.setAttribute("password", password);

	            response.sendRedirect("Main.jsp");
	        } else {
	            request.setAttribute("errorMessage", "Invalid credentials. Please try again.");
	            request.getRequestDispatcher("AddUserLogin.jsp").forward(request, response);
	        }

	    }
	        
	    

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
