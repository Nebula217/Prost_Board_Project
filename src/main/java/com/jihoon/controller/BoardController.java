package com.jihoon.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jihoon.service.BoardService;
import com.jihoon.vo.BoardVO;
import com.jihoon.vo.Criteria;
import com.jihoon.vo.PageMaker;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "writeView", method = RequestMethod.GET)
	public String writeView() throws Exception{
		logger.info("board/writeView");
		return "board/writeView";
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception{
		logger.info("board/write");
		
		service.write(boardVO);
		
		return "redirect:/list";
	}
	// 게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, Criteria cri) throws Exception{
		logger.info("list");
		
		model.addAttribute("list", service.list(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/list";
		
	}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String start(Model model, Criteria cri) throws Exception{
		logger.info("list");
		
		model.addAttribute("list", service.list(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/list";
		
	}
	
	//게시물 열람
	@RequestMapping(value="readView", method = RequestMethod.GET)
	public String read(BoardVO boardVO, Model model) throws Exception{
		logger.info("board/read");
		
		model.addAttribute("read",service.read(boardVO.getBno()));
		return "board/readView";
	}
	
	
	// 게시판 수정뷰
	@RequestMapping(value = "updateView", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, Model model) throws Exception{
		logger.info("updateView");
		
		model.addAttribute("update", service.read(boardVO.getBno()));
		
		return "board/updateView";
	}
	
	// 게시판 수정
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(BoardVO boardVO) throws Exception{
		logger.info("update");
		
		service.update(boardVO);
		
		return "redirect:/list";
	}

	// 게시판 삭제
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(BoardVO boardVO) throws Exception{
		logger.info("delete");
		
		service.delete(boardVO.getBno());
		
		return "redirect:/list";
	}
	
	// 게시판 글 답변 작성 화면
	@RequestMapping(value = "answerView", method = RequestMethod.GET)
	public String answerView(BoardVO boardVO, Model model) throws Exception{
		logger.info("board/answerView");
		
	
		return "board/answerView";
	}
	// 게시판 글 답변하기
	@RequestMapping(value = "answer", method = RequestMethod.POST)
	public String answer(BoardVO boardVO) throws Exception{
		logger.info("board/answerView");
		
		service.reply(boardVO);
	
		return "redirect:/list";
}
}