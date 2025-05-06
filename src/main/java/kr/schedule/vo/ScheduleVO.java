package kr.schedule.vo;

import java.sql.Timestamp;

public class ScheduleVO {
    private int scheduleID;
    private int theaterID;
    private int movieID;
   
    private boolean isMorning;
    private boolean isNight;
    private boolean isAvailable;
    
    private Timestamp screeningTime;  // 변경

    public Timestamp getScreeningTime() {
        return screeningTime;
    }
    public void setScreeningTime(Timestamp screeningTime) {
        this.screeningTime = screeningTime;
    }

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

    // Getter, Setter 생략 없이 전체 작성
    
}