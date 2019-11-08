package com.answers.entity;

import java.io.Serializable;
import java.util.List;

public class QULs implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Question question;
	private User user;
	private List<Label> labelList;
	
	public QULs() {
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
	public List<Label> getLabelList() {
		return labelList;
	}
	public void setLabelList(List<Label> labelList) {
		this.labelList = labelList;
	}

}
