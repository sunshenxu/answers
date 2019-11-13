package com.answers.entity;

import java.io.Serializable;

public class AUs implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Huida huida;
	private User user;
	
	public AUs() {
	}

	public Huida getHuida() {
		return huida;
	}

	public void setHuida(Huida huida) {
		this.huida = huida;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
