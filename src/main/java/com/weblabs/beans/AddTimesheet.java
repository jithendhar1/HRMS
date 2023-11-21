package com.weblabs.beans;

public class AddTimesheet {
	
	private String id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	private String project;
	private String Deadline;
	private String totalhours;
	private String RemainingHours;
	private String Date;
	private String Hours;
	private String Description;
	
	public String getProject() {
		return project;
	}
	public void setProject(String project) {
		this.project = project;
	}
	public String getDeadline() {
		return Deadline;
	}
	public void setDeadline(String deadline) {
		Deadline = deadline;
	}
	public String getTotalhours() {
		return totalhours;
	}
	public void setTotalhours(String totalhours) {
		this.totalhours = totalhours;
	}
	public String getRemainingHours() {
		return RemainingHours;
	}
	public void setRemainingHours(String remainingHours) {
		RemainingHours = remainingHours;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public String getHours() {
		return Hours;
	}
	public void setHours(String hours) {
		Hours = hours;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
}
