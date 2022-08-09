package com.kktshop.dto;

import lombok.Getter;
import lombok.Setter;

public class NavbarDTO {
	private int idx;
	private int dept;
	private String navname;
	private String navparam;
	private String navurl;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getDept() {
		return dept;
	}
	public void setDept(int dept) {
		this.dept = dept;
	}
	public String getNavname() {
		return navname;
	}
	public void setNavname(String navname) {
		this.navname = navname;
	}
	public String getNavparam() {
		return navparam;
	}
	public void setNavparam(String navparam) {
		this.navparam = navparam;
	}
	public String getNavurl() {
		return navurl;
	}
	public void setNavurl(String navurl) {
		this.navurl = navurl;
	}
}