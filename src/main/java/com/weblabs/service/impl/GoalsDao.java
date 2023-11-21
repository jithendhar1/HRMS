package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.AddGoals;
import com.weblabs.utility.DBUtil;

public class GoalsDao {

	public static List<AddGoals> getFilteredAddGoals(String whereClause, int start, int limit) {
        List<AddGoals> FilteredAddGoals = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT id,Type ,Subject,Target,StartDate, EndDate ,Description ,Status,Progress,dateTime FROM goals WHERE " + whereClause + " LIMIT ?, ?;";
               
            } else {
                query = "SELECT id,Type ,Subject,Target,StartDate, EndDate ,Description ,Status,Progress,dateTime FROM goals LIMIT ?, ?;";
                }
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);
     
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	AddGoals  goalss=new AddGoals();
            	goalss.setId(resultSet.getString("id"));
            	goalss.setType(resultSet.getString("type"));
            	goalss.setSubject(resultSet.getString("subject"));
            	goalss.setTarget(resultSet.getString("target"));
            	goalss.setStartDate(resultSet.getString("startDate"));
            	goalss.setEndDate(resultSet.getString("endDate"));
            	goalss.setDescription(resultSet.getString("description"));
            	goalss.setStatus(resultSet.getString("status"));
            	goalss.setProgress(resultSet.getString("progress"));
            	FilteredAddGoals.add(goalss);
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

        return FilteredAddGoals;
    }
	
	public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from goals";
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
