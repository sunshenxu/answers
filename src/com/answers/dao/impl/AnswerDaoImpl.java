package com.answers.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.answers.dao.IAnswerDao;
import com.answers.entity.Huida;
import com.answers.utils.DbcpUtil;
import com.answers.utils.TransactionUtil;

public class AnswerDaoImpl implements IAnswerDao {
	private DataSource dataSource = DbcpUtil.getBasicDataSourceByProperties();
	
	//根据问题id查询对应的回答列表
	@Override
	public List<Huida> queryHuidaByQuestionIdDao(int currentPage, int pageSize, int questionId, String sql) {
		Connection conn = TransactionUtil.getConnection();
		QueryRunner runner = new QueryRunner();
		
		try {
			List<Huida> huidaList = runner.query(conn, sql, new BeanListHandler<Huida>(Huida.class), questionId,(currentPage-1)*pageSize,pageSize);
			
			return huidaList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	//查询回答的总数据
	@Override
	public int queryHuidaCountDao(int questionId, String sql) {
		Connection conn = TransactionUtil.getConnection();
		QueryRunner runner = new QueryRunner();
		
		try {
			Object[] obj = runner.query(conn, sql, new ArrayHandler(),questionId);
			int count = Integer.parseInt(obj[0].toString());
			
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	//插入一条回答数据
	@Override
	public int addHuidaDao(Huida huida, String sql) {
		Connection conn = TransactionUtil.getConnection();
		QueryRunner runner = new QueryRunner();
		
		try {
			int count = runner.update(conn, sql, huida.getContent(),huida.getAnswertime(),huida.getVotecount(),huida.getUserid(),huida.getQuestionid());
			
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
