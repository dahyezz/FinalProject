package web.dto;

public class UsedImage {
	private int boardno;
	private int usedImgNo;
	private String originName;
	private String storedName;
	private int imgSize;
	
	@Override
	public String toString() {
		return "UsedImage [boardno=" + boardno + ", usedImgNo=" + usedImgNo + ", originName=" + originName
				+ ", storedName=" + storedName + ", imgSize=" + imgSize + "]";
	}

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public int getUsedImgNo() {
		return usedImgNo;
	}

	public void setUsedImgNo(int usedImgNo) {
		this.usedImgNo = usedImgNo;
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

	public int getImgSize() {
		return imgSize;
	}

	public void setImgSize(int imgSize) {
		this.imgSize = imgSize;
	}
	
	
}
