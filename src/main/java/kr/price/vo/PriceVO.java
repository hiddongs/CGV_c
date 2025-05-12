package kr.price.vo;

public class PriceVO {

	private int price; // 기본 가격 (2D)
	private int weekend; // 주말 가중치 가격
	private int kids; // 어린이 가격 가중치
	private int afternoon; // 오후 가격가중치
	private int midnight; // 자정 가격 가중치
	private int imax; // imax관 가격 가중치
	private int screenX; // screenx관 가격 가중치
	private int p_4DX; // 4dx관 가격 가중치
	private int p_3D; // 3d관 가격 가중치
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getWeekend() {
		return weekend;
	}
	public void setWeekend(int weekend) {
		this.weekend = weekend;
	}
	public int getKids() {
		return kids;
	}
	public void setKids(int kids) {
		this.kids = kids;
	}
	public int getAfternoon() {
		return afternoon;
	}
	public void setAfternoon(int afternoon) {
		this.afternoon = afternoon;
	}
	public int getMidnight() {
		return midnight;
	}
	public void setMidnight(int midnight) {
		this.midnight = midnight;
	}
	public int getImax() {
		return imax;
	}
	public void setImax(int imax) {
		this.imax = imax;
	}
	public int getScreenX() {
		return screenX;
	}
	public void setScreenX(int screenX) {
		this.screenX = screenX;
	}
	public int getP_4DX() {
		return p_4DX;
	}
	public void setP_4DX(int p_4dx) {
		p_4DX = p_4dx;
	}
	public int getP_3D() {
		return p_3D;
	}
	public void setP_3D(int p_3d) {
		p_3D = p_3d;
	}
	
}
