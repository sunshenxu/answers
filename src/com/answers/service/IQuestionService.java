package com.answers.service;


import java.util.List;

import com.answers.entity.Label;
import com.answers.entity.Page;
import com.answers.entity.QULs;

public interface IQuestionService {
	
	//获取当前页面的问题数据,包括问题，提问人，和标签
	public Page<QULs> queryQuestionAndUserAndLabel(int currentPage, int pageSize, String questionType, String sortType,int labelId);

	//查询所有的标签
	public List<Label> queryAllLabelService();
}
