package com.weblabs.beans;

public class AddPF {
	
	private String Id;
	private String EmployeeName;
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getEmployeeName() {
		return EmployeeName;
	}
	public void setEmployeeName(String employeeName) {
		EmployeeName = employeeName;
	}
	public String getProvidentFundType() {
		return ProvidentFundType;
	}
	public void setProvidentFundType(String providentFundType) {
		ProvidentFundType = providentFundType;
	}
	public String getEmployeeShareAmount() {
		return EmployeeShareAmount;
	}
	public void setEmployeeShareAmount(String employeeShareAmount) {
		EmployeeShareAmount = employeeShareAmount;
	}
	public String getOrganizationShareAmount() {
		return OrganizationShareAmount;
	}
	public void setOrganizationShareAmount(String organizationShareAmount) {
		OrganizationShareAmount = organizationShareAmount;
	}
	public String getEmployeeSharePer() {
		return EmployeeSharePer;
	}
	public void setEmployeeSharePer(String employeeSharePer) {
		EmployeeSharePer = employeeSharePer;
	}
	public String getOrganizationSharePer() {
		return OrganizationSharePer;
	}
	public void setOrganizationSharePer(String organizationSharePer) {
		OrganizationSharePer = organizationSharePer;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	private String ProvidentFundType;
	private String EmployeeShareAmount;	
	private String OrganizationShareAmount;
	private String EmployeeSharePer;	
	private String OrganizationSharePer;
	private String Description;
	

}
