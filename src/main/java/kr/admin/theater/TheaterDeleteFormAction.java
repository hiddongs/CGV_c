package kr.admin.theater;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.theater.dao.TheaterDAO;
import kr.theater.vo.TheaterVO;
import kr.util.CodeUtil;

public class TheaterDeleteFormAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 관리자 권한 체크
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		// 파라미터 가져오기
		int theaterId = Integer.parseInt(req.getParameter("theaterId"));
		
		// 극장 삭제 처리
		TheaterDAO.getInstance().deleteTheater(theaterId);
		
		return "redirect:/admin/theaterManagement.do";
	}

}
