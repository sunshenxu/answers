package com.answers.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.answers.dao.IQuestionDao;
import com.answers.entity.Label;
import com.answers.entity.Question;
import com.answers.entity.User;
import com.answers.utils.DbcpUtil;
import com.answers.utils.TransactionUtil;

public class QuestionDaoImpl implements IQuestionDao{
	private DataSource dataSource = DbcpUtil.getBasicDataSourceByProperties();
	
	//查询当前页面的问题，不带标签查询
	@Override
	public List<Question> queryQuestionList(int currentPage, int pageSize, String questionType, String sortType) {
		
		Connection connection = TransactionUtil.getConnection();
		QueryRunner runner = new QueryRunner();
		String sql = "";
		if("1".equals(questionType)) {
			if("1".equals(sortType)) {
				sql = "select * from technical ORDER BY releasetime DESC limit ?,?";
			}else if("2".equals(sortType)) {
				sql = "select * from technical WHERE answercount=0 limit ?,?";
			}else if("3".equals(sortType)) {
				sql = "select * from technical ORDER BY browsecount DESC limit ?,?";
			}
		}else if("2".equals(questionType)) {
			if("1".equals(sortType)) {
				sql = "select * from interview ORDER BY releasetime DESC limit ?,?";
			}else if("2".equals(sortType)) {
				sql = "select * from interview WHERE answercount=0 limit ?,?";
			}else if("3".equals(sortType)) {
				sql = "select * from interview ORDER BY browsecount DESC limit ?,?";
			}
			
		}else if("3".equals(questionType)) {
			if("1".equals(sortType)) {
				sql = "select * from task ORDER BY releasetime DESC limit ?,?";
			}else if("2".equals(sortType)) {
				sql = "select * from task WHERE answercount=0 limit ?,?";
			}else if("3".equals(sortType)) {
				sql = "select * from task ORDER BY browsecount DESC limit ?,?";
			}
		}
		
		try {
			
			List<Question> questionList = runner.query(connection, sql, new BeanListHandler<Question>(Question.class), (currentPage-1)*pageSize, pageSize);
			return questionList;
			
			/*
			 * 	SELECT a.*,b.name FROM technical AS a,USER AS b WHERE a.userid = b.userid;
			 
				SELECT * FROM technicalflag,label WHERE technicalflag.technicalid=1 AND technicalflag.labelid = label.id;
				
				SELECT a.*,b.name FROM technical AS a INNER JOIN USER AS b ON a.userid = b.userid;
				
				SELECT b.content FROM technicalflag AS a INNER JOIN label AS b ON a.technicalid=1 AND a.labelid=b.id;
			*/
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	
	//查询当前页面的问题，带标签查询
	@Override
	public List<Question> queryQuestionList(int currentPage, int pageSize, String questionType, String sortType,int labelId) {
		
		Connection connection = TransactionUtil.getConnection();
		QueryRunner runner = new QueryRunner();
		String sql = "";
		if("1".equals(questionType)) {
			if("1".equals(sortType)) {
				sql = "SELECT a.* FROM technical AS a INNER JOIN technicalflag AS b ON  a.id=b.technicalid AND b.labelid=? ORDER BY releasetime DESC LIMIT ?,?";
			}else if("2".equals(sortType)) {
				sql = "SELECT a.* FROM technical AS a INNER JOIN technicalflag AS b ON  a.id=b.technicalid AND b.labelid=? AND a.answercount=0 ORDER BY releasetime DESC LIMIT ?,?";
			}else if("3".equals(sortType)) {
				sql = "SELECT a.* FROM technical AS a INNER JOIN technicalflag AS b ON  a.id=b.technicalid AND b.labelid=? ORDER BY browsecount DESC LIMIT ?,?";
			}
		}else if("2".equals(questionType)) {
			if("1".equals(sortType)) {
				sql = "SELECT a.* FROM interview AS a INNER JOIN interviewflag AS b ON  a.id=b.interviewid AND b.labelid=? ORDER BY releasetime DESC LIMIT ?,?";
			}else if("2".equals(sortType)) {
				sql = "SELECT a.* FROM interview AS a INNER JOIN interviewflag AS b ON  a.id=b.interviewid AND b.labelid=? AND a.answercount=0 ORDER BY releasetime DESC LIMIT ?,?";
			}else if("3".equals(sortType)) {
				sql = "SELECT a.* FROM interview AS a INNER JOIN interviewflag AS b ON  a.id=b.interviewid AND b.labelid=? ORDER BY browsecount DESC LIMIT ?,?";
			}
			
		}else if("3".equals(questionType)) {
			if("1".equals(sortType)) {
				sql = "SELECT a.* FROM task AS a INNER JOIN taskflag AS b ON  a.id=b.taskid AND b.labelid=? ORDER BY releasetime DESC LIMIT ?,?";
			}else if("2".equals(sortType)) {
				sql = "SELECT a.* FROM task AS a INNER JOIN taskflag AS b ON  a.id=b.taskid AND b.labelid=? AND a.answercount=0 ORDER BY releasetime DESC LIMIT ?,?";
			}else if("3".equals(sortType)) {
				sql = "SELECT a.* FROM task AS a INNER JOIN taskflag AS b ON  a.id=b.taskid AND b.labelid=? ORDER BY browsecount DESC LIMIT ?,?";
			}
		}
		
		try {
			
			List<Question> questionList = runner.query(connection, sql, new BeanListHandler<Question>(Question.class),labelId,(currentPage-1)*pageSize, pageSize);
			return questionList;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
	//查询问题对应的用户
	@Override
	public User queryUserByUserId(String userId){
		Connection connection = TransactionUtil.getConnection();
		
		QueryRunner runner = new QueryRunner();
		
		String sql = "select userid,passwd,name from user where userid=?";
		 
		try {
			User user = runner.query(connection, sql, new BeanHandler<User>(User.class), userId);
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}



	//查询问题对应的标签
	@Override
	public List<Label> queryLabelByQuestionId(int questionId, String questionType) {
		Connection connection = TransactionUtil.getConnection();
		
		QueryRunner runner = new QueryRunner();
		
		String sql = "";
		if("1".equals(questionType)) {
			sql = "SELECT b.id,b.content FROM technicalflag AS a INNER JOIN label AS b ON a.technicalid=? AND a.labelid=b.id";
		}else if("2".equals(questionType)) {
			sql = "SELECT b.id,b.content FROM interviewflag AS a INNER JOIN label AS b ON a.interviewid=? AND a.labelid=b.id";
		}else if("3".equals(questionType)) {
			sql = "SELECT b.id,b.content FROM taskflag AS a INNER JOIN label AS b ON a.taskid=? AND a.labelid=b.id";
		}
		
		
		try {
			List<Label> labelList = runner.query(connection, sql, new BeanListHandler<Label>(Label.class), questionId);
			return labelList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}


	//查询问题的总数，没有标签
	@Override
	public int queryQuestionCount(String questionType, String sortType) {
		Connection connection = TransactionUtil.getConnection();
		QueryRunner runner = new QueryRunner();
		
		String sql = "";
		
		if("1".equals(questionType)) {
			if("2".equals(sortType)) {
				sql = "select count(1) from technical where answercount=0";
			}else {
				sql = "select count(1) from technical";
			}
		}else if("2".equals(questionType)) {
			if("2".equals(sortType)) {
				sql = "select count(1) from interview where answercount=0";
			}else {
				sql = "select count(1) from interview";
			}
			
		}else if("3".equals(questionType)) {
			if("2".equals(sortType)) {
				sql = "select count(1) from task where answercount=0";
			}else {
				sql = "select count(1) from task";
			}
			
		}
		
		try {
			Object[] obj = runner.query(connection, sql, new ArrayHandler());
			
			int count = Integer.parseInt(obj[0].toString());
			
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}

	
	
	//查询问题的总数，有标签
	@Override
	public int queryQuestionCount(String questionType, String sortType,int labelId) {
		Connection connection = TransactionUtil.getConnection();
		QueryRunner runner = new QueryRunner();
		
		String sql = "";
		
		if("1".equals(questionType)) {
			if("2".equals(sortType)) {
				sql = "SELECT COUNT(1) FROM technical AS a INNER JOIN technicalflag AS b ON a.answercount=0 AND a.id=b.technicalid AND b.labelid=?";
			}else {
				sql = "SELECT COUNT(1) FROM technical AS a INNER JOIN technicalflag AS b ON a.id=b.technicalid AND b.labelid=?";
			}
		}else if("2".equals(questionType)) {
			if("2".equals(sortType)) {
				sql = "SELECT COUNT(1) FROM interview AS a INNER JOIN interviewflag AS b ON a.answercount=0 AND a.id=b.interviewid AND b.labelid=?";
			}else {
				sql = "SELECT COUNT(1) FROM interview AS a INNER JOIN interviewflag AS b ON a.id=b.interviewid AND b.labelid=?";
			}
			
		}else if("3".equals(questionType)) {
			if("2".equals(sortType)) {
				sql = "SELECT COUNT(1) FROM task AS a INNER JOIN taskflag AS b ON a.answercount=0 AND a.id=b.taskid AND b.labelid=?";
			}else {
				sql = "SELECT COUNT(1) FROM task AS a INNER JOIN taskflag AS b ON a.id=b.taskid AND b.labelid=?";
			}
			
		}
		
		try {
			Object[] obj = runner.query(connection, sql, new ArrayHandler(),labelId);
			
			int count = Integer.parseInt(obj[0].toString());
			
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}

	


	//查询所有的标签
	@Override
	public List<Label> queryAllLabelDao() {
		QueryRunner runner = new QueryRunner(dataSource);
		String sql = "select * from label";
		try {
			List<Label> list = runner.query(sql, new BeanListHandler<Label>(Label.class));
			
			return list;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}




	//按照technical表中的标题模糊查询
	@Override
	public List<Question> serchTechnicalTitleDao(int currentPage, int pageSize,String serchVal) {
		Connection connection = TransactionUtil.getConnection();
		QueryRunner runner = new QueryRunner();
		String sql = "SELECT * FROM technical WHERE title LIKE ? LIMIT ?,?";
		
		try {
			
			List<Question> questionList = runner.query(connection, sql, new BeanListHandler<Question>(Question.class), "%"+serchVal+"%",(currentPage-1)*pageSize,pageSize);
			return questionList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	//按照interview表中的标题模糊查询
	@Override
	public List<Question> serchInterviewTitleDao(int currentPage, int pageSize,String serchVal) {
		Connection connection = TransactionUtil.getConnection();
		QueryRunner runner = new QueryRunner();
		String sql = "SELECT * FROM interview WHERE title LIKE ? LIMIT ?,?";
		
		try {
			List<Question> questionList = runner.query(connection, sql, new BeanListHandler<Question>(Question.class), "%"+serchVal+"%",(currentPage-1)*pageSize,pageSize);
			return questionList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	//按照task表中的标题模糊查询
	@Override
	public List<Question> serchTaskTitleDao(int currentPage, int pageSize,String serchVal) {
		Connection connection = TransactionUtil.getConnection();
		QueryRunner runner = new QueryRunner();
		String sql = "SELECT * FROM task WHERE title LIKE ? LIMIT ?,?";
		
		try {
			List<Question> questionList = runner.query(connection, sql, new BeanListHandler<Question>(Question.class), "%"+serchVal+"%",(currentPage-1)*pageSize,pageSize);
			return questionList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	

	//查询technical按照标题模糊查询的总问题数
	@Override
	public int serchTechnicalTitleCountDao(String serchVal) {
		Connection connection = TransactionUtil.getConnection();
		QueryRunner runner = new QueryRunner();
		String sql = "SELECT count(1) FROM technical WHERE title LIKE ?";
		
		try {
			Object[] obj = runner.query(connection, sql, new ArrayHandler(),"%"+serchVal+"%");
			
			int count = Integer.parseInt(obj[0].toString());
			
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	//查询interview按照标题模糊查询的总问题数
	@Override
	public int serchInterviewTitleCountDao(String serchVal) {
		Connection connection = TransactionUtil.getConnection();
		QueryRunner runner = new QueryRunner();
		String sql = "SELECT count(1) FROM interview WHERE title LIKE ?";
		
		try {
			Object[] obj = runner.query(connection, sql, new ArrayHandler(),"%"+serchVal+"%");
			
			int count = Integer.parseInt(obj[0].toString());
			
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
		
		
	//查询task按照标题模糊查询的总问题数
	@Override
	public int serchTaskTitleCountDao(String serchVal) {
		Connection connection = TransactionUtil.getConnection();
		QueryRunner runner = new QueryRunner();
		String sql = "SELECT count(1) FROM task WHERE title LIKE ?";
		
		try {
			Object[] obj = runner.query(connection, sql, new ArrayHandler(),"%"+serchVal+"%");
			
			int count = Integer.parseInt(obj[0].toString());
			
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}


	//根据问题的id查询对应的问题
	@Override
	public Question queryQuestionByIdDao(int questionId, String sql) {
		Connection connection = TransactionUtil.getConnection();
		QueryRunner runner = new QueryRunner();
		
		try {
			Question question = runner.query(connection, sql, new BeanHandler<Question>(Question.class), questionId);
			
			return question;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}


	//修改问题的回答数
	@Override
	public int updateAnswercountDao(String sql,int num,int questionId) {
		Connection conn = TransactionUtil.getConnection();
		QueryRunner runner = new QueryRunner();
		
		try {
			int count = runner.update(conn, sql,num,questionId);
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}
	
	//浏览数加指定的值
	@Override
	public int addBrowsecountDao(String sql, int num, int id) {
		
		QueryRunner runner = new QueryRunner(dataSource);
		try {
			int count = runner.update(sql, num, id);
			
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}


	//投票数加指定的数
	@Override
	public int addVotecountDao(String sql, int num, int answerId) {
		QueryRunner runner = new QueryRunner(dataSource);
		try {
			int count = runner.update(sql, num, answerId);
			
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}
	
	
	

}
