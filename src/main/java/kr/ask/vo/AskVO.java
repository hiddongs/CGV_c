package kr.ask.vo;

import java.sql.Date;

public class AskVO {
	private int ask_id;
	private int member_id;
	private String title;
	private String content;
	private Date reg_date;
	private String status;
	
	
	public int getAsk_id() {
		return ask_id;
	}
	public void setAsk_id(int ask_id) {
		this.ask_id = ask_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
