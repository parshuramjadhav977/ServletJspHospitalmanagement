package org.hospital.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/upddocter")
public class UpdateDocterController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String docName = request.getParameter("docname");
        String speciality = request.getParameter("speciality");
        String designation = request.getParameter("designation");
        String degree = request.getParameter("degree");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");
        
        // Validate the 'did' parameter
        int did = 0;
        try {
            String didParam = request.getParameter("did");
            if (didParam == null || didParam.isEmpty()) {
                throw new IllegalArgumentException("Doctor ID is missing");
            }
            did = Integer.parseInt(didParam);
        } catch (NumberFormatException e) {
            // Handle the case where 'did' parameter is not a valid integer
            out.println("<h1>Error: Invalid doctor ID</h1>");
            return; // Stop further processing
        } catch (IllegalArgumentException e) {
            // Handle the case where 'did' parameter is missing
            out.println("<h1>Error: " + e.getMessage() + "</h1>");
            return; // Stop further processing
        }

        // Forward request to the Main.jsp page
        RequestDispatcher r = request.getRequestDispatcher("Main.jsp");
        r.include(request, response);
        
        // Display form for updating doctor
        out.println("<div class='col py-3' style='height: 200px; width: 400px; border-radius: 10px;'>");
        out.println("<form class='formarea' name ='frm' action='finaldocterupdate' method='POST'>");
        out.println("<input type='hidden' name='did' value='" + did + "' class ='control'/><br></br>");
        out.println("<input type='text' name='docname' value='" + docName + "' class ='control'/><br></br>");
        
        out.println("<input type='text' name='speciality' value='" + speciality + "' class ='control'/><br></br>");
        out.println("<input type='text' name='designation' value='" + designation + "' class ='control'/><br></br>");
        out.println("<input type='text' name='degree' value='" + degree + "' class ='control'/><br></br>");
        out.println("<input type='text' name='contact' value='" + contact + "' class ='control'/><br></br>");
        out.println("<input type='text' name='address' value='" + address + "' class ='control'/><br></br>");
        
        out.println("<input type ='submit' name='s' value='Update doctor' class ='control'/>");
        out.println("</form>");
        out.println("</div></div></div>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
