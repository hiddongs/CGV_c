package kr.admin.schedule;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.util.CodeUtil;

public class RegisterScheduleFormAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 관리자 체크
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		// 극장 ID 파라미터 가져오기 (필요한 경우)
		String theaterIdParam = req.getParameter("theaterId");
		if(theaterIdParam != null && !theaterIdParam.trim().isEmpty()) {
			try {
				Long theaterId = Long.parseLong(theaterIdParam);
				// 요청 속성에 theaterId 값 설정
				req.setAttribute("theaterId", theaterId);
				// 요청 속성에 문자열 형태로도 설정 (JavaScript에서 사용하기 위해)
				req.setAttribute("theaterIdStr", theaterIdParam);
				System.out.println("설정된 theaterId: " + theaterId); // 디버깅용 로그
			} catch (NumberFormatException e) {
				System.out.println("잘못된 theaterId 형식: " + theaterIdParam);
			}
		} else {
			// 테스트용 값 설정 (나중에 제거 필요)
			// req.setAttribute("theaterId", 1L);
			// req.setAttribute("theaterIdStr", "1");
			System.out.println("theaterId 파라미터 없음");
		}
		
		return "/admin/schedule/registerScheduleForm.jsp";
	}
}
