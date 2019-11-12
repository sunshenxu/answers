package com.answers.dao;

import com.answers.entity.Question;

public interface IPutQuestionDao {
	//问题数据库中添加一个问题,返回插入的问题的id
	public int addQuestionDao(Question question, String sql);
	
	//根据问题的id添加标签
	public int addLabelByQuestionIdDao(String sql, int questionId,int labelId);
}
