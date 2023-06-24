package com.jihoon.vo;

import java.util.Date;

public class BoardVO { //vo는 DB에 있는 테이블 컬럼 값을 java에서 객체로 다루기 위해 사용합니다.

		//데이터베이스에 있는 자료를 받아와 담기 위한 그릇 변수
		private int bno;
		private String title;
		private String content;
		private String writer;
		private Date regdate;
		private int refer;
		private int step;
		private int depth;

		
		
		
		
		
		//값들의 getter, setter
		public int getBno() {
			return bno;
		}
		public void setBno(int bno) {
			this.bno = bno;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public Date getRegdate() {
			return regdate;
		}
		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}
		public int getRefer() {
			return refer;
		}
		public void setRefer(int refer) {
			this.refer = refer;
		}
		public int getStep() {
			return step;
		}
		public void setStep(int step) {
			this.step = step;
		}
		public int getDepth() {
			return depth;
		}
		public void setDepth(int depth) {
			this.depth = depth;
		}
		
}
