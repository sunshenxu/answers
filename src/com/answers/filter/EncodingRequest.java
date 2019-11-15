package com.answers.filter;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncodingRequest extends HttpServletRequestWrapper {
	HttpServletRequest req = null;
	public EncodingRequest(HttpServletRequest request) {
		super(request);
		req = request;
	}

	@Override
	public String getParameter(String name) {
		String val = req.getParameter(name);
		try {
			if(val!=null) {
				val = new String(val.getBytes("iso-8859-1"),"utf-8");
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		return val;
	}
	
	

}











