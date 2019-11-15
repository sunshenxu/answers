package com.answers.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.answers.entity.BackUser;
import com.answers.entity.BiaoGe;
import com.answers.entity.Page;
import com.answers.entity.QU;
import com.answers.entity.QUname;
import com.answers.service.IBackService;
import com.answers.service.impl.BackServiceImpl;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/back")
public class BackServlet extends BaseServlet{

	private static final long serialVersionUID = 1L;
	
	private IBackService backService = new BackServiceImpl();

	//登录
	public String login(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		
		String userId = request.getParameter("userid");
		
		String psswd = request.getParameter("passwd");
		
		BackUser backUser = backService.queryIdAndPasswdService(userId, psswd);
		
		JSONObject json = new JSONObject();
		
		if(backUser!=null) {   	//登录成功
			session.setAttribute("backUser", backUser);
			
			json.put("logflag", "true");
			
		}else {  			 	//登录失败
			json.put("logflag", "false");
			
		}
		
		response.getWriter().print(json);
		
		return "";
	}
	
	//用户是否登录
	public String isLogin(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("backUser")==null){
			 //没有用户登录
			request.setAttribute("logstatus", "false");
			return "forward:/back/login.jsp";
			
		}else{  
			//有用户登录
			request.setAttribute("logstatus", "true");
			return "forward:/back/main.jsp";
		}  
		
	}
	
	//用户退出
	public String exit(HttpServletRequest request,HttpServletResponse response) throws IOException {
		

		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:"+request.getContextPath()+"/back/login.jsp";
		
	}
	
	//修改密码
	public String updatePwd(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String newpasswd = request.getParameter("newpasswd");
		
		HttpSession session = request.getSession();
		BackUser backUser = (BackUser)session.getAttribute("backUser");
		
		//用户账号
		String userId = backUser.getUserId();

		
		int count = backService.updatePasswdByIdService(userId, newpasswd);
		//修改完密码后，销毁session，去重新登录
		session.invalidate();
		
		JSONObject json = new JSONObject();
		if(count==1) {
			json.put("updateflag", "true");
		}else {
			json.put("updateflag", "false");
		}
		
		response.getWriter().print(json);
		
		return "";
		
	}
	
	
	//获取问题的数据
	public String questionList(HttpServletRequest request,HttpServletResponse response) throws IOException {
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int pageSize = Integer.parseInt(request.getParameter("limit"));
		String qtype = request.getParameter("questiontype");
		
		BiaoGe<QUname> list = backService.queryQUService(currentPage, pageSize,qtype);
		
		
		JSONObject json = JSONObject.fromObject(list);
		
	
		response.getWriter().print(json);
		
		return "";
	}
	
	
	//修改状态
	public String upstatus(HttpServletRequest request,HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		String type = request.getParameter("type");
		
		String status = request.getParameter("status");
		
		int count = backService.updateStatusService(id, type, status);
		
		JSONObject json = new JSONObject();
		if(count==1) {
			json.put("f", "true");
			
		}else {
			json.put("f", "false");
			
		}
		
		response.getWriter().print(json);
		
		return "";
	}
	
	
}
