package com.answers.service;

import com.answers.entity.Question;

public interface IPutQuestionService {
	//向当前用户添加一个问题
	public int addQuestionService(Question question,String labelIds, String questionType);
	
	
	
}
