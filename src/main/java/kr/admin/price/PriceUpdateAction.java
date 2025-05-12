package kr.admin.price;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.price.dao.PriceDAO;
import kr.price.vo.PriceVO;
import kr.util.CodeUtil;

public class PriceUpdateAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 관리자 권한 체크
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		// POST 방식 요청만 처리
		if(!req.getMethod().equalsIgnoreCase("POST")) {
			return "redirect:/admin/priceManagement.do";
		}
		
		// 요청 파라미터 인코딩 설정
		req.setCharacterEncoding("UTF-8");
		
		// 요청 파라미터 가져오기
		int price = Integer.parseInt(req.getParameter("price"));
		int weekend = Integer.parseInt(req.getParameter("weekend"));
		int kids = Integer.parseInt(req.getParameter("kids"));
		int afternoon = Integer.parseInt(req.getParameter("afternoon"));
		int midnight = Integer.parseInt(req.getParameter("midnight"));
		int imax = Integer.parseInt(req.getParameter("imax"));
		int screenX = Integer.parseInt(req.getParameter("screenX"));
		int p_4DX = Integer.parseInt(req.getParameter("p_4DX"));
		int p_3D = Integer.parseInt(req.getParameter("p_3D"));
		
		// 가격 정보 객체 생성
		PriceVO priceVO = new PriceVO();
		priceVO.setPrice(price);
		priceVO.setWeekend(weekend);
		priceVO.setKids(kids);
		priceVO.setAfternoon(afternoon);
		priceVO.setMidnight(midnight);
		priceVO.setImax(imax);
		priceVO.setScreenX(screenX);
		priceVO.setP_4DX(p_4DX);
		priceVO.setP_3D(p_3D);
		
		// 가격 정보 업데이트 처리
		PriceDAO.getInstance().updatePrice(priceVO);
		
		return "redirect:/admin/priceManagement.do";
	}
}
