package kr.member.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.util.CodeUtil;

public class AdminCouponDeleteFormAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		// TODO: 쿠폰 삭제 로직 구현
		
		return "member/admin/adminCouponManagement.jsp";
	}

}
