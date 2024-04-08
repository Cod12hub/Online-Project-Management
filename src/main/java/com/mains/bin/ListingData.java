package com.mains.bin;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class ListingData {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	
	private int id;
	private String name;
	private String reason;
    private String type;
    private String division;
    private String category;
    private String priority;
    
    
    public ListingData() {
		super();
		// TODO Auto-generated constructor stub
	}
	private String department;
    private String startDate;
    private String endDate;
    private String location;
    private String status;


	public ListingData(int id, String name, String reason, String type, String division, String category,
			String priority, String department, String startDate, String endDate, String location, String status) {
		super();
		this.id = id;
		this.name = name;
		this.reason = reason;
		this.type = type;
		this.division = division;
		this.category = category;
		this.priority = priority;
		this.department = department;
		this.startDate = startDate;
		this.endDate = endDate;
		this.location = location;
		this.status = status;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getReason() {
		return reason;
	}


	public void setReason(String reason) {
		this.reason = reason;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getDivision() {
		return division;
	}


	public void setDivision(String division) {
		this.division = division;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getPriority() {
		return priority;
	}


	public void setPriority(String priority) {
		this.priority = priority;
	}


	public String getDepartment() {
		return department;
	}


	public void setDepartment(String department) {
		this.department = department;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "ListingData [id=" + id + ", name=" + name + ", reason=" + reason + ", type=" + type + ", division="
				+ division + ", category=" + category + ", priority=" + priority + ", department=" + department
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", location=" + location + ", status=" + status
				+ "]";
	}
    
    
    
}
	