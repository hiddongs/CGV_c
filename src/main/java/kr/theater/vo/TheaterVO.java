package kr.theater.vo;

public class TheaterVO {
	
	
   private int theaterId; // 극장 ID
   private String region; // 지역
   private String name; //극장 지역
   private String description; //극장 묘사

public int getTheaterId() {
	return theaterId;
}
public void setTheaterId(int theaterId) {
	this.theaterId = theaterId;
}
public String getRegion() {
	return region;
}
public void setRegion(String region) {
	this.region = region;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}

   
}
