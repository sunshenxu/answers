package com.answers.dao.impl;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;

import com.answers.dao.IUserDao;
import com.answers.entity.User;
import com.answers.utils.DbcpUtil;

public class UserDaoImpl implements IUserDao{
	private DataSource dataSource = DbcpUtil.getBasicDataSourceByProperties();
	
	//向用户表中插入一条数据
	@Override
	public int insertUser(User user) {
		QueryRunner runner = new QueryRunner(dataSource);
		String sql = "insert into user(userid,passwd,name) value(?,?,?)";
		Object[] param = new Object[] {user.getUserId(),user.getPassWd(),user.getName()};
		try {
			int count = runner.update(sql, param);
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	//查询当前账号是否存在
	@Override
	public int queryUserByUserId(User user) {
		QueryRunner runner = new QueryRunner(dataSource);
		String sql = "select count(1) from user where userid=?";
		try {
			Object[] obj = runner.query(sql, new ArrayHandler(), user.getUserId());
			int count = Integer.parseInt(obj[0].toString());
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	

}
