package com.answers.service;


import com.answers.entity.Page;
import com.answers.entity.QULs;

public interface IQuestionService {
	
	//获取当前页面的问题数据,包括问题，提问人，和标签
	public Page<QULs> queryQuestionAndUserAndLabel(int currentPage, int pageSize);

	
	
}
