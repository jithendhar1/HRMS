package com.weblabs.srv;



import java.io.IOException;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.CreateProject;
import com.weblabs.service.impl.ProjectDAO;

@WebServlet("/projects")
public class ProjectServlet extends HttpServlet {
 private static final long serialVersionUID = 1L;

 protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     ProjectDAO projectDAO = new ProjectDAO();
     List<CreateProject> projectList = projectDAO.getAllProjects();

     request.setAttribute("projectList", projectList);
     request.getRequestDispatcher("projects.jsp").forward(request, response);
 }
}
