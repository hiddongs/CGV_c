package kr.movie.vo;

public class MovieTypeVO {


	    private int movieID;
	    private String imax;       // Y/N
	    private String screenx;    // Y/N
	    private String fourDx;     // "4DX" → 변수명 fourDx
	    private String threeD;     // "3D" → 변수명 threeD
	    private String twoD;       // "2D" → 변수명 twoD

	    public int getMovieID() {
	        return movieID;
	    }

	    public void setMovieID(int movieID) {
	        this.movieID = movieID;
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

	    public String getFourDx() {
	        return fourDx;
	    }

	    public void setFourDx(String fourDx) {
	        this.fourDx = fourDx;
	    }

	    public String getThreeD() {
	        return threeD;
	    }

	    public void setThreeD(String threeD) {
	        this.threeD = threeD;
	    }

	    public String getTwoD() {
	        return twoD;
	    }

	    public void setTwoD(String twoD) {
	        this.twoD = twoD;
	    }
	

}
