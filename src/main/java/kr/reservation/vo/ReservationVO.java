package kr.reservation.vo;

import java.sql.Date;

public class ReservationVO {
   private int reservationID;
   private int memID;
   private int schedulleID;
   private String seat_num;
   private String payment_staus;
   private Date payment_date;
public int getReservationID() {
	return reservationID;
}
public void setReservationID(int reservationID) {
	this.reservationID = reservationID;
}
public int getMemID() {
	return memID;
}
public void setMemID(int memID) {
	this.memID = memID;
}
public int getSchedulleID() {
	return schedulleID;
}
public void setSchedulleID(int schedulleID) {
	this.schedulleID = schedulleID;
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
