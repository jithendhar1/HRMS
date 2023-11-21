package com.weblabs.srv;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weblabs.service.impl.Addempsalaryserviceimpl;
import com.weblabs.service.impl.EmployeeServiceImpl;

import javax.servlet.RequestDispatcher;


@WebServlet("/DeleteEmpsalarySrv")
public class DeleteEmpSalarySrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

  
    	String id = request.getParameter("deleteid");

    	Addempsalaryserviceimpl salary = new Addempsalaryserviceimpl();

		String status = salary.deleteEmpSalary(id);
		
        RequestDispatcher rd = request.getRequestDispatcher("deletesalary.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
