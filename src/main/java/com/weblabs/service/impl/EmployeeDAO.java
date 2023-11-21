
package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.List;
import java.util.Calendar;
import java.text.SimpleDateFormat;
/*
import java.sql.Connection;
import java.sql.PreparedStatement;
importjava.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
*/

import com.weblabs.beans.EmployeeBean;
import com.weblabs.utility.DBUtil;

public class EmployeeDAO {
    public static List<EmployeeBean> getFilteredEmployees(String whereClause, int start, int limit) {
        List<EmployeeBean> filteredEmployees = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
       
        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT FirstName, LastName, UserName, Email, Employee_Id, Phone, DepartmentName, DesignationName FROM employees WHERE " + whereClause + " LIMIT ? , ?;";
               
            } else {
                query = "SELECT FirstName, LastName, UserName, Email, Employee_Id, Phone, DepartmentName, DesignationName FROM employees LIMIT ? , ?;";
            }

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit );
     
            resultSet = preparedStatement.executeQuery();
            

            while (resultSet.next()) {
                EmployeeBean employee = new EmployeeBean();
                employee.setFirstName(resultSet.getString("FirstName"));
                employee.setLastName(resultSet.getString("LastName"));
                employee.setUsername(resultSet.getString("Username"));
                employee.setEmail(resultSet.getString("Email"));
                employee.setEmployee_ID(resultSet.getString("Employee_Id"));
                employee.setPhone(resultSet.getString("Phone"));
                employee.setDepartment(resultSet.getString("DepartmentName"));
                employee.setDesignation(resultSet.getString("DesignationName"));
                filteredEmployees.add(employee);
            }
        } catch (Exception e) {
            // Handle exceptions
        	String status = "Error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            // Close database resources (connection, statement, result set)
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                // Handle exceptions
                e.printStackTrace();
            }
        }

        return filteredEmployees;
        
    } 
	
    
    public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from employees";
		 ps = connection.prepareStatement(query);
		 rs = ps.executeQuery();
		 while (rs.next()) {
		 count = rs.getInt("count");
		 }
		 } catch (Exception e) {
		 e.printStackTrace();
		 } finally {
		 try {
			 connection.close();
		 } catch (SQLException ex) {
		 ex.printStackTrace();
		 }
		 }
		 return count;
		 }

    public static List<EmployeeBean> getAllEmployees() {
        List<EmployeeBean> allEmployees = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT  Employee_Id, FirstName, LastName, UserName, Email, Phone, DepartmentName, DesignationName FROM employees";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                EmployeeBean employee = new EmployeeBean();
               
                employee.setFirstName(resultSet.getString("FirstName"));
                employee.setLastName(resultSet.getString("LastName"));
                employee.setUsername(resultSet.getString("UserName"));
                employee.setEmail(resultSet.getString("Email"));
                employee.setEmployee_ID(resultSet.getString("Employee_Id"));
                employee.setPhone(resultSet.getString("Phone"));
                employee.setDepartment(resultSet.getString("DepartmentName"));
                employee.setDesignation(resultSet.getString("DesignationName"));
                allEmployees.add(employee);
            }
        } catch (Exception e) {
            // Handle exceptions
            e.printStackTrace();
        } finally {
            // Close database resources (connection, statement, result set)
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                // Handle exceptions
                e.printStackTrace();
            }
        }

        return allEmployees;
    }
        
   
        
        // Existing methods...

        public static int getNewEmployeesCountThisMonth() {
            int count = 0;
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;
            
            try {
                connection = DBUtil.provideConnection();
                Calendar calendar = Calendar.getInstance();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
                String currentMonth = dateFormat.format(calendar.getTime());
                
                String query = "SELECT COUNT(*) AS count FROM employees WHERE DATE_FORMAT(Joining_Date, '%Y-%m') = ?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, currentMonth);
                resultSet = preparedStatement.executeQuery();
                
                if (resultSet.next()) {
                    count = resultSet.getInt("count");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (resultSet != null) resultSet.close();
                    if (preparedStatement != null) preparedStatement.close();
                    if (connection != null) connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            return count;
        }
    }
    
    
   

