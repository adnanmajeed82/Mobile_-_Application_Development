package com.example.demoapp;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/dashboard")
public class HelloServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        // Set sample data (can be fetched from DB later)
        request.setAttribute("studentName", "Mujeeb ur Rehman");
        request.setAttribute("courseName", "Mobile Application Development");

        // Forward the request to index.jsp (LMS page)
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

}
