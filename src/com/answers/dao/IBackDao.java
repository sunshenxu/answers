package com.answers.dao;

import com.answers.entity.BackUser;
import com.answers.entity.Page;
import com.answers.entity.QU;

public interface IBackDao {
	//根据id和passwd查询指定的用户
	public BackUser queryIdAndPasswdDao(String userId,String psswd);
	
	//根据用户id修改密码
	public int updatePasswdByIdDao(String userId, String passwd);
	
	//根据id查询用户
	public BackUser queryIdDao(String userId);
	
	
	//修改问题的状态
	public int updateStatusDao(int id, String status, String sql);
	
	
}
