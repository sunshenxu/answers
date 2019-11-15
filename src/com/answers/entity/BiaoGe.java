package com.answers.entity;

import java.util.List;

public class BiaoGe<T> {
	//使用layui框架表格必须返回这种类型的json格式,要一模一样，也可以自己定义的
	/**
	 * {"code":0,"msg":"","count":1000,
	 * "data":[{"id":10000,"username":"user-0","sex":"女","city":"城市-0","sign":"签名-0","experience":255,"logins":24,"wealth":82830700,"classify":"作家","score":57}]}
	 * 
	 */
	
	private int code;
	private String msg;
	private int count;
	private List<T> data;
	
	public BiaoGe() {
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	
	
	
	

}
