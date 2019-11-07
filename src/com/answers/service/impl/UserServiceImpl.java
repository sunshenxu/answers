package com.answers.service.impl;

import com.answers.dao.IUserDao;
import com.answers.dao.impl.UserDaoImpl;
import com.answers.entity.User;
import com.answers.service.IUserService;

public class UserServiceImpl implements IUserService{
	private IUserDao userDao= null;
	
	public UserServiceImpl() {
		userDao = new UserDaoImpl();
	}
	
	
	//添加一条用户
	@Override
	public int AddUserService(User user) {
		//先查询是否有该用户
		int count = userDao.queryUserByUserId(user.getUserId());
		int flag = -1;
		if(count == 1) {  		//有该用户
			flag = 0;
		}else if(count == 0) {    //没有该用户
			flag = userDao.insertUser(user);  //保存用户信息
		}
		
		return flag;
	}


	
	//用户登录
	@Override
	public User login(String userId, String passWd) {
		
		return userDao.queryUserByIdAndPwd(userId, passWd);
	}

	
	//根据账号查询用户是否存在
	@Override
	public int queryUserById(String userId) {
		
		return userDao.queryUserByUserId(userId);
	}
	
	
	

}
