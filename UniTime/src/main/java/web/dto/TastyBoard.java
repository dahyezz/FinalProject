package web.dto;

import java.util.Date;

public class TastyBoard {
	private int boardno;
	private String tag;
	private String storeName;
	private String loc;
	private String content;
	private String writer;
	private int hit;
	private int score;
	private Date writtendate;
	private int comment;
	


	@Override
	public String toString() {
		return "TastyBoard [boardno=" + boardno + ", tag=" + tag + ", storeName=" + storeName + ", loc=" + loc
				+ ", content=" + content + ", writer=" + writer + ", hit=" + hit + ", score=" + score + ", writtendate="
				+ writtendate + ", comment=" + comment + "]";
	}

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
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

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Date getWrittendate() {
		return writtendate;
	}

	public void setWrittendate(Date writtendate) {
		this.writtendate = writtendate;
	}

	public int getComment() {
		return comment;
	}

	public void setComment(int comment) {
		this.comment = comment;
	}
	
	
	

}
