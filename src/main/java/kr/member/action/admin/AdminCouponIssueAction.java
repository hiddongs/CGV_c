package kr.member.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.coupon.dao.CouponDAO;

public class AdminCouponIssueAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Long couponID = Long.parseLong(req.getParameter("couponId"));
		int memberId = Integer.parseInt(req.getParameter("memberId"));
		
		int result = CouponDAO.getInstance().issueCoupon(couponID, memberId);
		
		if(result == 1) {
			req.setAttribute("result_title", "쿠폰발급완료");
			req.setAttribute("result_message", "쿠폰발급이 완료되었습니다.");
			req.setAttribute("result_url", "adminMain.do");
			return "common/result_view.jsp";
		}else {
			req.setAttribute("result_title", "쿠폰발급 실패");
			req.setAttribute("result_message", "쿠폰발급이 실패했습니다.");
			req.setAttribute("result_url", "adminMain.do");
			return "common/result_view.jsp";
		}
	}

}
