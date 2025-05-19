package kr.ask.vo;

import java.sql.Date;

public class AskVO {
   private int ask_id;  // 문의 고유 ID
   private int member_id; // 멤버아이디
   private String title; // 제목
   private String content; // 내용
   private Date reg_date; // 작성일
   private String status; //상태 (답변/대기)
   private String cgv_name; //영화관 이름
   private String category; //유형
   private int satisfaction; // 만족도
   private int theaterID; // 영화관 ID
   
   
   
   public int getTheaterID() {
      return theaterID;
   }
   public void setTheaterID(int theaterID) {
      this.theaterID = theaterID;
   }
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
   public String getCgv_name() {
      return cgv_name;
   }
   public void setCgv_name(String cgv_name) {
      this.cgv_name = cgv_name;
   }
   public String getCategory() {
      return category;
   }
   public void setCategory(String category) {
      this.category = category;
   }
   public int getSatisfaction() {
      return satisfaction;
   }
   public void setSatisfaction(int satisfaction) {
      this.satisfaction = satisfaction;
   }
   
   
}
