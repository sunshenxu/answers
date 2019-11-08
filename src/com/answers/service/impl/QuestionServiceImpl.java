package com.answers.service.impl;


import java.util.ArrayList;
import java.util.List;

import com.answers.dao.IQuestionDao;
import com.answers.dao.impl.QuestionDaoImpl;
import com.answers.entity.Label;
import com.answers.entity.Page;
import com.answers.entity.QULs;
import com.answers.entity.Question;
import com.answers.entity.User;
import com.answers.service.IQuestionService;
import com.answers.utils.TransactionUtil;

public class QuestionServiceImpl implements IQuestionService{
	private IQuestionDao questionDao= null;
	
	public QuestionServiceImpl() {
		questionDao = new QuestionDaoImpl();
	}
	
	
	//获取当前页面的问题数据,包括问题，提问人，和标签
	@Override
	public Page<QULs> queryQuestionAndUserAndLabel(int currentPage, int pageSize) {
		try {
			//开启事务
			TransactionUtil.startTransaction();
			
			List<QULs> qulsList = new ArrayList<QULs>();
			
			int totalCount = questionDao.queryTechnicalCount();
			
			List<Question> queryTechnicalList = questionDao.queryTechnicalList(currentPage, pageSize);
			
			//循环每一个问题，找到对应问题的用户信息和标签信息
			for (Question question : queryTechnicalList) {
				String userid = question.getUserid();
				//查找到对应的用户信息
				User user = questionDao.queryUserByUserId(userid);
				
				String questionId = question.getId();
				//找到对应问题的标签
				List<Label> labelList = questionDao.queryLabelByQuestionId(Integer.parseInt(questionId));
				
				QULs quls = new QULs();
				quls.setQuestion(question);
				quls.setUser(user);
				quls.setLabelList(labelList);
				
				qulsList.add(quls);
			}
			
			Page<QULs> page = new Page<QULs>();
			
			page.setCurrentPage(currentPage);
			page.setPageList(qulsList);
			page.setTotalCount(totalCount);
			page.setPageSize(pageSize);
			
			
			
			//提交事务
			TransactionUtil.commitTransaction();
			return page;
		}catch(Exception e) {
			TransactionUtil.rollbackTransaction();
		}finally {
			TransactionUtil.close();
		}
		return null;
	}

}
