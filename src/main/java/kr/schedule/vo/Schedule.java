package kr.schedule.vo;

import java.sql.Date;

public class Schedule {

	private int sheduleID;
	private int theaterID;
	private int movieID;
	private Date screeningTime;
	private int price;
	private boolean isMorning;
	private boolean isNight;
	private boolean isAvailable;
	
	
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
