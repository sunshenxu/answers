package com.answers.entity;

import java.io.Serializable;
import java.util.Date;

public class QUname implements Serializable{

private static final long serialVersionUID = 1L;
	

	private int id;
	private String title;
	private String username;
	private String type;
	private String createtime;
	private String alerttime;
	private int count;
	private String status;
	
	
	
	
	public int getId() {
		return id;
	}




	public void setId(int id) {
		this.id = id;
	}




	public String getStatus() {
		return status;
	}




	public void setStatus(String status) {
		this.status = status;
	}




	public QUname() {
	}

	
	
	
	public String getCreatetime() {
		return createtime;
	}




	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}




	public String getAlerttime() {
		return alerttime;
	}




	public void setAlerttime(String alerttime) {
		this.alerttime = alerttime;
	}




	public int getCount() {
		return count;
	}




	public void setCount(int count) {
		this.count = count;
	}




	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}






	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}



	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


}
