package web.dto;

public class UsedFile {
	private int boardno;
	private int usedImageNo;
	private String originName;
	private String storedName;
	private int filesize;
	
	@Override
	public String toString() {
		return "UsedFile [boardno=" + boardno + ", usedImageNo=" + usedImageNo + ", originName=" + originName
				+ ", storedName=" + storedName + ", filesize=" + filesize + "]";
	}

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public int getUsedImageNo() {
		return usedImageNo;
	}

	public void setUsedImageNo(int usedImageNo) {
		this.usedImageNo = usedImageNo;
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
