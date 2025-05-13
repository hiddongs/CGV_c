package kr.admin.coupon;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.cp_possess.dao.CpPossessDAO;
import kr.cp_possess.vo.CpPossessVO;
import kr.util.CodeUtil;

public class CouponIssueAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		int coupon_id = Integer.parseInt(req.getParameter("couponId"));
		int member_id = Integer.parseInt(req.getParameter("memberId"));
		
		CpPossessVO cpPossess = new CpPossessVO();
		cpPossess.setCoupon_id((long) coupon_id);
		cpPossess.setMember_id((int) member_id);
		
		CpPossessDAO dao = CpPossessDAO.getInstance();
		int result = dao.getInstance().issueCoupon(cpPossess);
		
		if(result == 1) {
			req.setAttribute("result_title", "쿠폰발급 완료");
			req.setAttribute("result_message", "쿠폰발급이 완료되었습니다");
			req.setAttribute("result_url", "couponManagement.do");
		} else {
			req.setAttribute("result_title", "쿠폰발급실패");
			req.setAttribute("result_message", "쿠폰발급이 실패했습니다");
			req.setAttribute("result_url", "couponManagement.do");
		}
		
		return "common/result_view.jsp";
	}

}
