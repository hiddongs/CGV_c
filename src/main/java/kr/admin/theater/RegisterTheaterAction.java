package kr.admin.theater;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.theater.dao.TheaterDAO;
import kr.theater.vo.TheaterVO;
import kr.util.CodeUtil;

public class RegisterTheaterAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 관리자 권한 체크
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		// POST 방식 요청만 처리
		if(!req.getMethod().equalsIgnoreCase("POST")) {
			return "redirect:/admin/theaterManagement.do";
		}
		
		// 요청 파라미터 인코딩 설정
		req.setCharacterEncoding("UTF-8");
		
		// 요청 파라미터 가져오기
		String name = req.getParameter("name");
		String region = req.getParameter("region");
		String description = req.getParameter("description");
		
		// 극장 정보 객체 생성
		TheaterVO theater = new TheaterVO();
		theater.setName(name);
		theater.setRegion(region);
		theater.setDescription(description);
		
		// 극장 등록 처리
		TheaterDAO.getInstance().insertTheater(theater);
		
		return "redirect:/admin/theaterManagement.do";
	}
}
