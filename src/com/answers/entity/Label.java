package com.answers.entity;

import java.io.Serializable;

public class Label implements Serializable{

	private static final long serialVersionUID = 1L;

	private int id;
	private String content;

	public Label() {
	}
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	
	
	
}
