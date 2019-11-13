package com.answers.entity;

import java.io.Serializable;

public class QU implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Question question;
	private User user;
	
	public QU() {
	}
	
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	
	
}
