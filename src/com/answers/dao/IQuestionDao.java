package com.answers.dao;

import java.util.List;

import com.answers.entity.Label;
import com.answers.entity.Question;
import com.answers.entity.User;

public interface IQuestionDao {
	
	//查询当前页面的问题
	public List<Question> queryQuestionList(int currentPage, int pageSize, String questionType, String sortType);
	public List<Question> queryQuestionList(int currentPage, int pageSize, String questionType, String sortType,int labelId);
	
	//查询问题对应的用户
	public User queryUserByUserId(String userid);
	
	
	//查询问题对应的标签
	public List<Label> queryLabelByQuestionId(int questionId, String questionType);
	
	//查询问题的总数
	public int queryQuestionCount(String questionType, String sortType);
	public int queryQuestionCount(String questionType, String sortType,int labelId);

	//查询所有的标签
	public List<Label> queryAllLabelDao();
	
	
	//按照标题模糊查询
	public List<Question> serchTechnicalTitleDao(int currentPage, int pageSize,String serchVal);
	public List<Question> serchInterviewTitleDao(int currentPage, int pageSize,String serchVal);
	public List<Question> serchTaskTitleDao(int currentPage, int pageSize,String serchVal);
	
	//查询按照标题模糊查询的总问题数
	public int serchTechnicalTitleCountDao(String serchVal);
	public int serchInterviewTitleCountDao(String serchVal);
	public int serchTaskTitleCountDao(String serchVal);
	
	
	
}
