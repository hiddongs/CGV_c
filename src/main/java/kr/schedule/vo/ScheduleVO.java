package kr.schedule.vo;

import java.sql.Date;

public class ScheduleVO {

	private int scheduleID;
	private int theaterID;
	private int movieID;
	private String screeningTime;
	
	private boolean isMorning;
	private boolean isNight;
	private boolean isAvailable;
	
	
	public int getScheduleID() {
		return scheduleID;
	}
	public void setScheduleID(int scheduleID) {
		this.scheduleID = scheduleID;
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
	public String getScreeningTime() {
		return screeningTime;
	}
	public void setScreeningTime(String screeningTime) {
		this.screeningTime = screeningTime;
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
