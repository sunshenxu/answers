package com.answers.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter("/*")
public class EncodingFilter implements Filter {
	public void destroy() {
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req =(HttpServletRequest)request;
		//不能写response.setContentType("text/html;charset=utf-8");，会把所有的css、js等给设置为html
		response.setCharacterEncoding("utf-8");  
		String method = req.getMethod();
		
		if("GET".equals(method)) {
			EncodingRequest er = new EncodingRequest(req);
			
			chain.doFilter(er, response);
			
		}else if("POST".equals(method)) {
			req.setCharacterEncoding("utf-8");
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
