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
		Long theaterId = Long.parseLong(req.getParameter("theaterId"));
		System.out.println("나온거 : " + theaterId);
		req.setAttribute("theaterId", theaterId);
		
		return "/admin/schedule/registerScheduleForm.jsp";
	}
}
