package com.answers.service;

import com.answers.entity.AUs;
import com.answers.entity.Huida;
import com.answers.entity.Page;

public interface IAnswerService {
	//获取对应问题的当前页的回答列表，type表示问题的类型，sortType表示排序的类型
	public Page<AUs> queryCurrentPage(int currentPage, int pageSize,String type,int questionId,String sortType);

	
	//添加一个问题回答，type表示问题的类型
	public int addQuestionAnswerService(Huida huida,String type);
	
	
	//修改投票数
	public int addVotecountService(int answerId, String type, int num);
}
