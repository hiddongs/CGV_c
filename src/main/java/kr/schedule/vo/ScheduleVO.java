package kr.schedule.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class ScheduleVO {
    private int scheduleID;
    private int theaterID;
    private int movieID;
   
    private int auditoriumID;
    private int slotID;
    private Date screeningDate;
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
	public int getAuditoriumID() {
		return auditoriumID;
	}
	public void setAuditoriumID(int auditoriumID) {
		this.auditoriumID = auditoriumID;
	}
	public int getSlotID() {
		return slotID;
	}
	public void setSlotID(int slotID) {
		this.slotID = slotID;
	}
	public Date getScreeningDate() {
		return screeningDate;
	}
	public void setScreeningDate(Date screeningDate) {
		this.screeningDate = screeningDate;
	}
	public boolean isAvailable() {
		return isAvailable;
	}
	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}
    
    
}