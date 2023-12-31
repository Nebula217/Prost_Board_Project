package com.jihoon.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jihoon.vo.BoardVO;
import com.jihoon.vo.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;

	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVO);

	}

	// 게시물 목록 조회
	@Override
	public List<BoardVO> list() throws Exception {

		return sqlSession.selectList("boardMapper.list");
	}

	// 게시물 열람
	@Override
	public BoardVO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.read", bno);
	}

	// 게시물 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {

		sqlSession.update("boardMapper.update", boardVO);
	}

	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {

		sqlSession.delete("boardMapper.delete", bno);
	}
	
	// 게시물 답변
	@Override
	public void reply(BoardVO boardVO) throws Exception {

		sqlSession.insert("boardMapper.reply", boardVO);
		
	}
	//게시물 목록 조회
	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.listPage", cri);
	}
	//게시물 총 갯수
	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.listCount");
	}
}
