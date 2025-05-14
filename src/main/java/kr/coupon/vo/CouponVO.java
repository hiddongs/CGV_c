package kr.coupon.vo;

import java.util.Date;

public class CouponVO {
	
	private Long couponID;
	private int discountAmount;
	private String couponName;

	private Date expired_date;
	
	public int getDiscountAmount() {
		return discountAmount;
	}
	public void setDiscountAmount(int discountAmount) {
		this.discountAmount = discountAmount;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	private int cpPossessId;

	public int getCpPossessId() {
	    return cpPossessId;
	}
	public void setCpPossessId(int cpPossessId) {
	    this.cpPossessId = cpPossessId;
	}

	public Long getCouponID() {
		return couponID;
	}
	public void setCouponID(Long couponID) {
		this.couponID = couponID;
	}
	
	public Date getExpired_date() {
		return expired_date;
	}
	public void setExpired_date(Date expired_date) {
		this.expired_date = expired_date;
	}

	
	
	
}
