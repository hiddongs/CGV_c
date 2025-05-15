package kr.slot.vo;

import java.sql.Time;

public class SlotVO {
	
	private Long slotId;
	private Time startTime;
	
	public Long getSlotId() {
		return slotId;
	}
	public void setSlotId(Long slotId) {
		this.slotId = slotId;
	}
	public Time getStartTime() {
		return startTime;
	}
	public void setStartTime(Time startTime) {
		this.startTime = startTime;
	}
	
}
