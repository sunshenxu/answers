package com.answers.service;


import java.util.List;

import com.answers.entity.Label;
import com.answers.entity.Page;
import com.answers.entity.QU;
import com.answers.entity.QULs;

public interface IQuestionService {
	
	//获取当前页面的问题数据,包括问题，提问人，和标签
	public Page<QULs> queryQuestionAndUserAndLabel(int currentPage, int pageSize, String questionType, String sortType,int labelId);

	//查询所有的标签
	public List<Label> queryAllLabelService();
	
	//按照标题内容模糊查询
	public Page<QULs> queryQuestionByTitle(int currentPage, int pageSize, String serchVal);

	//根据问题id获取问题的内容和用户
	public QU queryQuestionByQuestionID(int questionId, String type);
	
	//浏览数加1
	public int addBrowsecountService(int questionId, String type, int num);
	
	//修改投票数
	public int addVotecountService(int answerId, String type, int num);
	
}
