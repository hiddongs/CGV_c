package kr.admin.theater;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.theater.dao.TheaterDAO;
import kr.theater.vo.TheaterVO;
import kr.util.CodeUtil;

public class RegisterTheaterFormAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 관리자 권한 체크
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		// 지역 목록 가져오기
		List<TheaterVO> regionList = TheaterDAO.getInstance().getAllRegionList();
		req.setAttribute("regionList", regionList);
		
		return "admin/theater/registerTheaterForm.jsp";
	}
}
