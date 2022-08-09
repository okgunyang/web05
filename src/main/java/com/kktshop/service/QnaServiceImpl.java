package com.kktshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kktshop.dao.QnaDAO;
import com.kktshop.dto.QnaDTO;
import com.kktshop.dto.SearchDTO;

@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	QnaDAO qnaDAO;

	@Override
	public List<QnaDTO> qnaList(SearchDTO sdto) throws Exception {
		return qnaDAO.qnaList(sdto);
	}
	
	@Override
	public List<QnaDTO> qnaList() throws Exception {
		return qnaDAO.qnaList();
	}
	
	@Override
	public QnaDTO qnaRead(int qno) throws Exception {
		return qnaDAO.qnaRead(qno);
	}

	@Override
	public QnaDTO replyRead(int qno) throws Exception {
		return qnaDAO.replyRead(qno);
	}

	@Override
	public void qnaWrite(QnaDTO qdto) throws Exception {
		qnaDAO.qnaWrite(qdto);
	}

	@Override
	public void replyWrite(QnaDTO qdto) throws Exception {
		qnaDAO.replyWrite(qdto);
	}

	@Override
	public void qnaUpdate(QnaDTO qdto) throws Exception {
		qnaDAO.qnaUpdate(qdto);
	}

	@Override
	public void qnaDelete(int qno) throws Exception {
		qnaDAO.qnaDelete(qno);
	}

	@Override
	public void replyUpdate(QnaDTO qdto) throws Exception {
		qnaDAO.replyUpdate(qdto);
	}

	@Override
	public void replyDelete(int qno) throws Exception {
		qnaDAO.replyDelete(qno);
	}
}