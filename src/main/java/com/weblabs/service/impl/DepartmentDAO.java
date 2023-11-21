package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.AddDepartment;
import com.weblabs.beans.EmployeeBean;
import com.weblabs.utility.DBUtil;

public class DepartmentDAO {
    public static List<AddDepartment> getFilteredDepartments(String whereClause, int start, int limit) {
        List<AddDepartment> filteredDepartments = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT id, DepartmentName, Date FROM departments WHERE " + whereClause + " LIMIT ?, ?;";
            } else {
                query = "SELECT id, DepartmentName, Date FROM departments LIMIT ?, ?;";
            }

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                AddDepartment department = new AddDepartment();
                department.setid(resultSet.getString("id"));
                department.setDepartmentName(resultSet.getString("DepartmentName"));
               
                filteredDepartments.add(department);
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

        return filteredDepartments;
    }

	/*
	 * public int getRecordCount() { Connection connection = null; PreparedStatement
	 * statement = null; ResultSet resultSet = null; int recordCount = 0;
	 * 
	 * try { connection = DBUtil.provideConnection(); // Define the SQL query to
	 * count the records String sql = "SELECT COUNT(1) FROM departments";
	 * 
	 * // Prepare the statement statement = connection.prepareStatement(sql);
	 * 
	 * // Execute the query and retrieve the count resultSet =
	 * statement.executeQuery(); if (resultSet.next()) { recordCount =
	 * resultSet.getInt(1); } } catch (Exception e) { e.printStackTrace(); // Handle
	 * any database errors here } finally { // Close the resources try { if
	 * (resultSet != null) resultSet.close(); if (statement != null)
	 * statement.close(); if (connection != null) connection.close(); } catch
	 * (Exception e) { e.printStackTrace(); } }
	 * 
	 * return recordCount; }
	 */
    public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from departments";
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
    
    
    public static List<AddDepartment> getAllDepartmenet() {
        List<AddDepartment> allEmployees = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT  id,DepartmentName FROM departments";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	AddDepartment dept = new AddDepartment();
               
            	dept.setid(resultSet.getString("id"));
            	dept.setDepartmentName(resultSet.getString("DepartmentName"));
               
                allEmployees.add(dept);
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
}
