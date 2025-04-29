package kr.coupon.vo;

import java.util.Date;

public class CouponVO {
	
	private Long couponID;
	private int discount_amount;
	private Date expired_date;
	private String coupon_name;
	
	public Long getCouponID() {
		return couponID;
	}
	public void setCouponID(Long couponID) {
		this.couponID = couponID;
	}
	public int getDiscount_amount() {
		return discount_amount;
	}
	public void setDiscount_amount(int discount_amount) {
		this.discount_amount = discount_amount;
	}
	public Date getExpired_date() {
		return expired_date;
	}
	public void setExpired_date(Date expired_date) {
		this.expired_date = expired_date;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	
	
}
