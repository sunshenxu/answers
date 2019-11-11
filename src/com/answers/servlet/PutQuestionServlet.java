package com.answers.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/putquestion")
public class PutQuestionServlet extends BaseServlet{

	private static final long serialVersionUID = 1L;
	
	public String islog(HttpServletRequest request, HttpServletResponse response) {
		
		//request.getSession(false)==null),适用于session过期，且只有第一次创建session时有效
		//这个值如果是true，那么如   果当前的request的session不可用，那么就创建新的会话，如果存在就返回当前的会话。
		//如果参数是false，那么在request的当前会话不存在的时候就返回null。
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("user")==null){
			 //没有用户登录
			request.setAttribute("sf", "false");
			return "forward:/index.jsp";
			
		}else{  
			//有用户登录
			request.setAttribute("sf", "true");
			return "forward:/ask.jsp";
		}  
		
	}
	
	
	
	
	

}
