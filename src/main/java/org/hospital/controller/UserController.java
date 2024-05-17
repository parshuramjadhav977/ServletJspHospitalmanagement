package org.hospital.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.DocerModel.UserModel;
import org.hospital.service.UserService;
import org.hospital.service.UserServiceImpl;
import org.hospital.repository.*;


@WebServlet("/user")
public class UserController extends HttpServlet {
	UserService userService=new UserServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String username =request.getParameter("username"); 
		String password=request.getParameter("password");
		UserModel user = new UserModel();
		user.setUsername(username);
		user.setPassword(password);

		
        boolean isValiduser = userService.isAddnewuser(user);
if(isValiduser)
{
	out.println("<h1>User Added Successfully..</h1>");
}
else
{
	out.println("<h1>some problem is there ...</h1>");

}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
