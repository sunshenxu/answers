package com.answers.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.answers.entity.Page;
import com.answers.entity.QULs;
import com.answers.service.IQuestionService;
import com.answers.service.impl.QuestionServiceImpl;

import net.sf.json.JSONObject;

@WebServlet("/question")
public class QuestionServlet extends BaseServlet{
	private static final long serialVersionUID = 1L;
	
	private IQuestionService questionService = new QuestionServiceImpl();
			
	
	//查询技术问答的当前页面的问题数据
	public String technicalPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String currentPage = request.getParameter("currentPage");
		String pageSize = request.getParameter("pageSize");
		
		
		Page<QULs> page = questionService.queryQuestionAndUserAndLabel(Integer.parseInt(currentPage), Integer.parseInt(pageSize));
		
		JSONObject json = JSONObject.fromObject(page);
		
		//System.out.println(fromObject);
		
		response.getWriter().print(json);
		
		return "";
	}
	
	
	

}
