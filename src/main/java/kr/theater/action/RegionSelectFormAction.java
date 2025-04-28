package kr.theater.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;

public class RegionSelectFormAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 // 사용자가 선택한 극장 ID 받아오기
        String theaterId = req.getParameter("theaterId");

        // 넘어온 극장 ID를 다음 JSP에서 사용할 수 있게 저장
        req.setAttribute("theaterId", theaterId);

		return "theater/selectRegion.jsp";
	}

}
