package web.dto;

public class BadReport {
	private int badno;
	private String boardname;
	private int boardno;
	private int commentno;
	private int hakbun;
	private String nickname;
	
	@Override
	public String toString() {
		return "BadReport [badno=" + badno + ", boardname=" + boardname + ", boardno=" + boardno + ", commentno="
				+ commentno + ", hakbun=" + hakbun + ", nickname=" + nickname + "]";
	}
	
	public int getBadno() {
		return badno;
	}
	public void setBadno(int badno) {
		this.badno = badno;
	}
	public String getBoardname() {
		return boardname;
	}
	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public int getCommentno() {
		return commentno;
	}
	public void setCommentno(int commentno) {
		this.commentno = commentno;
	}
	public int getHakbun() {
		return hakbun;
	}
	public void setHakbun(int hakbun) {
		this.hakbun = hakbun;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	

}
