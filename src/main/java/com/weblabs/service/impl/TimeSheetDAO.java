package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.AddTimesheet;
import com.weblabs.utility.DBUtil;

public class TimeSheetDAO {
    public static List<AddTimesheet> getFilteredTimesheets(String whereClause, int start, int limit) {
        List<AddTimesheet> filteredTimesheets = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT id, Project, Deadline, totalhours, Remaininghours, Date, Hours, DescriptionName FROM timesheet WHERE " + whereClause + " LIMIT ? , ?;";
            } else {
                query = "SELECT id, Project, Deadline, totalhours, Remaininghours, Date, Hours, DescriptionName FROM timesheet LIMIT ? , ?;";
            }

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                AddTimesheet timesheet = new AddTimesheet();
                timesheet.setId(resultSet.getString("id"));
                timesheet.setProject(resultSet.getString("Project"));
                timesheet.setDeadline(resultSet.getString("Deadline"));
                timesheet.setTotalhours(resultSet.getString("totalhours"));
                timesheet.setRemainingHours(resultSet.getString("Remaininghours"));
                timesheet.setDate(resultSet.getString("Date"));
                timesheet.setHours(resultSet.getString("Hours"));
                timesheet.setDescription(resultSet.getString("DescriptionName"));
                filteredTimesheets.add(timesheet);
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

        return filteredTimesheets;
    }

	/*
	 * public int getRecordCount() { Connection connection = null; PreparedStatement
	 * statement = null; ResultSet resultSet = null; int recordCount = 0;
	 * 
	 * try { // Establish a database connection (you should configure your database
	 * URL, username, and password) connection = DBUtil.provideConnection(); //
	 * Define the SQL query to count the records String sql =
	 * "SELECT COUNT(1) FROM timesheet";
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
		   String query = "select count(*) as count from timesheet";
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
    
    
}
