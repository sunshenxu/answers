package com.answers.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.answers.entity.User;
import com.answers.service.IUserService;
import com.answers.service.impl.UserServiceImpl;

import net.sf.json.JSONObject;

@WebServlet("/UserServlet")
public class UserServlet extends BaseServlet {
	
	private static final long serialVersionUID = 1L;
	
	private IUserService userService = new UserServiceImpl();
	
	public String addUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String passWd = request.getParameter("passwd");
		
		User user = new User();
		user.setName(userName);
		user.setUserId(userId);
		user.setPassWd(passWd);
		
		int flag = userService.AddUserService(user);
		
		JSONObject josn = new JSONObject();
		josn.put("flag", flag);
		response.getWriter().print(josn);
		
		return "";
		
	}
	
	

}
