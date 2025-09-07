package com.SAS.DAO;

import com.SAS.DAO.GetImageServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ListImagesServlet")
public class ListImagesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> imageNames = GetImageServlet.getAllImageNames();
        request.setAttribute("images", imageNames);
        request.getRequestDispatcher("displayImages.jsp").forward(request, response);
    }
}
