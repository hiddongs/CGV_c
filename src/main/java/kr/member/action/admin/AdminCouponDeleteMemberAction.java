package kr.member.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.cp_possess.dao.CpPossessDAO;
import kr.util.CodeUtil;

public class AdminCouponDeleteMemberAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		int possessId = Integer.parseInt(req.getParameter("possessId"));
		
		int result = CpPossessDAO.getInstance().deleteCouponFromMember(possessId);
		
		if(result > 0) {
			req.setAttribute("result_title", "멤버 쿠폰 삭제완료");
			req.setAttribute("result_message", "멤버 쿠폰 삭제완료");
		} else {
			req.setAttribute("result_title", "멤버 쿠폰 삭제 실패");
			req.setAttribute("result_message", "멤버 쿠폰 삭제 실패");
		}
		
		req.setAttribute("result_url", "adminCouponDeleteForm.do");
		return "common/result_view.jsp";
	}
}
