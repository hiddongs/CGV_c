package kr.movietype.vo;

public class MovieTypeVO {
	
	    private int movieId;     // 영화 ID
	    private String imax;     // "Y" or "N"
	    private String screenx;  // "Y" or "N"
	    private String fourdx;   // "Y" or "N"
	    private String threeD;   // "Y" or "N"
	    
	    // Getters and Setters
	    public int getMovieId() {
	        return movieId;
	    }
	    public void setMovieId(int movieId) {
	        this.movieId = movieId;
	    }

	    public String getImax() {
	        return imax;
	    }
	    public void setImax(String imax) {
	        this.imax = imax;
	    }

	    public String getScreenx() {
	        return screenx;
	    }
	    public void setScreenx(String screenx) {
	        this.screenx = screenx;
	    }

	    public String getFourdx() {
	        return fourdx;
	    }
	    public void setFourdx(String fourdx) {
	        this.fourdx = fourdx;
	    }

	    public String getThreeD() {
	        return threeD;
	    }
	    public void setThreeD(String threeD) {
	        this.threeD = threeD;
	    }
	

}
