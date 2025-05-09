package kr.admin.movie;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.moivetype.vo.MovieTypeVO;
import kr.util.CodeUtil;

public class UpdateMovieTypeFormAction implements Action {
	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		int movie_id = Integer.parseInt(req.getParameter("movie_id"));		
		req.setAttribute("movie_id", movie_id);
		return "admin/movie/updateMovieType.jsp";
		
	}

}
