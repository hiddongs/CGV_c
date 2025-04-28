package kr.member.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;

public class AdminDeleteMovieAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MovieDAO dao = MovieDAO.getInstance();
		int movie_id = Integer.parseInt(req.getParameter("movie_id"));
		int result = dao.deleteMovie(movie_id);
		
		if(result == 1) {
			req.setAttribute("result_title", "영화삭제완료");
			req.setAttribute("result_message", "영화삭제 및 관련 데이터가 삭제완료되었습니다.");
			req.setAttribute("result_url", "adminMain.do");
			return "common/result_view.jsp";
		}else {
			req.setAttribute("result_title", "영화삭제 실패");
			req.setAttribute("result_message", "영화 삭제가 실패했습니다.");
			req.setAttribute("result_url", "adminMain.do");
			return "common/result_view.jsp";
		}
		
	}

}
