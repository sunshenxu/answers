package com.answers.dao;

import com.answers.entity.User;

public interface IUserDao {
	//向用户表中插入一条数据
	public int insertUser(User user);
	
	//查询当前账号是否存在
	public int queryUserByUserId(String userId);
	
	//用户登录，根据账号和密码查询对应的user对象
	public User queryUserByIdAndPwd(String userId, String passWd);
	
	
}
