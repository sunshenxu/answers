package com.answers.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.answers.entity.Label;
import com.answers.entity.Page;
import com.answers.entity.QULs;
import com.answers.service.IQuestionService;
import com.answers.service.impl.QuestionServiceImpl;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet(urlPatterns = "/question")
public class QuestionServlet extends BaseServlet{
	private static final long serialVersionUID = 1L;
	
	private IQuestionService questionService = new QuestionServiceImpl();
			
	
	//查询技术问答的当前页面的问题数据
	public String questionPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String currentPage = request.getParameter("currentPage");
		String pageSize = request.getParameter("pageSize");
		
		String questionType = request.getParameter("questionType");
		String sortType = request.getParameter("sortType");
		String labelId = request.getParameter("labelId");
		
		Page<QULs> page = questionService.queryQuestionAndUserAndLabel(Integer.parseInt(currentPage), Integer.parseInt(pageSize), questionType, sortType, Integer.parseInt(labelId));
		
		JSONObject json = JSONObject.fromObject(page);
		
		//System.out.println(fromObject);
		
		response.getWriter().print(json);
		
		return "";
	}
	
	
	
	//查询所有的标签
	public String labelList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		List<Label> labelList = questionService.queryAllLabelService();
		JSONArray json = JSONArray.fromObject(labelList);
		response.getWriter().print(json);
		
		
		return "";
	}
	
	//按照标题模糊查询
	public String serchQuestionPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String currentPage = request.getParameter("currentPage");
		String pageSize = request.getParameter("pageSize");
		String serchVal = request.getParameter("title");
		
		Page<QULs> page = questionService.queryQuestionByTitle(Integer.parseInt(currentPage), Integer.parseInt(pageSize), serchVal);
				
				
				
		JSONObject json = JSONObject.fromObject(page);
		
		//System.out.println(fromObject);
		
		response.getWriter().print(json);
		
		return "";
	}
	
	
	//点赞
	public String vote(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String type = request.getParameter("type");
		int num = Integer.parseInt(request.getParameter("num"));
		int qid = Integer.parseInt(request.getParameter("qid"));
		
		int count = questionService.addVotecountService(qid, type, num);
		
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
