package kr.schedule.vo;


import java.util.Date;

public class ScheduleVO {

	private Long scheduleId;
	private Long movieId;
	private Long theaterId;
	private Long auditoriumId;
	private Long slotId;
	private Date screeningDate;
	private boolean isAvailable;
	
	public Long getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(Long scheduleId) {
		this.scheduleId = scheduleId;
	}
	public Long getMovieId() {
		return movieId;
	}
	public void setMovieId(Long movieId) {
		this.movieId = movieId;
	}
	public Long getTheaterId() {
		return theaterId;
	}
	public void setTheaterId(Long theaterId) {
		this.theaterId = theaterId;
	}
	public Long getAuditoriumId() {
		return auditoriumId;
	}
	public void setAuditoriumId(Long auditoriumId) {
		this.auditoriumId = auditoriumId;
	}
	public Long getSlotId() {
		return slotId;
	}
	public void setSlotId(Long slotId) {
		this.slotId = slotId;

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


    
    private String auditoriumName;
    private String auditoriumType;
    private Timestamp startTime;
    private Timestamp endTime;

    
    public Timestamp getStartTime() { return startTime; }
    public void setStartTime(Timestamp startTime) { this.startTime = startTime; }

    public Timestamp getEndTime() { return endTime; }
    public void setEndTime(Timestamp endTime) { this.endTime = endTime; }

    public String getAuditoriumName() {
        return auditoriumName;
    }
    public void setAuditoriumName(String auditoriumName) {
        this.auditoriumName = auditoriumName;
    }
    public String getAuditoriumType() {
        return auditoriumType;
    }
    public void setAuditoriumType(String auditoriumType) {
        this.auditoriumType = auditoriumType;
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

    
    
}

