package kr.admin.schedule;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.schedule.dao.ScheduleDAO;
import kr.slot.vo.SlotVO;

public class GetAvailableSlotAction implements Action {
	
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response){
        // AJAX 요청에 대한 응답 설정
        response.setContentType("application/json;charset=utf-8");
        
        // 파라미터 받기
        int auditoriumId = Integer.parseInt(request.getParameter("auditoriumId"));
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        String screeningDate = request.getParameter("screeningDate");
        
        // DAO를 통해 사용 가능한 시간대 조회
        ScheduleDAO dao = ScheduleDAO.getInstance();
        List<SlotVO> availableSlots;
		try {
			availableSlots = dao.getAvailableSlots(auditoriumId, movieId, screeningDate);
			ObjectMapper mapper = new ObjectMapper();
			String jsonData = mapper.writeValueAsString(availableSlots);
			response.getWriter().print(jsonData);
			response.getWriter().flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        // JSON 변환
        
        // JSON 데이터를 직접 출력
        
        return null;
    }
} 