package com.weblabs.service.impl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.AddInvoice;
import com.weblabs.beans.AddInvoiceItems;
import com.weblabs.utility.DBUtil;

public class InvoiceDAO {

	public static List<AddInvoice> getFilteredInvoices(String whereClause, int start, int limit) {
		List<AddInvoice> filteredInvoices = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = DBUtil.provideConnection();
			String query;
			if (whereClause != null && !whereClause.isEmpty()) {
				/*
				 * query =
				 * "SELECT invoice.id, client, Project, Email, Tax, ClientAddress, BillingAddress, invoicedate, duedate, OtherInformation, \r\n"
				 * +
				 * "discount, taxamount, grandtotal, Tax,Discount,  grandTotal, invoiceitems.id as invoiceitemsid, Item, Description, \r\n"
				 * + "UnitCost, Qty, Amount from invoice\r\n" +
				 * "join invoiceitems on invoice.id = invoiceitems.invoiceid WHERE " +
				 * whereClause + " LIMIT ?, ?;";
				 */

				query = "SELECT invoice.id, client, Project, Email, Tax, ClientAddress, BillingAddress, invoicedate, duedate, OtherInformation, \r\n"
						+ "discount, taxamount, grandtotal, Tax,Discount,  grandTotal from invoice\r\n" + "WHERE "
						+ whereClause + " LIMIT ?, ?;";

			} else {
				/*
				 * query =
				 * "SELECT invoice.id, client, Project, Email, Tax, ClientAddress, BillingAddress, invoicedate, duedate, OtherInformation, \r\n"
				 * +
				 * "discount, taxamount, grandtotal, Tax,Discount,  grandTotal,  invoiceitems.id as invoiceitemsid, Item, Description, \r\n"
				 * + "UnitCost, Qty, Amount from invoice\r\n" +
				 * "join invoiceitems on invoice.id = invoiceitems.invoiceid LIMIT ?, ?;";
				 */

				query = "SELECT invoice.id, client, Project, Email, Tax, ClientAddress, BillingAddress, invoicedate, duedate, OtherInformation, \r\n"
						+ "discount, taxamount, grandtotal, Tax,Discount,  grandTotal from invoice\r\n"
						+ " LIMIT ?, ?;";
			}
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, start);
			preparedStatement.setInt(2, limit);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				AddInvoice invoice = new AddInvoice();
				invoice.setId(resultSet.getString("id"));
				invoice.setClient(resultSet.getString("client"));
				invoice.setProject(resultSet.getString("Project"));
				invoice.setEmail(resultSet.getString("Email"));
				invoice.setTax(resultSet.getString("Tax"));
				invoice.setClientAddress(resultSet.getString("ClientAddress"));
				invoice.setBillingAddress(resultSet.getString("BillingAddress"));
				invoice.setInvoicedate(resultSet.getString("InvoiceDate"));
				invoice.setDueDate(resultSet.getString("DueDate"));
				invoice.setOtherInformation(resultSet.getString("OtherInformation"));
				invoice.setDiscount(resultSet.getString("Discount"));
				invoice.setTaxamount(resultSet.getString("TaxAmount"));
				invoice.setGrandtotal(resultSet.getString("grandTotal"));

				// Get associated invoice items for each invoice
				// List<AddInvoiceItems> invoiceItems = getInvoiceItemsByInvoiceId(connection,
				// invoice.getId());

				// invoice.setInvoiceItems(invoiceItems);

				filteredInvoices.add(invoice);
			}
		} catch (SQLException e) {
			// Handle exceptions or log them properly
			e.printStackTrace();
		} finally {
			// closeResources(connection, preparedStatement, resultSet);
			try {
				if (resultSet != null)
					resultSet.close();
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (Exception e) {
				// Handle exceptions
				e.printStackTrace();
			}
		}

		return filteredInvoices;
	}

	public static List<AddInvoiceItems> getInvoiceItemsByInvoiceId(String invoiceId) {
	    List<AddInvoiceItems> invoiceItemsByInvoiceId = new ArrayList<>();
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;

	    try {
	        connection = DBUtil.provideConnection();
	        String query = "SELECT InvoiceId, Item, Description, UnitCost, Qty, Amount FROM invoiceitems WHERE InvoiceId = ?";
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setString(1, invoiceId);

	        resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	            AddInvoiceItems invoiceItem = new AddInvoiceItems();
	            invoiceItem.setInvoiceid(resultSet.getString("InvoiceId"));
	            invoiceItem.setItem(resultSet.getString("Item"));
	            invoiceItem.setDescription(resultSet.getString("Description"));
	            invoiceItem.setUnitCost(resultSet.getString("UnitCost"));
	            invoiceItem.setQty(resultSet.getString("Qty"));
	            invoiceItem.setAmount(resultSet.getString("Amount"));
	            invoiceItemsByInvoiceId.add(invoiceItem);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (resultSet != null) {
	                resultSet.close();
	            }
	            if (preparedStatement != null) {
	                preparedStatement.close();
	            }
	            if (connection != null) {
	                connection.close();
	            }
	        } catch (Exception e) {
	            // Handle exceptions
	            e.printStackTrace();
	        }
	    }

	    return invoiceItemsByInvoiceId;
	}

	 

	/*
	 * public static List<AddInvoiceItems> getInvoiceItemsByInvoiceId(int invoiceId)
	 * { List<AddInvoiceItems> invoiceItemsByInvoiceId = new ArrayList<>();
	 * Connection connection = null; PreparedStatement preparedStatement = null;
	 * ResultSet resultSet = null;
	 * 
	 * try { connection = DBUtil.provideConnection(); String query =
	 * "SELECT InvoiceId, Item, Description, UnitCost, Qty, Amount FROM invoiceitems WHERE InvoiceId = ?"
	 * ; preparedStatement = connection.prepareStatement(query);
	 * preparedStatement.setInt(1, invoiceId);
	 * 
	 * resultSet = preparedStatement.executeQuery(); while (resultSet.next()) {
	 * AddInvoiceItems invoiceItem = new AddInvoiceItems();
	 * invoiceItem.setInvoiceid(resultSet.getString("InvoiceId"));
	 * invoiceItem.setItem(resultSet.getString("Item"));
	 * invoiceItem.setDescription(resultSet.getString("Description"));
	 * invoiceItem.setUnitCost(resultSet.getString("UnitCost"));
	 * invoiceItem.setQty(resultSet.getString("Qty"));
	 * invoiceItem.setAmount(resultSet.getString("Amount"));
	 * invoiceItemsByInvoiceId.add(invoiceItem); } } catch (SQLException e) {
	 * e.printStackTrace(); } finally { try { if (resultSet != null)
	 * resultSet.close(); if (preparedStatement != null) preparedStatement.close();
	 * if (connection != null) connection.close(); } catch (Exception e) {
	 * e.printStackTrace(); } }
	 * 
	 * return invoiceItemsByInvoiceId; }
	 */

	public static int totalCount() {
		int count = 0;
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			connection = DBUtil.provideConnection();
			String query = "select count(*) as count from invoice";
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
