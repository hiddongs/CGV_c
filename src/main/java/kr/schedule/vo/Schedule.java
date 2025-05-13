package kr.schedule.vo;

import java.sql.Date;

public class Schedule {

	private int sheduleID; //상영스케줄 ID
	private int theaterID; //극장 ID
	private int movieID; //영화 ID
	private Date screeningTime; //영화 시간
	private int price; // 가격
	private boolean isMorning; //조조
	private boolean isNight; //심야
	private boolean isAvailable; //가능
	
	
	public int getSheduleID() {
		return sheduleID;
	}
	public void setSheduleID(int sheduleID) {
		this.sheduleID = sheduleID;
	}
	public int getTheaterID() {
		return theaterID;
	}
	public void setTheaterID(int theaterID) {
		this.theaterID = theaterID;
	}
	public int getMovieID() {
		return movieID;
	}
	public void setMovieID(int movieID) {
		this.movieID = movieID;
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
	public boolean isMorning() {
		return isMorning;
	}
	public void setMorning(boolean isMorning) {
		this.isMorning = isMorning;
	}
	public boolean isNight() {
		return isNight;
	}
	public void setNight(boolean isNight) {
		this.isNight = isNight;
	}
	public boolean isAvailable() {
		return isAvailable;
	}
	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}
	
	
}
