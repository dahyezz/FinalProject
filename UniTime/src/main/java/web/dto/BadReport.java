package web.dto;

public class BadReport {
	private int badno;
	private String boardname;
	private int boardno;
	private int commentno;
	private String reason;
	private String nickname;

	@Override
	public String toString() {
		return "BadReport [badno=" + badno + ", boardname=" + boardname + ", boardno=" + boardno + ", commentno="
				+ commentno + ", reason=" + reason + ", nickname=" + nickname + "]";
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

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	

}
