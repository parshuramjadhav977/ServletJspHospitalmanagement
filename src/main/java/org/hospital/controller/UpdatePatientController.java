package org.hospital.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/updpatient")
public class UpdatePatientController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String ptName = request.getParameter("ptname");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");
        String opdDate = request.getParameter("opddate");
        int did = Integer.parseInt(request.getParameter("did"));
        Double fess=Double.parseDouble(request.getParameter("fess"));

        String appoinmentdate = request.getParameter("appoinmentdate");
        String category = request.getParameter("category");

        int ptid = 0;
        try {
            String ptidParam = request.getParameter("ptid");
            if (ptidParam == null || ptidParam.isEmpty()) {
                throw new IllegalArgumentException("Patient ID is missing");
            }
            ptid = Integer.parseInt(ptidParam);
        } catch (NumberFormatException e) {
            out.println("<h1>Error: Invalid Patient ID</h1>");
            return;
        } catch (IllegalArgumentException e) {
            out.println("<h1>Error: " + e.getMessage() + "</h1>");
            return;
        }

        RequestDispatcher r = request.getRequestDispatcher("Main.jsp");
        r.include(request, response);
        
        out.println("<div class='container mt-5'>");
        out.println("<div class='row justify-content-center'>");
        out.println("<div class='col-md-6'>");
        out.println("<div class='card shadow'>");
        out.println("<div class='card-body'>");
        out.println("<h2 class='card-title text-center mb-4'>Update Patient Details</h2>");


        out.println("<form class='formarea' name ='frm' action='finalpatient' method='POST'>");
        out.println("<input type='hidden' name='ptid' value='" + ptid + "' class ='control'/><br></br>");
            
            
        out.println("<input type='text' name='ptname' value='" + ptName + "' class ='control' placeholder='Patient Name'/><br></br>");
        out.println("<input type='number' name='age' value='" + age + "' class ='control' placeholder='Age'/><br></br>");
        out.println("<input type='text' name='gender' value='" + gender + "' class ='control' placeholder='Gender'/><br></br>");
        out.println("<input type='text' name='contact' value='" + contact + "' class ='control' placeholder='Contact'/><br></br>");
        out.println("<input type='text' name='address' value='" + address + "' class ='control' placeholder='Address'/><br></br>");
        out.println("<input type='text' name='opddate' value='" + opdDate + "' class ='control' placeholder='OPD Date'/><br></br>");
        out.println("<input type='number' name='did' value='" + did + "' class ='control' placeholder='Doctor ID'/><br></br>");
        out.println("<input type='number' name='fess' value='" + fess + "' class ='control'/><br></br>");
        out.println("<input type='text' name='appoinmentdate' value='" + appoinmentdate + "' class ='control' placeholder='Appointment Date'/><br></br>");
        out.println("<input type='text' name='category' value='" + category + "' class ='control' placeholder='Category'/><br></br>");

        out.println("<input type='submit' name='s' value='Update Patient' class ='control'/>");
        out.println("</form>");
        out.println("</div>");
        out.println("</div>");
        out.println("</div>");
        out.println("</div>");
        out.println("</div>");


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
