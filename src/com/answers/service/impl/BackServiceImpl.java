package com.answers.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.answers.dao.IBackDao;
import com.answers.dao.IQuestionDao;
import com.answers.dao.impl.BackDaoImpl;
import com.answers.dao.impl.QuestionDaoImpl;
import com.answers.entity.BackUser;
import com.answers.entity.BiaoGe;
import com.answers.entity.QUname;
import com.answers.entity.Question;
import com.answers.entity.User;
import com.answers.service.IBackService;
import com.answers.utils.TransactionUtil;

public class BackServiceImpl implements IBackService {
	private IBackDao backDao= null;
	private IQuestionDao questionDao= null;
	
	public BackServiceImpl() {
		backDao = new BackDaoImpl();
		questionDao = new QuestionDaoImpl();
	}
	
	//根据id和passwd查询指定的用户
	@Override
	public BackUser queryIdAndPasswdService(String userId, String psswd) {
		
		return backDao.queryIdAndPasswdDao(userId, psswd);
	}

	//根据用户id修改密码
	@Override
	public int updatePasswdByIdService(String userId, String passwd) {
		return backDao.updatePasswdByIdDao(userId, passwd);
	}

	//根据id查询用户
	@Override
	public BackUser queryIdService(String userId) {
		return backDao.queryIdDao(userId);
	}

	//查询当前页的问题列表
	@Override
	public BiaoGe<QUname> queryQUService(int currentPage, int pageSize,String qtype) {
		try {
			//开启事务
			TransactionUtil.startTransaction();
			List<QUname> qulsList = new ArrayList<QUname>();
			int totalCount = 0;
			
			List<Question> queryList = null;
			String qty = "";
			
			totalCount = questionDao.queryQuestionCount(qtype, "1");
			queryList = questionDao.queryQuestionList(currentPage, pageSize, qtype, "1");
			if("1".equals(qtype)) {
				qty = "技术问答";
			}else if("2".equals(qtype)) {
				qty = "面试题";
			}else if("3".equals(qtype)) {
				qty = "作业回答";
			}
			
			
			
			
			//循环每一个问题，找到对应问题的用户信息和标签信息
			for (Question question : queryList) {
				String userid = question.getUserid();
				//查找到对应的用户信息
				User user = questionDao.queryUserByUserId(userid);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
				QUname qu = new QUname();
				qu.setId(question.getId());
				qu.setAlerttime(sdf.format(question.getAltertime()));
				qu.setCount(question.getAnswercount());
				qu.setCreatetime(sdf.format(question.getReleasetime()));
				qu.setStatus(question.getStatus());
				qu.setTitle(question.getTitle());
				qu.setType(qty);
				qu.setUsername(user.getName());
				
				qulsList.add(qu);
				
			}
			
			
			
			
			
			/*Page<QUname> page = new Page<QUname>();
			page.setCurrentPage(currentPage);
			page.setPageList(qulsList);
			page.setTotalCount(totalCount);
			page.setPageSize(pageSize);*/
			
			BiaoGe<QUname> page = new BiaoGe<QUname>();
			page.setCode(0);
			page.setCount(totalCount);
			page.setMsg("");
			page.setData(qulsList);
			
			
			
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

	
	//修改问题的状态
	@Override
	public int updateStatusService(int id, String type, String status) {
		String sql = "";
		if("1".equals(type)) {
			sql = "update technical set status=? where id=?";
		}else if("2".equals(type)) {
			sql = "update interview set status=? where id=?";
		}else if("3".equals(type)) {
			sql = "update task set status=? where id=?";
		}
		int count = backDao.updateStatusDao(id, status, sql);
		
		return count;
		
	}

}
