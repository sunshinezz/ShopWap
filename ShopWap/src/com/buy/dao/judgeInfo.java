package com.buy.dao;

import java.sql.Date;

public class judgeInfo {
	private int id;//judgeId
	private  int orderId;
	private String title;
	private Date date;
	private String xinde;//ÐÄµÃ
	private int grade;//ÆÀ·Ö£¨1,2,3,4,5£©
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getXinde() {
		return xinde;
	}
	public void setXinde(String xinde) {
		this.xinde = xinde;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
}
