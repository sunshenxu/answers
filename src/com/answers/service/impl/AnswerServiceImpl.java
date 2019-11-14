package com.answers.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.answers.dao.IAnswerDao;
import com.answers.dao.IQuestionDao;
import com.answers.dao.impl.AnswerDaoImpl;
import com.answers.dao.impl.QuestionDaoImpl;
import com.answers.entity.AUs;
import com.answers.entity.Huida;
import com.answers.entity.Page;
import com.answers.entity.User;
import com.answers.service.IAnswerService;
import com.answers.utils.TransactionUtil;

public class AnswerServiceImpl implements IAnswerService {
	private IAnswerDao answerDao = null;
	private IQuestionDao questionDao = null;
	public AnswerServiceImpl() {
		answerDao = new AnswerDaoImpl();
		questionDao = new QuestionDaoImpl();
	}
	
	//获取获取对应问题的当前页的回答列表
	@Override
	public Page<AUs> queryCurrentPage(int currentPage, int pageSize, String type, int questionId, String sortType) {
		try {
			//开启事务
			TransactionUtil.startTransaction();
			String sql = "";
			String sql1 = "";
			if("1".equals(type)) {
				if("1".equals(sortType)) {
					sql = "select * from technicalanswer where technicalid = ? order by  answertime desc limit ?,?";
				}else if("2".equals(sortType)){
					sql = "select * from technicalanswer where technicalid = ? order by  votecount desc limit ?,?";
				}
				
				sql1 = "select count(1) from technicalanswer where technicalid = ?";
				
			}else if("2".equals(type)) {
				if("1".equals(sortType)) {
					sql = "select * from interviewalanswer where interviewid = ? order by answertime desc limit ?,?";
				}else if("2".equals(sortType)){
					sql = "select * from interviewalanswer where interviewid = ? order by votecount desc limit ?,?";
				}
				sql1 = "select count(1) from interviewalanswer where interviewid = ?";
				
			}else if("3".equals(type)) {
				if("1".equals(sortType)) {
					sql = "select * from taskalanswer where taskid = ? order by answertime desc limit ?,?";
				}else if("2".equals(sortType)){
					sql = "select * from taskalanswer where taskid = ? order by votecount desc limit ?,?";
				}
				sql1 = "select count(1) from taskalanswer where taskid = ?";
			}
			
			
			List<Huida> huidaList = answerDao.queryHuidaByQuestionIdDao(currentPage, pageSize, questionId, sql);
			
			List<AUs> ausList = new ArrayList<AUs>();
			for (Huida huida : huidaList) {
				String userid = huida.getUserid();
				User user = questionDao.queryUserByUserId(userid);
				AUs aus = new AUs();
				aus.setHuida(huida);
				aus.setUser(user);
				ausList.add(aus);
				
			}
			
			Page<AUs> page = new Page<AUs>();
			
			
			int totalCount = answerDao.queryHuidaCountDao(questionId, sql1);
			
			page.setCurrentPage(currentPage);
			page.setPageList(ausList);
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

	
	//添加一个问题回答
	@Override
	public int addQuestionAnswerService(Huida huida, String type) {
		try {
			//开启事务
			TransactionUtil.startTransaction();
			
			String sql = "";
			String sql1 = "";
			if("1".equals(type)) {
				sql = "insert into technicalanswer(content,answertime,votecount,userid,technicalid) values(?,?,?,?,?)";
				sql1 = "update technical set answercount = answercount+? where id=?";
			}else if("2".equals(type)) {
				sql = "insert into interviewalanswer(content,answertime,votecount,userid,interviewid) values(?,?,?,?,?)";
				sql1 = "update interview set answercount = answercount+? where id=?";
			}else if("3".equals(type)) {
				sql = "insert into taskalanswer(content,answertime,votecount,userid,taskid) values(?,?,?,?,?)";
				sql1 = "update task set answercount = answercount+? where id=?";
			}
			
			int count = answerDao.addHuidaDao(huida, sql);
			int c = -1;
			if(count==1) {
				
				c = questionDao.updateAnswercountDao(sql1, 1,huida.getQuestionid());
			}
			
			TransactionUtil.commitTransaction();
			
			return c;
			
		}catch(Exception e) {
			TransactionUtil.rollbackTransaction();
		}finally {
			TransactionUtil.close();
		}
		
		
		return 0;
	}

	
	

	//修改投票数
	@Override
	public int addVotecountService(int answerId, String type, int num) {
		String sql = "";
		if("1".equals(type)) {
			sql = "update technicalanswer set votecount=votecount+? where id=? ";
		}else if("2".equals(type)) {
			sql = "update interviewalanswer set votecount=votecount+? where id=? ";
		}else if("3".equals(type)) {
			sql = "update taskalanswer set votecount=votecount+? where id=? ";
		}
		int count = answerDao.addVotecountDao(sql, num, answerId);
		
		return count;
	}
	
	
	
	
	
}
