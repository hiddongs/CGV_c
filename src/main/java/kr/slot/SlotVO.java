package kr.slot;

import java.sql.Timestamp;

public class SlotVO {
    private int slotId;
    private Timestamp startTime;
    private Timestamp endTime;
	public int getSlotId() {
		return slotId;
	}
	public void setSlotId(int slotId) {
		this.slotId = slotId;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

    // Getters and Setters
    
}
