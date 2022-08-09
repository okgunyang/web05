package com.kktshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kktshop.dto.QnaDTO;
import com.kktshop.dto.SearchDTO;
import com.kktshop.service.QnaService;

@Controller
@RequestMapping("/qna/")
public class QnaController {
	
	@Autowired
	QnaService qnaService;
	
	@Autowired
	HttpSession session;

	//메뉴에서 목록을 눌렀을 경우는 a태그에 의한 GET방식 호출되었을 때
	@RequestMapping(value="list.do", method = RequestMethod.GET)
	public String qnaBasicList(Model model) throws Exception {
		List<QnaDTO> qnaList = qnaService.qnaList();
		model.addAttribute("qnaList", qnaList);
		return "qna/qnaList";
	}
	
	//검색 창(Form)에서 검색 방법과 검색어를 입력받아 처리하는 POST 방식
	@RequestMapping(value="list.do", method = RequestMethod.POST)
	public String qnaList(SearchDTO sdto, Model model) throws Exception {
		List<QnaDTO> qnaList = qnaService.qnaList(sdto);
		model.addAttribute("qnaList", qnaList);
		return "qna/qnaList";
	}

	@RequestMapping(value="read.do", method = RequestMethod.GET)
	public String qnaRead(@RequestParam int qno, Model model) throws Exception {
		QnaDTO qna = qnaService.qnaRead(qno);
		model.addAttribute("qna", qna);
		return "qna/qnaRead";
	}

	@RequestMapping(value="replyRead.do", method = RequestMethod.GET)
	public String replyRead(@RequestParam int qno, Model model) throws Exception {
		QnaDTO qna = qnaService.replyRead(qno);
		model.addAttribute("qna", qna);
		return "qna/replyRead";
	}
	
	@RequestMapping("writeForm.do")  
	public String qnaWriteForm(Model model) throws Exception {
		return "qna/qnaWriteForm";
	}
	
	@RequestMapping(value="replyForm.do", method=RequestMethod.GET)  
	public String replyWriteForm(@RequestParam int qno, Model model) throws Exception {
		QnaDTO qna = qnaService.qnaRead(qno);
		model.addAttribute("qna", qna);
		return "qna/replyWriteForm";
	}
	
	@RequestMapping(value="insert.do", method = RequestMethod.POST)
	public String qnaWrite(QnaDTO qdto, Model model) throws Exception {
		qnaService.qnaWrite(qdto);
		return "redirect:list.do";
	}

	@RequestMapping(value="replyInsert.do", method = RequestMethod.POST)
	public String replyWrite(QnaDTO qdto, Model model) throws Exception {
		qnaService.replyWrite(qdto);
		return "redirect:list.do";
	}
	
	@RequestMapping(value="update.do", method = RequestMethod.POST)
	public String qnaUpdate(QnaDTO qdto, Model model) throws Exception {
		qnaService.qnaUpdate(qdto);
		return "redirect:list.do";
	}

	@RequestMapping(value="delete.do", method = RequestMethod.GET)
	public String qnaDelete(@RequestParam int qno, Model model) throws Exception {
		qnaService.qnaDelete(qno);
		return "redirect:list.do";
	}
	
	@RequestMapping(value="replyDelete.do", method = RequestMethod.GET)
	public String replyDelete(@RequestParam int qno, Model model) throws Exception {
		qnaService.replyDelete(qno);
		return "redirect:list.do";
	}
}
