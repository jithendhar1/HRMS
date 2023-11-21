package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.AddTraining;
import com.weblabs.service.impl.AddTrainingServiceImp;

@WebServlet("/UpdateTraingServlet")
public class UpdateTrainingSrv extends HttpServlet{

	private static final long serialVersionUID = 1L;
	

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {



    	
    	String id = request.getParameter("id");
    	String TrainingType = request.getParameter("TrainingType");
        String Trainer = request.getParameter("Trainer"); 
        String Employees = request.getParameter("Employees"); 
        String TrainingCost = request.getParameter("TrainingCost"); 
        String StartingDate = request.getParameter("StartingDate"); 
        String EndingDate = request.getParameter("EndingDate"); 
        String DescriptionName = request.getParameter("DescriptionName");
        String Status = request.getParameter("Status"); 
  
    	AddTraining train1 = new AddTraining();
    	train1.setTrainingType(TrainingType);
    	train1.setTrainer(Trainer);
    	train1.setEmployees(Employees);
    	train1.setTrainingCost(TrainingCost);
    	train1.setStartingDate(StartingDate);
    	train1.setEndingDate(EndingDate);
    	train1.setDescriptionName(DescriptionName);
    	train1.setStatus(Status);
    	
    	AddTrainingServiceImp training = new AddTrainingServiceImp();
    	String Statuss = training.editTraining(id, TrainingType, Trainer, Employees, TrainingCost, StartingDate, EndingDate, DescriptionName, Status);
		
        RequestDispatcher rd = request.getRequestDispatcher("edit_training.jsp?message=" + Statuss);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
}
}
