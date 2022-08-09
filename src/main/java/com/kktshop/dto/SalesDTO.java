package com.kktshop.dto;

public class SalesDTO {
	private int ono;		//결제번호
	private String paytype;	//결제방식
	private String payplace; //결제종류
	private String payno;	//결제카드번호
	private int money;		//결제금액
	private String sdate;	//결제일
	private int gno;		//상품코드
	private int amount;		//수량
	private String userid;	//사용자아이디
	private String rname;	//수신자명
	private String tel;		//수신자전화번호
	private String addr1;	//수신자 기본주소
	private String addr2;	//수신자 상세주소
	private String postcode;	//수신자 우편번호
	private String transno;		//배송코드
	private String transco;		//배송회사
	private String rstate;		//수신상태
	private String rdate;		//도착일
	private String memo;		//메모
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public String getPaytype() {
		return paytype;
	}
	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}
	public String getPayplace() {
		return payplace;
	}
	public void setPayplace(String payplace) {
		this.payplace = payplace;
	}
	public String getPayno() {
		return payno;
	}
	public void setPayno(String payno) {
		this.payno = payno;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getTransno() {
		return transno;
	}
	public void setTransno(String transno) {
		this.transno = transno;
	}
	public String getTransco() {
		return transco;
	}
	public void setTransco(String transco) {
		this.transco = transco;
	}
	public String getRstate() {
		return rstate;
	}
	public void setRstate(String rstatus) {
		this.rstate = rstatus;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
}