package kr.moviemedia.vo;

public class MovieMediaVO {
	
	int media_id;
	int movie_id;
	String media_type;
	String media_url;
	String media_status;
	
	public int getMedia_id() {
		return media_id;
	}
	public void setMedia_id(int media_id) {
		this.media_id = media_id;
	}
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getMedia_type() {
		return media_type;
	}
	public void setMedia_type(String media_type) {
		this.media_type = media_type;
	}
	public String getMedia_url() {
		return media_url;
	}
	public void setMedia_url(String media_url) {
		this.media_url = media_url;
	}
	public String getMedia_status() {
		return media_status;
	}
	public void setMedia_status(String media_status) {
		this.media_status = media_status;
	}
}
