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
		int count = userDao.queryUserByUserId(user);
		int flag = -1;
		if(count == 1) {  		//有该用户
			flag = 0;
		}else if(count == 0) {    //没有该用户
			flag = userDao.insertUser(user);  //保存用户信息
		}
		
		return flag;
	}

}
