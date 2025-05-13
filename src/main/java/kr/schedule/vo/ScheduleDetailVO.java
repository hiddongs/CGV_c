package kr.schedule.vo;

import java.sql.Time;
import java.util.Date;

public class ScheduleDetailVO {
	
	//스케쥴 테이블에 조인하고 나오는 모든 데이터 있는부분
	
	private Long scheduleId;
    private Date screeningDate;
    private boolean isAvailable;

    private Long theaterId;
    private String theaterName;
    private String theaterRegion;

    private Long auditoriumId;
    private String auditoriumName;
    private String auditoriumType;

    private Long movieId;
    private String movieTitle;
    private String director;
    private String actor;
    private String genre;
    private int runtime;
    private Date releaseDate;
    private String ageLimit;
    private String posterUrl;
    private Date movieCreate;
    private String description;
    private double bookingRate;

    private Long slotId;
    private Time startTime;
    private Time endTime;
    
	public Long getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(Long scheduleId) {
		this.scheduleId = scheduleId;
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
	public Long getTheaterId() {
		return theaterId;
	}
	public void setTheaterId(Long theaterId) {
		this.theaterId = theaterId;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public String getTheaterRegion() {
		return theaterRegion;
	}
	public void setTheaterRegion(String theaterRegion) {
		this.theaterRegion = theaterRegion;
	}
	public Long getAuditoriumId() {
		return auditoriumId;
	}
	public void setAuditoriumId(Long auditoriumId) {
		this.auditoriumId = auditoriumId;
	}
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
	public Long getMovieId() {
		return movieId;
	}
	public void setMovieId(Long movieId) {
		this.movieId = movieId;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getRuntime() {
		return runtime;
	}
	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getAgeLimit() {
		return ageLimit;
	}
	public void setAgeLimit(String ageLimit) {
		this.ageLimit = ageLimit;
	}
	public String getPosterUrl() {
		return posterUrl;
	}
	public void setPosterUrl(String posterUrl) {
		this.posterUrl = posterUrl;
	}
	public Date getMovieCreate() {
		return movieCreate;
	}
	public void setMovieCreate(Date movieCreate) {
		this.movieCreate = movieCreate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getBookingRate() {
		return bookingRate;
	}
	public void setBookingRate(double bookingRate) {
		this.bookingRate = bookingRate;
	}
	public Long getSlotId() {
		return slotId;
	}
	public void setSlotId(Long slotId) {
		this.slotId = slotId;
	}
	public Time getStartTime() {
		return startTime;
	}
	public void setStartTime(Time startTime) {
		this.startTime = startTime;
	}
	public Time getEndTime() {
		return endTime;
	}
	public void setEndTime(Time endTime) {
		this.endTime = endTime;
	}
}
