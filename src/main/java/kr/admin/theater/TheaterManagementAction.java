package kr.admin.theater;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.theater.dao.TheaterDAO;
import kr.theater.vo.TheaterVO;
import kr.util.CodeUtil;

public class TheaterManagementAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		List<TheaterVO> regionList = TheaterDAO.getInstance().getAllRegionList();
		ObjectMapper mapper = new ObjectMapper();
		String jsonRegionList = mapper.writeValueAsString(regionList);
		req.setAttribute("regionList", jsonRegionList);
		
		return "admin/theater/theaterManagement.jsp";
	}

}
