package kr.movietype.vo;

public class MovieTypeVO {
	
	    private Long movieId;     // 영화 ID
		private String imax;     // "Y" or "N"
	    private String screenx;  // "Y" or "N"
	    private String _4dx;   // "Y" or "N"
	    private String _3d;   // "Y" or "N"
	    private String _2d;
	    
	    public String get_3d() {
			return _3d;
		}
		public void set_3d(String _3d) {
			this._3d = _3d;
		}
		public String get_2d() {
			return _2d;
		}
		public void set_2d(String _2d) {
			this._2d = _2d;
		}
		public Long getMovieId() {
	    	return movieId;
	    }
	    public void setMovieId(Long movieId) {
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
		public String get_4dx() {
			return _4dx;
		}
		public void set_4dx(String _4dx) {
			this._4dx = _4dx;
		}
	
	

}
