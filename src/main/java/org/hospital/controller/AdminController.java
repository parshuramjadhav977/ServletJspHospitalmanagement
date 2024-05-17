package org.hospital.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hospital.service.AdminService;
import org.hospital.service.AdminServiceImpl;

@WebServlet("/admin")
public class AdminController extends HttpServlet {

    private AdminService adminService = new AdminServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("adminUsername");
        String password = request.getParameter("adminPassword");

        boolean isValidAdmin = adminService.validateAdminCredentials(username, password);

        if (isValidAdmin) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("password", password);

            response.sendRedirect("Main.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid credentials. Please try again.");
            request.getRequestDispatcher("AddUserLogin.jsp").forward(request, response);
        }

    }
}
