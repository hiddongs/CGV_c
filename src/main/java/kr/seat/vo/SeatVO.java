package kr.seat.vo;


public class SeatVO {
    private int seatID;
    private int theaterID;
    private String seatRow;
    private String seatColumn;
    private String seatName;

    public int getSeatID() {
        return seatID;
    }
    public void setSeatID(int seatID) {
        this.seatID = seatID;
    }
    public int getTheaterID() {
        return theaterID;
    }
    public void setTheaterID(int theaterID) {
        this.theaterID = theaterID;
    }
    public String getSeatRow() {
        return seatRow;
    }
    public void setSeatRow(String seatRow) {
        this.seatRow = seatRow;
    }
    public String getSeatColumn() {
        return seatColumn;
    }
    public void setSeatColumn(String seatColumn) {
        this.seatColumn = seatColumn;
    }
    public String getSeatName() {
        return seatName;
    }
    public void setSeatName(String seatName) {
        this.seatName = seatName;
    }
}
