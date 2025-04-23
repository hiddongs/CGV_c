package kr.member.vo;

import java.sql.Date;

public class MemberVO {
    private int member_id;        // 회원번호
    private String user_id;      // 아이디
    private String password;      // 비밀번호
    private String name;    // 이름
    private String phone;   // 전화번호
    private String email;   // 이메일
    private Date reg_date;      // 가입일

    private String auth;        // 권한
    private String mem_grade;

    private int point;         // 포인트
    private String gender;
    private String grade;
    private String address;
    private String addressDetail;

    public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	// Getters and Setters
    public int getMember_id() { return member_id; }
    public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public void setMember_id(int mem_num) { this.member_id = mem_num; }
    
    public String getUser_id() { return user_id; }
    public void setUser_id(String user_id) { this.user_id = user_id; }
    
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public Date getReg_date() { return reg_date; }
    public void setReg_date(Date reg_date) { this.reg_date = reg_date; }

    
    public String getMem_grade() {return mem_grade;}
	public void setMem_grade(String mem_grade) { this.mem_grade = mem_grade;}
    
    public String getAuth() { return auth; }
    public void setAuth(String auth) { this.auth = auth; }

    public int getPoint() { return point; }
    public void setPoint(int point) { this.point = point; }
	
    }
