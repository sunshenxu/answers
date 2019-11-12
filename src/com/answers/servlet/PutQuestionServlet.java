package com.answers.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.answers.entity.Question;
import com.answers.entity.User;
import com.answers.service.IPutQuestionService;
import com.answers.service.impl.PutQuestionServiceImpl;

import net.sf.json.JSONObject;

@WebServlet("/putquestion")
public class PutQuestionServlet extends BaseServlet{
	
	private static final long serialVersionUID = 1L;
	
	private IPutQuestionService putQuestionService = new PutQuestionServiceImpl();
	
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
	
	public String putQuestions (HttpServletRequest request, HttpServletResponse response) throws IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		User user = (User)request.getSession().getAttribute("user");
		String userId = user.getUserId();
		
		Date date = new Date();
		
		String labelIds = request.getParameter("labelId");
		String questionType = request.getParameter("questionType");
		
		Question question = new Question();
		question.setContent(content);
		question.setReleasetime(date);
		question.setTitle(title);
		question.setUserid(userId);
		question.setAnswercount(0);
		question.setBrowsecount(0);
		question.setVotecount(0);
		
		int count = putQuestionService.addQuestionService(question, labelIds, questionType);
		JSONObject json = new JSONObject();
		if(count==1) {
			json.put("putfalg", "true");
		}else {
			json.put("putfalg", "false");
		}
		response.getWriter().print(json);
		return "";
	}
	

}
