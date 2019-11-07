package com.answers.dao;

import com.answers.entity.User;

public interface IUserDao {
	//向用户表中插入一条数据
	public int insertUser(User user);
	
	//查询当前账号是否存在
	public int queryUserByUserId(User user);
	
}
