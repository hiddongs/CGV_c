package kr.member.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;
import kr.util.DBUtil;

public class AdminMovieInsertAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MovieVO movieVO = new MovieVO();
		
		movieVO.setMv_title(req.getParameter("title"));
		movieVO.setActor(req.getParameter("actor"));
		movieVO.setDirector(req.getParameter("director"));
		movieVO.setPoster_url(req.getParameter("poster_url"));
		movieVO.setGenre(req.getParameter("genre"));
		movieVO.setRuntime(Integer.parseInt(req.getParameter("runtime")));
		movieVO.setRelease_date(DBUtil.toSqlDate(req.getParameter("release_date")));
		movieVO.setDescription(req.getParameter("description"));
		
		MovieDAO movieDAO = MovieDAO.getInstance();
		
		int result = movieDAO.insertMovie(movieVO);
		
		if(result == 1) {
			req.setAttribute("result_title", "영화등록 완료");
			req.setAttribute("result_msg", "영화등록이 완료되었습니다.");
			req.setAttribute("result_url", "redirect:/member/adminPage.jsp");
			return "common/result_view.jsp";
		}else {
			req.setAttribute("result_title", "영화등록 실패");
			req.setAttribute("result_msg", "영화등록이 실패했습니다.");
			req.setAttribute("result_url", "redirect:/member/adminPage.jsp");
			return "common/result_view.jsp";
		}
	}

}
