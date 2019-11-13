package com.answers.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IsLoginFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		HttpSession session = req.getSession();
		if (session.getAttribute("user") == null) {
			//没有用户登录
			request.setAttribute("sf", "false");
			req.getRequestDispatcher("/index.jsp").forward(req, res);
			res.sendRedirect(req.getContextPath() + "/login.jsp");
		} else {
			//有用户登录
			chain.doFilter(request, response);
			
		}
		
		
		/*if(session.getAttribute("user")==null){
			 
			
			
		}else{  
			
			request.setAttribute("sf", "true");
			return "forward:/ask.jsp";
		} */ 
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
