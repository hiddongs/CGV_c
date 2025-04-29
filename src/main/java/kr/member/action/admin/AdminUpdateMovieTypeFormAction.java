package kr.member.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.member.vo.MemberVO;
import kr.util.CodeUtil;

public class AdminUpdateMovieTypeFormAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		int movie_id = Integer.parseInt(req.getParameter("movie_id"));		
		req.setAttribute("movie_id", movie_id);
		return "member/admin/adminUpdateMovieType.jsp";
		
	}

}
