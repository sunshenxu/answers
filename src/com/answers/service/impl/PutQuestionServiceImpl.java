package com.answers.service.impl;

import com.answers.dao.IPutQuestionDao;
import com.answers.dao.impl.PutQuestionDaoImpl;
import com.answers.entity.Question;
import com.answers.service.IPutQuestionService;
import com.answers.utils.TransactionUtil;

public class PutQuestionServiceImpl implements IPutQuestionService {
	private IPutQuestionDao putQuestionDao = null;
	
	public PutQuestionServiceImpl() {
		putQuestionDao = new PutQuestionDaoImpl();
	}
	
	@Override
	public int addQuestionService(Question question, String labelIds, String questionType) {
		try {
			TransactionUtil.startTransaction();
			String sql1 = "";
			String sql2 = "";
			if("technical".equals(questionType)) {
				sql1 = "insert into technical(title,content,releasetime,votecount,answercount,browsecount,userid) values(?,?,?,?,?,?,?)";
				sql2 = "insert into technicalflag(technicalid,labelid) values(?,?)";
			}else if("interview".equals(questionType)) {
				sql1 = "insert into interview(title,content,releasetime,votecount,answercount,browsecount,userid) values(?,?,?,?,?,?,?)";
				sql2 = "insert into interviewflag(interviewid,labelid) values(?,?)";
			}else if("task".equals(questionType)) {
				sql1 = "insert into task(title,content,releasetime,votecount,answercount,browsecount,userid) values(?,?,?,?,?,?,?)";
				sql2 = "insert into taskflag(taskid,labelid) values(?,?)";
			}
			
			int questionId = putQuestionDao.addQuestionDao(question, sql1);
			
			
			
			
			String[] split = labelIds.split(",");
			
			for (String labelId : split) {
				int count = putQuestionDao.addLabelByQuestionIdDao(sql2, questionId, Integer.parseInt(labelId));
			}
			
			TransactionUtil.commitTransaction();
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
			TransactionUtil.rollbackTransaction();
		}finally {
			TransactionUtil.close();
		}
		return 0;
		
	}

}
