package kr.admin.coupon;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.coupon.dao.CouponDAO;
import kr.util.CodeUtil;

public class CouponDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		int couponId = Integer.parseInt(req.getParameter("couponId"));
		int result = CouponDAO.getInstance().deleteCoupon(couponId);
		
		if(result > 0) {
			req.setAttribute("result_title", "쿠폰 삭제 완료");
			req.setAttribute("result_message", "쿠폰이 성공적으로 삭제되었습니다.");
		} else {
			req.setAttribute("result_title", "쿠폰 삭제 실패");
			req.setAttribute("result_message", "쿠폰 삭제 중 오류가 발생했습니다.");
		}
		
		req.setAttribute("result_url", "couponManagement.do");
		return "common/result_view.jsp";
	}

}
