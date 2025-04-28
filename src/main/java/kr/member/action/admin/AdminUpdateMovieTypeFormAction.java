package kr.member.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;

public class AdminUpdateMovieTypeFormAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int movie_id = Integer.parseInt(req.getParameter("movie_id"));		
		req.setAttribute("movie_id", movie_id);
		return "member/adminUpdateMovieType.jsp";
	}

}
