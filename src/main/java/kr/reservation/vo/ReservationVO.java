package kr.reservation.vo;

import java.sql.Date;

public class ReservationVO {
    private int reservationID;         // 예매 고유 식별자
    private int memberID;             // 유저 식별자
    private int scheduleID;           // 상영 스케줄 ID
    private int seatID;            // 좌석 정보 (예: A5)
    private String paymentStatus;     // 결제 상태 (완료/대기)
    private String paymentDate;       // 결제한 날짜 (문자열)
    private int viewers;              // 관람 인원 수
    private Date screeningDate;       // 관람 날짜 (java.sql.Date)
    private long pMovie;              // 영화 가격
    private String name;              // 극장 이름
    private String mvTitle;           // 영화 제목
    private String movieType;         // 상영관 유형 (IMAX, 4DX 등)

    // Getter & Setter
    public int getReservationID() {
        return reservationID;
    }

    public void setReservationID(int reservationID) {
        this.reservationID = reservationID;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public int getScheduleID() {
        return scheduleID;
    }

    public void setScheduleID(int scheduleID) {
        this.scheduleID = scheduleID;
    }

    public int getSeatID() {
        return seatID;
    }

    public void setSeatID(int seatID) {
        this.seatID = seatID;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public int getViewers() {
        return viewers;
    }

    public void setViewers(int viewers) {
        this.viewers = viewers;
    }

    public Date getScreeningDate() {
        return screeningDate;
    }

    public void setScreeningDate(Date screeningDate) {
        this.screeningDate = screeningDate;
    }

    public long getPMovie() {
        return pMovie;
    }

    public void setPMovie(long pMovie) {
        this.pMovie = pMovie;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMvTitle() {
        return mvTitle;
    }

    public void setMvTitle(String mvTitle) {
        this.mvTitle = mvTitle;
    }

    public String getMovieType() {
        return movieType;
    }

    public void setMovieType(String movieType) {
        this.movieType = movieType;
    }
}
