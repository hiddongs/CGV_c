package kr.reservation.vo;

import java.sql.Date;

// 예약 VO 재 설정
public class ReservationVO {
   private int reservation_id; //예매 id
   private int mem_id; // 멤버 id
   private int schedulle_id; // 스케둘 id
   private String seat_num; //좌석번호
   private int viewers; //관람인원
   //관람일시 (시각) 8:30분
   private Date screeningTime;	//관람일시 -> schedule의 screeningTime ? 어떤 거?
   private int price; //영화가격
   private String name; //극장이름
   private String mv_title; //영화제목
   private String payment_staus; //결제상태
   private Date payment_date; //결제날짜
   private String movie_type; //상영관
   
   
public int getReservation_id() {
	return reservation_id;
}
public void setReservation_id(int reservation_id) {
	this.reservation_id = reservation_id;
}
public int getMem_id() {
	return mem_id;
}
public void setMem_id(int mem_id) {
	this.mem_id = mem_id;
}
public int getSchedulle_id() {
	return schedulle_id;
}
public void setSchedulle_id(int schedulle_id) {
	this.schedulle_id = schedulle_id;
}
public String getSeat_num() {
	return seat_num;
}
public void setSeat_num(String seat_num) {
	this.seat_num = seat_num;
}
public int getViewers() {
	return viewers;
}
public void setViewers(int viewers) {
	this.viewers = viewers;
}
public Date getScreeningTime() {
	return screeningTime;
}
public void setScreeningTime(Date screeningTime) {
	this.screeningTime = screeningTime;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getMv_title() {
	return mv_title;
}
public void setMv_title(String mv_title) {
	this.mv_title = mv_title;
}
public String getPayment_staus() {
	return payment_staus;
}
public void setPayment_staus(String payment_staus) {
	this.payment_staus = payment_staus;
}
public Date getPayment_date() {
	return payment_date;
}
public void setPayment_date(Date payment_date) {
	this.payment_date = payment_date;
}

public String getMovie_type() {
	return movie_type;
}
public void setMovie_type(String movie_type) {
	this.movie_type = movie_type;
}
   
}
