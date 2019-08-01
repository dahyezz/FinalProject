package web.dto;

import java.util.Date;

public class LectureBoard {
	
	private int boardno;
	private String tag;
	private int department_code;
	private String content;
	private int team_project;
	private int homework;
	private int total_score;
	private String writer;
	private int hit;
	private Date writtendate;
	
	//timetable 추가
	private String lecture_section;
	private String lecture_name;
	private String professor_name;
	
	@Override
	public String toString() {
		return "LectureBoard [boardno=" + boardno + ", tag=" + tag + ", department_code=" + department_code
				+ ", content=" + content + ", team_project=" + team_project + ", homework=" + homework
				+ ", total_score=" + total_score + ", writer=" + writer + ", hit=" + hit + ", writtendate="
				+ writtendate + ", lecture_section=" + lecture_section + ", lecture_name=" + lecture_name
				+ ", professor_name=" + professor_name + "]";
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
	public int getDepartment_code() {
		return department_code;
	}
	public void setDepartment_code(int department_code) {
		this.department_code = department_code;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getTeam_project() {
		return team_project;
	}
	public void setTeam_project(int team_project) {
		this.team_project = team_project;
	}
	public int getHomework() {
		return homework;
	}
	public void setHomework(int homework) {
		this.homework = homework;
	}
	public int getTotal_score() {
		return total_score;
	}
	public void setTotal_score(int total_score) {
		this.total_score = total_score;
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
	public Date getWrittendate() {
		return writtendate;
	}
	public void setWrittendate(Date writtendate) {
		this.writtendate = writtendate;
	}
	public String getLecture_section() {
		return lecture_section;
	}
	public void setLecture_section(String lecture_section) {
		this.lecture_section = lecture_section;
	}
	public String getLecture_name() {
		return lecture_name;
	}
	public void setLecture_name(String lecture_name) {
		this.lecture_name = lecture_name;
	}
	public String getProfessor_name() {
		return professor_name;
	}
	public void setProfessor_name(String professor_name) {
		this.professor_name = professor_name;
	}
	
}
