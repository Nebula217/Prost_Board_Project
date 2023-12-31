package com.jihoon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jihoon.dao.BoardDAO;
import com.jihoon.vo.BoardVO;
import com.jihoon.vo.Criteria;

@Service
public class BoardServiceImpl implements BoardService {

	
	@Inject
	private BoardDAO dao;
	
	//게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
			dao.write(boardVO);

	}

	//게시물 조회 
	@Override
	public List<BoardVO> list() throws Exception {
		
		return dao.list();
	}
	
	//게시물 열람
	@Override
	public BoardVO read(int bno) throws Exception {
	
		return dao.read(bno);
	}
	
	//게시물 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {

		dao.update(boardVO);
	}
	//게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		
		dao.delete(bno);
	}
	
	//게시물 답변
	@Override
	public void reply(BoardVO boardVO) throws Exception {
		
		dao.reply(boardVO);
	}
	// 게시물 목록 조회
	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(cri);
	}
	// 게시물 총 갯수
	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount();
	}
	
	
	

	

}
