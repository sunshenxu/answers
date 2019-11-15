package com.answers.dao.impl;


import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.answers.dao.IBackDao;
import com.answers.entity.BackUser;
import com.answers.utils.DbcpUtil;

public class BackDaoImpl implements IBackDao {
	private DataSource dataSource = DbcpUtil.getBasicDataSourceByProperties();
	
	//根据id和passwd查询指定的用户
	@Override
	public BackUser queryIdAndPasswdDao(String userId,String psswd) {
		QueryRunner runner = new QueryRunner(dataSource);
		String sql = "select * from backuser where userid=? and passwd=?";
		try {
			BackUser backUser = runner.query(sql, new BeanHandler<BackUser>(BackUser.class), userId,psswd);
			
			return backUser;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	//根据用户id修改密码
	@Override
	public int updatePasswdByIdDao(String userId, String passwd) {
		
		QueryRunner runner = new QueryRunner(dataSource);
		String sql = "update backuser set passwd=? where userId=?";
		try {
			int count = runner.update(sql, passwd, userId);
			
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public BackUser queryIdDao(String userId) {
		QueryRunner runner = new QueryRunner(dataSource);
		String sql = "select * from backuser where userid=?";
		try {
			BackUser backUser = runner.query(sql, new BeanHandler<BackUser>(BackUser.class), userId);
			
			return backUser;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	
	//修改问题的状态
	@Override
	public int updateStatusDao(int id, String status,String sql) {
		QueryRunner runner = new QueryRunner(dataSource);
		String sts = "";
		if("0".equals(status)) {
			sts = "不通过";
		}else if("1".equals(status)) {
			sts = "通过";
		}
		
		try {
			int count = runner.update(sql, sts, id);
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}

	

}
