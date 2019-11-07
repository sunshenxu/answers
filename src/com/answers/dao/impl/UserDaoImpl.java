package com.answers.dao.impl;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.answers.dao.IUserDao;
import com.answers.entity.User;
import com.answers.utils.DbcpUtil;

public class UserDaoImpl implements IUserDao{
	private DataSource dataSource = DbcpUtil.getBasicDataSourceByProperties();
	
	//向用户表中插入一条数据 1表示成功，0表示不成功 ，-1表示异常
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
	
	//查询当前账号是否存在   1表示存在，0表示不存在 ，-1表示异常
	@Override
	public int queryUserByUserId(String userId) {
		QueryRunner runner = new QueryRunner(dataSource);
		String sql = "select count(1) from user where userid=?";
		try {
			Object[] obj = runner.query(sql, new ArrayHandler(), userId);
			int count = Integer.parseInt(obj[0].toString());
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	
	//用户登录，根据账号和密码查询对应的user对象 ，null表示账号密码不匹配
	@Override
	public User queryUserByIdAndPwd(String userId, String passWd) {
		QueryRunner runner = new QueryRunner(dataSource);
		String sql = "select userid,passwd,name from user where userid=? and passwd=?";
		try {
			User user = runner.query(sql, new BeanHandler<User>(User.class), userId,passWd);
			
			return user;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	

}
