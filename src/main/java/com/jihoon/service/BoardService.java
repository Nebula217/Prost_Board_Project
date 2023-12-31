package com.jihoon.service;

import java.util.List;

import com.jihoon.vo.BoardVO;
import com.jihoon.vo.Criteria;

public interface BoardService {

	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;

	// 게시물 목록 조회
	public List<BoardVO> list() throws Exception;

	// 게시물 열람
	public BoardVO read(int bno) throws Exception;

	// 게시물 수정
	public void update(BoardVO boardVO) throws Exception;

	// 게시물 삭제
	public void delete(int bno) throws Exception;

	// 게시물 답변
	public void reply(BoardVO boardVO) throws Exception;

	// 게시물 목록 조회
	public List<BoardVO> list(Criteria cri) throws Exception;

	// 게시물 총 갯수
	public int listCount() throws Exception;
}
