package com.kktshop.dto;

public class MemberDTO {
	private String id;
	private String pwd;
	private String pwd2;
	private String uname;
	private String birth;
	private String phone;
	private String email;
	private String regdate;
	private int grade;
	private boolean member_id_exist;
	public final static String MEMBER_LOGIN = "yes";
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPwd2() {
		return pwd2;
	}
	public void setPwd2(String pwd2) {
		this.pwd2 = pwd2;
	}	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public boolean isMember_id_exist() {
		return member_id_exist;
	}
	public void setMember_id_exist(boolean member_id_exist) {
		this.member_id_exist = member_id_exist;
	}
}
