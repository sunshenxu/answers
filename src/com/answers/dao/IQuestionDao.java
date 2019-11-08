package com.answers.dao;

import java.util.List;

import com.answers.entity.Label;
import com.answers.entity.Question;
import com.answers.entity.User;

public interface IQuestionDao {
	
	//查询当前页面的问题
	public List<Question> queryTechnicalList(int currentPage, int pageSize);
	
	//查询问题对应的用户
	public User queryUserByUserId(String userid);
	
	
	//查询问题对应的标签
	public List<Label> queryLabelByQuestionId(int questionId);
	
	//查询问题的总数
	public int queryTechnicalCount();

}
