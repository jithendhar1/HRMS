package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.SupplierBean;
import com.weblabs.utility.DBUtil;

public class SupplierDAO {

    public static List<SupplierBean> getAllSuppliers() {
        List<SupplierBean> allSuppliers = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT supplierID, supplierName, productDetails FROM supplier";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                SupplierBean supplier = new SupplierBean();
                supplier.setSupplierID(resultSet.getString("supplierID"));
                supplier.setSupplierName(resultSet.getString("supplierName"));
                supplier.setProductDetails(resultSet.getString("productDetails"));
                allSuppliers.add(supplier);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
            // Close database resources (connection, statement, result set)
        	 finally {
        		 try {
        			 connection.close();
        		 } catch (SQLException ex) {
        		 ex.printStackTrace();
        		 }
        	 }
     

        return allSuppliers;
    }

    public static int totalCount() {
        int count = 0;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT COUNT(*) FROM supplier";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                count = resultSet.getInt(1);
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

    public static List<SupplierBean> getFilteredSuppliers(String whereClause, int start, int limit) {
        List<SupplierBean> filteredSuppliers = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT supplierID, supplierName, productDetails FROM supplier";
            if (!whereClause.isEmpty()) {
                query += " WHERE " + whereClause;
            }
            query += " LIMIT ?, ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                SupplierBean supplier = new SupplierBean();
                supplier.setSupplierID(resultSet.getString("supplierID"));
                supplier.setSupplierName(resultSet.getString("supplierName"));
                supplier.setProductDetails(resultSet.getString("productDetails"));
                filteredSuppliers.add(supplier);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
   		 try {
   			 connection.close();
   		 } catch (SQLException ex) {
   		 ex.printStackTrace();
   		 }
   		 }
            // Close database resources (connection, statement, result set)
        	
      
        return filteredSuppliers;
    }
}
