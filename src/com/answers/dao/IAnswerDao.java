package com.answers.dao;

import java.util.List;

import com.answers.entity.Huida;

public interface IAnswerDao {
	//根据问题id查询对应的回答列表
	public List<Huida> queryHuidaByQuestionIdDao(int currentPage, int pageSize,int questionId, String sql);

	
	//查询回答的总数据
	public int queryHuidaCountDao(int questionId, String sql);
	
	//插入一条回答数据
	public int addHuidaDao(Huida huida,String sql);
	
}
