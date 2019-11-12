package com.answers.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import org.apache.commons.dbutils.QueryRunner;

import com.answers.dao.IPutQuestionDao;
import com.answers.entity.Question;
import com.answers.utils.TransactionUtil;
import com.mysql.jdbc.Statement;

public class PutQuestionDaoImpl implements IPutQuestionDao {
	
	@Override
	public int addQuestionDao(Question question, String sql) {
		Connection conn = TransactionUtil.getConnection();
		
		try {
			PreparedStatement pcmd = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			
			pcmd.setString(1, question.getTitle());
			pcmd.setString(2, question.getContent());
			pcmd.setTimestamp(3, new Timestamp(question.getReleasetime().getTime()));
			pcmd.setInt(4, question.getVotecount());
			pcmd.setInt(5, question.getAnswercount());
			pcmd.setInt(6, question.getBrowsecount());
			pcmd.setString(7, question.getUserid());
			
			int count = pcmd.executeUpdate();
			
			
			
			ResultSet generatedKeys = pcmd.getGeneratedKeys();
			generatedKeys.next();
			int id = generatedKeys.getInt(1);  //获取主键的值
			
			//System.out.println(id);
			return id;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int addLabelByQuestionIdDao(String sql, int questionId, int labelId) {
		Connection conn = TransactionUtil.getConnection();
		QueryRunner runner = new QueryRunner();
		try {
			int count = runner.update(conn,sql,questionId,labelId);
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

}
