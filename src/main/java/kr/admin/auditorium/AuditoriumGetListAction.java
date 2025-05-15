package kr.admin.auditorium;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.auditorium.dao.AuditoriumDAO;
import kr.auditorium.vo.AuditoriumVO;
import kr.controller.Action;

public class AuditoriumGetListAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Long theaterId = Long.parseLong(req.getParameter("theaterId"));
		List<AuditoriumVO> auditoriumList = AuditoriumDAO.getInstance().getAuditoriumList(theaterId);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonAuditorumList = mapper.writeValueAsString(auditoriumList);
		mapper.writeValue(resp.getWriter(), auditoriumList);
		
		return null;
	}

}
