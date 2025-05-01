package kr.member.action.admin;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.event.vo.EventVO;
import kr.util.CodeUtil;

public class AdminGetEventListAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		EventDAO dao = EventDAO.getInstance();
		List<EventVO> result = dao.getEveryEvent();
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(resp.getWriter(), result);
		
		return null;
	}

}
