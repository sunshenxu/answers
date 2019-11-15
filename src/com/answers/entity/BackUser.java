package com.answers.entity;

import java.io.Serializable;

public class BackUser implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int id;
	private String userId;
	private String name;
	private String passwd;
	private String status;
	private int jiaoseId;
	
	public BackUser() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getJiaoseId() {
		return jiaoseId;
	}

	public void setJiaoseId(int jiaoseId) {
		this.jiaoseId = jiaoseId;
	}
	
}
