package com.answers.service;

import com.answers.entity.BackUser;
import com.answers.entity.BiaoGe;
import com.answers.entity.QUname;

public interface IBackService {
	//根据id和passwd查询指定的用户
	public BackUser queryIdAndPasswdService(String userId,String psswd);
	
	//根据用户id修改密码
	public int updatePasswdByIdService(String userId, String passwd);
	
	
	//根据id查询用户
	public BackUser queryIdService(String userId);
	
	
	//查询当前页的问题列表
	public BiaoGe<QUname> queryQUService(int currentPage, int pageSize,String qtype);
	
	//修改问题的状态
	public int updateStatusService(int id, String type,String status);
}
