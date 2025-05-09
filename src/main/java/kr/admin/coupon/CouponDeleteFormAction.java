package kr.admin.coupon;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.coupon.dao.CouponDAO;
import kr.coupon.vo.CouponVO;
import kr.cp_possess.dao.CpPossessDAO;
import kr.cp_possess.vo.CpPossessVO;
import kr.util.CodeUtil;

public class CouponDeleteFormAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		List<CouponVO> couponList = CouponDAO.getInstance().getCouponList();
		req.setAttribute("couponList", couponList);
		List<CpPossessVO> cpPossessList = CpPossessDAO.getInstance().getCpPossessList();
		req.setAttribute("cpPossessList", cpPossessList);
		return "admin/coupon/couponDeleteForm.jsp";
	}
}
