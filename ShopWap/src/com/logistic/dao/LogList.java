package com.logistic.dao;

import java.sql.Timestamp;

public class LogList {
	private int id;
	private Timestamp cDate;
	private Timestamp eDate;
	private int state;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Timestamp getcDate() {
		return cDate;
	}
	public void setcDate(Timestamp cDate) {
		this.cDate = cDate;
	}
	public Timestamp geteDate() {
		return eDate;
	}
	public void seteDate(Timestamp eDate) {
		this.eDate = eDate;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
