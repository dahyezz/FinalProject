package web.dto;

public class BlackList {
	
	private int hakbun;
	private String name;
	private String email;
	
	@Override
	public String toString() {
		return "BlackList [hakbun=" + hakbun + ", name=" + name + ", email=" + email + "]";
	}
	
	public int getHakbun() {
		return hakbun;
	}
	public void setHakbun(int hakbun) {
		this.hakbun = hakbun;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}
