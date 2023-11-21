package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.CreateProject;
import com.weblabs.utility.DBUtil;

public class ProjectDAO {

    public static int totalCount() {
        int count = 0;
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT COUNT(*) AS count FROM createproject";
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) connection.close();
                if (ps != null) ps.close();
                if (rs != null) rs.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return count;
    }

    public static List<CreateProject> getAllProjects() {
        List<CreateProject> allProjects = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT project_id, projectname, Clientid, startdate, enddate, rate, hourly, priority, projectleader, addteam, description, uploadfile FROM createproject";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                CreateProject project = new CreateProject();
                project.setProject_id(resultSet.getString("project_id"));
                project.setProjectname(resultSet.getString("projectname"));
                project.setClientid(resultSet.getString("Clientid"));
                project.setStartdate(resultSet.getString("startdate"));
                project.setEnddate(resultSet.getString("enddate"));
                project.setProjectname(resultSet.getString("projectname"));
                project.setRate(resultSet.getString("rate"));
                project.setHourly(resultSet.getString("hourly"));
                project.setPriority(resultSet.getString("priority"));
                project.setProjectleader(resultSet.getString("projectleader"));
                project.setAddteam(resultSet.getString("addteam"));
                project.setDescription(resultSet.getString("description"));
                project.setUploadfile(resultSet.getString("uploadfile"));
                
                
                // Set other fields using appropriate setters

                allProjects.add(project);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return allProjects;
    }
    
    public static List<CreateProject> getFilteredProject(String whereClause, int start, int limit) {
        List<CreateProject> FilteredProject = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT project_id, projectname, Clientid, startdate, enddate, rate, hourly, priority, projectleader, addteam, description, uploadfile FROM createproject WHERE " + whereClause + " LIMIT ?, ?;";
               
            } else {
                query = "SELECT project_id, projectname, Clientid, startdate, enddate, rate, "
                		+ "hourly, priority, projectleader, addteam, description, uploadfile FROM createproject LIMIT ?, ?;";
                }
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);
     
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	CreateProject pro = new CreateProject();
                pro.setProject_id("project_id");
                pro.setProjectname("projectname");
                pro.setClientid(resultSet.getString("Clientid"));
                pro.setStartdate(resultSet.getString("startdate"));
                pro.setEnddate(resultSet.getString("enddate"));
                pro.setRate(resultSet.getString("rate"));
                pro.setHourly(resultSet.getString("hourly"));
                pro.setPriority(resultSet.getString("priority"));
                pro.setProjectleader(resultSet.getString("projectleader"));
                pro.setAddteam(resultSet.getString("addteam"));
                pro.setDescription(resultSet.getString("description"));
                pro.setUploadfile(resultSet.getString("uploadfile"));
            
                
                
                FilteredProject.add(pro);
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

        return FilteredProject;
    }
    
    
    
    public CreateProject getProjectById(int projectId) {
        CreateProject project = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT * FROM createproject WHERE project_id ";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, projectId);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                project = new CreateProject();
                project.setProject_id(resultSet.getString("project_id"));
                project.setProjectname(resultSet.getString("projectname"));
                project.setClientid(resultSet.getString("Clientid"));
                project.setStartdate(resultSet.getString("startdate"));
                project.setEnddate(resultSet.getString("enddate"));
                project.setRate(resultSet.getString("rate"));
                project.setHourly(resultSet.getString("hourly"));
                project.setPriority(resultSet.getString("priority"));
                project.setProjectleader(resultSet.getString("projectleader"));
                project.setAddteam(resultSet.getString("addteam"));
                project.setDescription(resultSet.getString("description"));
                project.setUploadfile(resultSet.getString("uploadfile"));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly in a real application
        } finally {
            // Close the resources in a finally block
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return project;
    }

}
   

