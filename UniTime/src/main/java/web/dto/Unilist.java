package web.dto;

public class Unilist {
	private int uniCode;
	private String uniName;
	private String uniUrl;
	
	@Override
	public String toString() {
		return "Unilist [uniCode=" + uniCode + ", uniName=" + uniName + ", uniUrl=" + uniUrl + "]";
	}
	public int getUniCode() {
		return uniCode;
	}
	public void setUniCode(int uniCode) {
		this.uniCode = uniCode;
	}
	public String getUniName() {
		return uniName;
	}
	public void setUniName(String uniName) {
		this.uniName = uniName;
	}
	public String getUniUrl() {
		return uniUrl;
	}
	public void setUniUrl(String uniUrl) {
		this.uniUrl = uniUrl;
	}
	
	
	

}
