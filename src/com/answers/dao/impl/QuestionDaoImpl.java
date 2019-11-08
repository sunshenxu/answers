package com.answers.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
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
	
	//查询当前页面的问题
	@Override
	public List<Question> queryTechnicalList(int currentPage, int pageSize) {
		
		Connection connection = TransactionUtil.getConnection();
		QueryRunner runner = new QueryRunner();
		String sql = "select * from technical limit ?,? ";
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
	public List<Label> queryLabelByQuestionId(int questionId) {
		Connection connection = TransactionUtil.getConnection();
		
		QueryRunner runner = new QueryRunner();
		
		String sql = "SELECT b.id,b.content FROM technicalflag AS a INNER JOIN label AS b ON a.technicalid=? AND a.labelid=b.id";
		try {
			List<Label> labelList = runner.query(connection, sql, new BeanListHandler<Label>(Label.class), questionId);
			return labelList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}


	//查询问题的总数
	@Override
	public int queryTechnicalCount() {
		Connection connection = TransactionUtil.getConnection();
		QueryRunner runner = new QueryRunner();
		String sql = "select count(1) from technical";
		try {
			Object[] obj = runner.query(connection, sql, new ArrayHandler());
			
			int count = Integer.parseInt(obj[0].toString());
			
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}
	
	
	
	
	

}
