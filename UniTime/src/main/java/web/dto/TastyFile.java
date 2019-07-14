package web.dto;

public class TastyFile {
	private int fileno;
	private int boardno;
	private String originName;
	private String storedName;
	private int filesize;

	@Override
	public String toString() {
		return "TastyFile [fileno=" + fileno + ", boardno=" + boardno + ", originName=" + originName + ", storedName="
				+ storedName + ", filesize=" + filesize + "]";
	}

	public int getFileno() {
		return fileno;
	}

	public void setFileno(int fileno) {
		this.fileno = fileno;
	}

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}

	public int getFilesize() {
		return filesize;
	}

	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	
	

}
