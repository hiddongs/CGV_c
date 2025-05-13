package kr.cp_possess.vo;

public class CpPossessVO {
	
	private Long cp_possess_id;
	private Long member_id;
	private Long coupon_id;
	
	public Long getMember_id() {
		return member_id;
	}
	public void setMember_id(Long member_id) {
		this.member_id = member_id;
	}
	public Long getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(Long coupon_id) {
		this.coupon_id = coupon_id;
	}
	public void setCp_possess_id(Long cp_possess_id) {
		this.cp_possess_id = cp_possess_id;
	}
	public Long getCp_possess_id() {
		return cp_possess_id;
	}
}
