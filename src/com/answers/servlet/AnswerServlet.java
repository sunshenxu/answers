package com.answers.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.answers.entity.AUs;
import com.answers.entity.Huida;
import com.answers.entity.Page;
import com.answers.entity.QU;
import com.answers.service.IAnswerService;
import com.answers.service.IQuestionService;
import com.answers.service.impl.AnswerServiceImpl;
import com.answers.service.impl.QuestionServiceImpl;

import net.sf.json.JSONObject;

@WebServlet("/answerquestion")
public class AnswerServlet extends BaseServlet{
	private static final long serialVersionUID = 1L;
	private IQuestionService questionService = new QuestionServiceImpl();
	private IAnswerService answerService = new AnswerServiceImpl();
	
	public String islog(HttpServletRequest request, HttpServletResponse response) {
		
		String qid = request.getParameter("qid");
		String type = request.getParameter("type");
		String currentPage = request.getParameter("cpage");
		String pageSize = request.getParameter("size");
		
		//1表示按时间排序、2表示按票数排序
		String sortType = request.getParameter("sortType");
		
		//request.getSession(false)==null),适用于session过期，且只有第一次创建session时有效
		//这个值如果是true，那么如   果当前的request的session不可用，那么就创建新的会话，如果存在就返回当前的会话。
		//如果参数是false，那么在request的当前会话不存在的时候就返回null。
		
		HttpSession session = request.getSession();
		session.setAttribute("sortType", sortType);
		
		if(session.getAttribute("user")==null){
			 //没有用户登录
			request.setAttribute("sf", "false");
			return "forward:/index.jsp";
			
		}else{  
			//有用户登录
			
			//浏览数加1
			
			int count = questionService.addBrowsecountService(Integer.parseInt(qid), sortType, 1);
			
			//显示问题的内容和回答的内容
			QU qu = questionService.queryQuestionByQuestionID(Integer.parseInt(qid), type);
			
			Page<AUs> pageAnswer = answerService.queryCurrentPage(Integer.parseInt(currentPage), Integer.parseInt(pageSize), type, Integer.parseInt(qid),sortType);
			
			
			session.setAttribute("qu", qu);
			session.setAttribute("pageAnswer", pageAnswer);
			
			request.setAttribute("sf", "true");
			request.setAttribute("type", type);
			
			return "forward:/questiondetail.jsp";
		}  
		
	}
	
	//添加一个回答
	public String putAnswer(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String type = request.getParameter("type");
		
		String content = request.getParameter("huidaContent");
		String uid = request.getParameter("uid");
		int qid = Integer.parseInt(request.getParameter("qid"));
		Date answertime = new Date(); 
		int votecount = 0;
		
		Huida huida = new Huida();
		huida.setAnswertime(answertime);
		huida.setContent(content);
		huida.setQuestionid(qid);
		huida.setUserid(uid);
		huida.setVotecount(votecount);
		
		int count = answerService.addQuestionAnswerService(huida, type);
		
		
		JSONObject json = new JSONObject();
		if(count==1) {
			json.put("answer", "true");
		}else {
			json.put("answer", "false");
		}
		
		response.getWriter().print(json);
		
		return "";
		
	}
	
	
	//点赞
	public String vote(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String type = request.getParameter("type");
		int num = Integer.parseInt(request.getParameter("num"));
		int answerId = Integer.parseInt(request.getParameter("answerId"));
		
		int count = answerService.addVotecountService(answerId, type, num);
		
		JSONObject json = new JSONObject();
		if(count == 1) {
			json.put("voteflag", "true");
		}else {
			json.put("voteflag", "false");
		}
		response.getWriter().print(json);
		
		return "";
	}
	
	
	
	
}
