package kr.admin.movie;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.moivetype.vo.MovieTypeVO;
import kr.util.CodeUtil;

public class UpdateMovieTypeAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		String[] typeArr = req.getParameterValues("movie_type");
		String movieType = String.join(",", typeArr);
		
		int movie_id = Integer.parseInt(req.getParameter("movie_id"));
		
		int result = MovieDAO.getInstance().updateMovieType(movie_id, movieType);
		
		if(result == 1) {
			req.setAttribute("result_title", "영화타입 수정 완료");
			req.setAttribute("result_msg", "영화타입 수정이 완료되었습니다.");
			req.setAttribute("result_url", "movieManagement.do");
		} else {
			req.setAttribute("result_title", "영화타입 수정 실패");
			req.setAttribute("result_msg", "영화타입 수정이 실패했습니다.");
			req.setAttribute("result_url", "movieManagement.do");
		}
		
		return "common/result_view.jsp";
	}

}
