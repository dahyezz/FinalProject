package web.dto;

import java.util.Date;

public class TastyComment {
	private int commentno;
	private int boardno;
	private int refCommentno;
	private int dept;
	private String writer;
	private String content;
	private Date writtendate;
	private int badCnt; //신고카운트

	@Override
	public String toString() {
		return "TastyComment [commentno=" + commentno + ", boardno=" + boardno + ", refCommentno=" + refCommentno
				+ ", dept=" + dept + ", writer=" + writer + ", content=" + content + ", writtendate=" + writtendate
				+ ", badCnt=" + badCnt + "]";
	}

	public int getCommentno() {
		return commentno;
	}

	public void setCommentno(int commentno) {
		this.commentno = commentno;
	}

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWrittendate() {
		return writtendate;
	}

	public void setWrittendate(Date writtendate) {
		this.writtendate = writtendate;
	}

	public int getBadCnt() {
		return badCnt;
	}

	public void setBadCnt(int badCnt) {
		this.badCnt = badCnt;
	}


	public int getRefCommentno() {
		return refCommentno;
	}

	public void setRefCommentno(int refCommentno) {
		this.refCommentno = refCommentno;
	}

	public int getDept() {
		return dept;
	}

	public void setDept(int dept) {
		this.dept = dept;
	}
	
	
	

}
