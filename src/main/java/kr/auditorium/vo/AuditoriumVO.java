package kr.auditorium.vo;


public class AuditoriumVO {

	
	private Long auditoriumId;
	private Long theaterId;
	private String name;
	private String type;
	
	public Long getAuditoriumId() {
		return auditoriumId;
	}
	public void setAuditoriumId(Long auditoriumId) {
		this.auditoriumId = auditoriumId;
	}
	public Long getTheaterId() {
		return theaterId;
	}
	public void setTheaterId(Long theaterId) {
		this.theaterId = theaterId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}


}
