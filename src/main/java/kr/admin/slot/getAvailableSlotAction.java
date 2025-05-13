package kr.admin.slot;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.schedule.dao.ScheduleDAO;
import kr.slot.dao.SlotDAO;
import kr.slot.vo.SlotVO;

public class getAvailableSlotAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Long theaterId = Long.parseLong(req.getParameter("theaterId"));
		Long auditoriumId = Long.parseLong(req.getParameter("auditoriumId"));
		
		String screeningDate = req.getParameter("screeningDate");
		LocalDate ld = LocalDate.parse(screeningDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		Date date = Date.valueOf(ld);
		
		List<SlotVO> screeningTime = ScheduleDAO.getInstance().getScreeningTime(theaterId, auditoriumId , date);
		
		List<SlotVO> slotList = SlotDAO.getInstance().getSlotList();
		
		for(int i = slotList.size()-1 ; i >= 0 ; i--) {
			for(SlotVO screeningSlot : screeningTime) {
				if(slotList.get(i).getStartTime().equals(screeningSlot.getStartTime())) {
					slotList.remove(i);
				}
			}
		}
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(resp.getWriter(), slotList);
		return null;
	}

}
