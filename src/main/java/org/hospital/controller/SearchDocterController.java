package org.hospital.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.DocerModel.DocterModel;
import org.hospital.service.Docterservice;
import org.hospital.service.DocterserviceImpl;
import com.google.gson.Gson;

@WebServlet("/search")
public class SearchDocterController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        
        Docterservice docterservice = new DocterserviceImpl();
        
        List<DocterModel> searchResults = docterservice.searchDoctors(keyword);
        
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(searchResults);
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
