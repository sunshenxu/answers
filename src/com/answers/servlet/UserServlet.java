package com.answers.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.answers.entity.User;
import com.answers.service.IUserService;
import com.answers.service.impl.UserServiceImpl;

import net.sf.json.JSONObject;

@WebServlet("/UserServlet")
public class UserServlet extends BaseServlet {
	
	private static final long serialVersionUID = 1L;
	
	private IUserService userService = new UserServiceImpl();
	
	//添加用户
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
	
	
	//用户登录
	public String login(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		
		String userId = request.getParameter("userId");
		String passWd = request.getParameter("passWd");
		//是否是记住密码
		String check = request.getParameter("check");
		
		User user = userService.login(userId, passWd);
		
		JSONObject json = new JSONObject();
		if(user==null) {
			//System.out.println("登录失败");
			json.put("loginFlag", "false");
			
		}else {
			session.setAttribute("user", user);
			Cookie cookie1 = new Cookie("userId",user.getUserId());
			Cookie cookie2 = new Cookie("userPwd",user.getPassWd());
			Cookie cookie3 = new Cookie("check","true");
			if("true".equals(check)) {
				cookie1.setMaxAge(60*60*24);
				cookie2.setMaxAge(60*60*24);
				cookie3.setMaxAge(60*60*24);
				response.addCookie(cookie1);
				response.addCookie(cookie2);
				response.addCookie(cookie3);
			}else {
				//删除cookie
				cookie1.setMaxAge(0);
				cookie2.setMaxAge(0);
				cookie3.setMaxAge(0);
				response.addCookie(cookie1);
				response.addCookie(cookie2);
				response.addCookie(cookie3);
			}
			
			json.put("loginFlag", "true");
			json.put("username", user.getName());
		}
		response.getWriter().print(json);
		
		return "";
	}
	
	
	//根据账号查询用户是否存在
	public String queryUserById(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String userId = request.getParameter("userId");
		int count = userService.queryUserById(userId);
		JSONObject json = new JSONObject();
		if(count == 1) {
			//表示该用户账号已经存在，可以登录
			json.put("checkUserId", "true");
		}else {
			//表示没有该用户账号，不能登录
			json.put("checkUserId", "false");
		}
		
		response.getWriter().print(json);
		
		
		return "";
	}
	
	//用户退出
	public String exit(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:"+request.getContextPath();
	}
		
	

}
