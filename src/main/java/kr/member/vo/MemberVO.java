package kr.member.vo;

import java.sql.Date;

public class MemberVO {
    private int mem_num;        // 회원번호
    private String mem_id;      // 아이디
    private String mem_pw;      // 비밀번호
    private String mem_name;    // 이름
    private String mem_phone;   // 전화번호
    private String mem_email;   // 이메일
    private Date reg_date;      // 가입일
    private String auth;        // 권한
    private String mem_grade;
    private int point;         // 포인트

    // Getters and Setters
    public int getMem_num() { return mem_num; }
    public void setMem_num(int mem_num) { this.mem_num = mem_num; }
    
    public String getMem_id() { return mem_id; }
    public void setMem_id(String mem_id) { this.mem_id = mem_id; }
    
    public String getMem_pw() { return mem_pw; }
    public void setMem_pw(String mem_pw) { this.mem_pw = mem_pw; }
    
    public String getMem_name() { return mem_name; }
    public void setMem_name(String mem_name) { this.mem_name = mem_name; }
    
    public String getMem_phone() { return mem_phone; }
    public void setMem_phone(String mem_phone) { this.mem_phone = mem_phone; }
    
    public String getMem_email() { return mem_email; }
    public void setMem_email(String mem_email) { this.mem_email = mem_email; }
    
    public Date getReg_date() { return reg_date; }
    public void setReg_date(Date reg_date) { this.reg_date = reg_date; }
    
    public String getMem_grade() {return mem_grade;}
	public void setMem_grade(String mem_grade) { this.mem_grade = mem_grade;}
    
    public String getAuth() { return auth; }
    public void setAuth(String auth) { this.auth = auth; }
    
    public int getPoint() { return point; }
    public void setPoint(int point) { this.point = point; }
	
    }
