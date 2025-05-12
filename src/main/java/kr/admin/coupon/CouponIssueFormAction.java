package kr.admin.coupon;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.coupon.dao.CouponDAO;
import kr.coupon.vo.CouponVO;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import kr.util.CodeUtil;

public class CouponIssueFormAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		List<MemberVO> memberList = MemberDAO.getInstance().getMemberList();
		req.setAttribute("memberList", memberList);
		List<CouponVO> couponList = CouponDAO.getInstance().getCouponList();
		req.setAttribute("couponList", couponList);
		return "admin/coupon/couponIssueForm.jsp";
	}

}
