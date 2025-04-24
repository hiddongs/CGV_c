package kr.movie.vo;

import java.util.Date;

public class MovieVO {

	private int movie_id;       // 영화 번호
	private String mv_title;     // 제목
	private String director;	//감독
	private String actor;        //배우
	private String genre;        // 장르
	private int runtime;         // 상영시간
	private Date release_date;   // 개봉일
	private String rating;       // 등급
	private String poster_url;   // 포스터 이미지 주소
	private String description;  // 설명
	private Date movie_create;	// 생성일
	private String movieType; // 영화타입
	
	
	public String getMovieType() {
		return movieType;
	}
	public void setMovieType(String movieType) {
		this.movieType = movieType;
	}
	public Date getMovie_create() {
		return movie_create;
	}
	public void setMovie_create(Date movie_create) {
		this.movie_create = movie_create;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	
	
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getMv_title() {
		return mv_title;
	}
	public void setMv_title(String mv_title) {
		this.mv_title = mv_title;
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
	public Date getRelease_date() {
		return release_date;
	}
	public void setRelease_date(Date date) {
		this.release_date = date;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getPoster_url() {
		return poster_url;
	}
	public void setPoster_url(String poster_url) {
		this.poster_url = poster_url;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	


}
