package web.dto;

public class TimeTable {
	
	private int lecture_code;
	private int grade;
	private String lecture_section;
	private String department_name;
	private String lecture_name;
	private int hakjum;
	private String professor_name;
	private String lecture_day;
	private int start_time;
	private int end_time;
	private String lecture_room;
	
	@Override
	public String toString() {
		return "TimeTable [lecture_code=" + lecture_code + ", grade=" + grade + ", lecture_section=" + lecture_section
				+ ", department_name=" + department_name + ", lecture_name=" + lecture_name + ", hakjum=" + hakjum
				+ ", professor_name=" + professor_name + ", lecture_day=" + lecture_day + ", start_time=" + start_time
				+ ", end_time=" + end_time + ", lecture_room=" + lecture_room + "]";
	}

	public int getLecture_code() {
		return lecture_code;
	}

	public void setLecture_code(int lecture_code) {
		this.lecture_code = lecture_code;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getLecture_section() {
		return lecture_section;
	}

	public void setLecture_section(String lecture_section) {
		this.lecture_section = lecture_section;
	}

	public String getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

	public String getLecture_name() {
		return lecture_name;
	}

	public void setLecture_name(String lecture_name) {
		this.lecture_name = lecture_name;
	}

	public int getHakjum() {
		return hakjum;
	}

	public void setHakjum(int hakjum) {
		this.hakjum = hakjum;
	}

	public String getProfessor_name() {
		return professor_name;
	}

	public void setProfessor_name(String professor_name) {
		this.professor_name = professor_name;
	}

	public String getLecture_day() {
		return lecture_day;
	}

	public void setLecture_day(String lecture_day) {
		this.lecture_day = lecture_day;
	}

	public int getStart_time() {
		return start_time;
	}

	public void setStart_time(int start_time) {
		this.start_time = start_time;
	}

	public int getEnd_time() {
		return end_time;
	}

	public void setEnd_time(int end_time) {
		this.end_time = end_time;
	}

	public String getLecture_room() {
		return lecture_room;
	}

	public void setLecture_room(String lecture_room) {
		this.lecture_room = lecture_room;
	}
	
	
	
	

}
