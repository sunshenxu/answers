package com.answers.entity;

import java.io.Serializable;
import java.util.Date;

public class Question implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int id;
	private String title;
	private String content;
	private Date releasetime;
	private int votecount;
	private int answercount;
	private int browsecount;
	private String userid;
	
	
	public Question() {
	}

	
	
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getReleasetime() {
		return releasetime;
	}

	public void setReleasetime(Date releasetime) {
		this.releasetime = releasetime;
	}

	public int getVotecount() {
		return votecount;
	}

	public void setVotecount(int votecount) {
		this.votecount = votecount;
	}

	public int getAnswercount() {
		return answercount;
	}

	public void setAnswercount(int answercount) {
		this.answercount = answercount;
	}

	public int getBrowsecount() {
		return browsecount;
	}

	public void setBrowsecount(int browsecount) {
		this.browsecount = browsecount;
	}

	
	
	
	
}
