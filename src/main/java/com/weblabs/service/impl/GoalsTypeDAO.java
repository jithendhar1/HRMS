package com.weblabs.service.impl;

import java.sql.Connection;  
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.AddGoalsType;
import com.weblabs.utility.DBUtil;

public class GoalsTypeDAO {

	public static List<AddGoalsType> getFilteredAddGoalstype(String whereClause, int start, int limit) {
        List<AddGoalsType> FilteredAddGoalstype = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT id,Type,Description,Status  FROM goal_type WHERE " + whereClause + " LIMIT ?, ?;";
               
            } else {
                query = "SELECT id,Type,Description,Status  FROM goal_type LIMIT ?, ?;";
                }
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);
     
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	AddGoalsType  goals=new AddGoalsType();
            	goals.setId(resultSet.getString("id"));
            	goals.setType(resultSet.getString("type"));
            	goals.setDescription(resultSet.getString("description"));
            	goals.setStatus(resultSet.getString("status"));
            	FilteredAddGoalstype.add(goals);
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

        return FilteredAddGoalstype;
    }
	
	public static int totalCount() {
		 int count = 0;
		 Connection connection = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
		 try {
			 connection = DBUtil.provideConnection();
		   String query = "select count(*) as count from goal_type";
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
