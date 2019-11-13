package com.answers.service.impl;


import java.util.ArrayList;
import java.util.List;

import com.answers.dao.IQuestionDao;
import com.answers.dao.impl.QuestionDaoImpl;
import com.answers.entity.AUs;
import com.answers.entity.Huida;
import com.answers.entity.Label;
import com.answers.entity.Page;
import com.answers.entity.QU;
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
	public Page<QULs> queryQuestionAndUserAndLabel(int currentPage, int pageSize, String questionType, String sortType,int labelId) {
		try {
			//开启事务
			TransactionUtil.startTransaction();
			
			List<QULs> qulsList = new ArrayList<QULs>();
			
			int totalCount = 0;
			List<Question> queryList = null;
			if(labelId==-1) {  //不带标签查找
				totalCount = questionDao.queryQuestionCount(questionType, sortType);
				queryList = questionDao.queryQuestionList(currentPage, pageSize, questionType, sortType);
				
			}else {  //带标签查找
				totalCount = questionDao.queryQuestionCount(questionType, sortType, labelId);
				queryList = questionDao.queryQuestionList(currentPage, pageSize, questionType, sortType,labelId);
			}
			
			//循环每一个问题，找到对应问题的用户信息和标签信息
			for (Question question : queryList) {
				String userid = question.getUserid();
				//查找到对应的用户信息
				User user = questionDao.queryUserByUserId(userid);
				
				int questionId = question.getId();
				//找到对应问题的标签
				List<Label> labelList = questionDao.queryLabelByQuestionId(questionId,questionType);
				
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


	//查询所有的标签
	@Override
	public List<Label> queryAllLabelService() {
		
		return questionDao.queryAllLabelDao();
	}

	
	//按照标题内容模糊查询
	@Override
	public Page<QULs> queryQuestionByTitle(int currentPage, int pageSize, String serchVal) {
		try {
			//开启事务
			TransactionUtil.startTransaction();
			
			List<QULs> qulsList = new ArrayList<QULs>();
			
			List<Question> queryList1 = questionDao.serchTechnicalTitleDao(currentPage, pageSize, serchVal);
			List<Question> queryList2 = questionDao.serchInterviewTitleDao(currentPage, pageSize, serchVal);
			List<Question> queryList3 = questionDao.serchTaskTitleDao(currentPage, pageSize, serchVal);
			
			
			int totalCount = 0;
			int count1 = questionDao.serchInterviewTitleCountDao(serchVal);
			int count2 = questionDao.serchTaskTitleCountDao(serchVal);
			int count3 = questionDao.serchTechnicalTitleCountDao(serchVal);
			
			totalCount = count1+count2+count3;
			
			//循环每一个问题，找到对应问题的用户信息和标签信息
			for (Question question : queryList1) {
				String userid = question.getUserid();
				//查找到对应的用户信息
				User user = questionDao.queryUserByUserId(userid);
				
				int questionId = question.getId();
				//找到对应问题的标签
				List<Label> labelList = questionDao.queryLabelByQuestionId(questionId,"1");
				
				QULs quls = new QULs();
				quls.setQuestion(question);
				quls.setUser(user);
				quls.setLabelList(labelList);
				
				qulsList.add(quls);
			}
			//循环每一个问题，找到对应问题的用户信息和标签信息
			for (Question question : queryList2) {
				String userid = question.getUserid();
				//查找到对应的用户信息
				User user = questionDao.queryUserByUserId(userid);
				
				int questionId = question.getId();
				//找到对应问题的标签
				List<Label> labelList = questionDao.queryLabelByQuestionId(questionId,"1");
				
				QULs quls = new QULs();
				quls.setQuestion(question);
				quls.setUser(user);
				quls.setLabelList(labelList);
				
				qulsList.add(quls);
			}
			//循环每一个问题，找到对应问题的用户信息和标签信息
			for (Question question : queryList3) {
				String userid = question.getUserid();
				//查找到对应的用户信息
				User user = questionDao.queryUserByUserId(userid);
				
				int questionId = question.getId();
				//找到对应问题的标签
				List<Label> labelList = questionDao.queryLabelByQuestionId(questionId,"1");
				
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


	
	//根据问题id获取问题的内容和用户
	@Override
	public QU queryQuestionByQuestionID(int questionId, String type) {
		try {
			//开启事务
			TransactionUtil.startTransaction();
			String sql = "";
			if("1".equals(type)) {
				sql = "select * from technical where id = ?";
				
			}else if("2".equals(type)) {
				sql = "select * from interview where id = ?";
				
			}else if("3".equals(type)) {
				sql = "select * from task where id = ?";
			}
			
			Question question = questionDao.queryQuestionByIdDao(questionId, sql);
			
			String userid = question.getUserid();
			
			User user = questionDao.queryUserByUserId(userid);
			
			QU qu = new QU();
			qu.setQuestion(question);
			qu.setUser(user);
			
			
			//提交事务
			TransactionUtil.commitTransaction();
			return qu;
			
			
		}catch(Exception e) {
			TransactionUtil.rollbackTransaction();
		}finally {
			TransactionUtil.close();
		}
		
		return null;
	}

}
