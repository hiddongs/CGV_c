package kr.admin.coupon;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.coupon.dao.CouponDAO;
import kr.coupon.vo.CouponVO;
import kr.util.CodeUtil;
import kr.util.DBUtil;

public class CouponCreateAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CouponVO couponVO = new CouponVO();
		
		couponVO.setCouponName(req.getParameter("coupon_name"));
		couponVO.setDiscountAmount(Integer.parseInt(req.getParameter("discount_amount")));
		couponVO.setExpired_date(DBUtil.toSqlDate(req.getParameter("expired_date")));
		
		int result = CouponDAO.getInstance().insertCoupon(couponVO);
		if(result == 1 ) {
			req.setAttribute("result_title", "쿠폰 생성 성공");
			req.setAttribute("result_message", "쿠폰 생성이 완료되었습니다.");
			req.setAttribute("result_url", "couponManagement.do");
		}else {
			req.setAttribute("result_title", "쿠폰 생성 실패");
			req.setAttribute("result_message", "쿠폰 생성이 실패했습니다.");
			req.setAttribute("result_url", "couponManagement.do");
		}
		return "common/result_view.jsp";
	}

}
