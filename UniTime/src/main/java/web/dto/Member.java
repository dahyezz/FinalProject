package web.dto;

public class Member {
	private int departmentCode;
	private int hakbun;
	private String name;
	private String email;
	private String nickname;
	private String password;
	private int penalty;

	@Override
	public String toString() {
		return "Member [departmentCode=" + departmentCode + ", hakbun=" + hakbun + ", name=" + name + ", email=" + email
				+ ", nickname=" + nickname + ", password=" + password + ", penalty=" + penalty + "]";
	}

	public int getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(int departmentCode) {
		this.departmentCode = departmentCode;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPenalty() {
		return penalty;
	}

	public void setPenalty(int penalty) {
		this.penalty = penalty;
	}
	
	

}
