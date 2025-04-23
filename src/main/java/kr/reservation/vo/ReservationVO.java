package kr.reservation.vo;

import java.sql.Date;

public class ReservationVO {
   private int reservation_id;
   private int mem_id;
   private int schedulle_id;
   private String seat_num;
   private String payment_staus;
   private Date payment_date;
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
}
