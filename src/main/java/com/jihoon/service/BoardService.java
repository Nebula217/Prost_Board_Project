package com.jihoon.service;

import com.jihoon.vo.BoardVO;

public interface BoardService {
	
	//게시글 작성
	public void write(BoardVO boardVO) throws Exception;
}
