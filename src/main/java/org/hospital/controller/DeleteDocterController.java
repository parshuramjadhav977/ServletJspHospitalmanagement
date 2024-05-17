package org.hospital.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hospital.service.Docterservice;
import org.hospital.service.DocterserviceImpl;

@WebServlet("/del")
public class DeleteDocterController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        int did = Integer.parseInt(request.getParameter("did"));
        Docterservice docterservice = new DocterserviceImpl();

        try {
            boolean deleted = docterservice.isDeleteDocterById(did);
            if (deleted) {
                RequestDispatcher r = request.getRequestDispatcher("viewDocter.jsp");
                r.forward(request, response);
            } else {
                out.println("<h1>Doctor with ID " + did + " could not be deleted.</h1>");
            }
        } catch (Exception ex) {
            // Log the exception for debugging
            ex.printStackTrace();
            out.println("<h1>An error occurred during deletion.</h1>");
            out.println("<p>Please check the logs for more information.</p>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
