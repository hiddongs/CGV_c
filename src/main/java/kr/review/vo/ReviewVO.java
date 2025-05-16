package kr.review.vo;

import java.util.Date;

public class ReviewVO {
    
    private int reviewId;     // 고유 리뷰 식별자
    private int memberId;        // 유저 식별자
    private int movieId;         // 고유 영화 ID
    private int rating;          // 별점 평가 (1자리 정수)
    private String content;      // 리뷰 내용
    private Date regDate;        // 작성 날짜

    private String memberName;
    public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	// Getter & Setter
    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }
}
