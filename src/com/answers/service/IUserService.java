package com.answers.service;

import com.answers.entity.User;

public interface IUserService {
	
	//添加一条用户
	public int AddUserService(User user);

	//用户登录
	public User login(String userId, String passWd);
	
	//根据账号查询用户是否存在
	public int queryUserById(String userId);
	
}
