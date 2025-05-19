package kr.admin.movie;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;
import kr.util.DBUtil;
import kr.util.FileUtil;
import kr.util.CodeUtil;

public class UpdateMovieAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		String oldPosterUrl = req.getParameter("oldPosterUrl");
		String posterUrl = req.getParameter("poster_url");
		
		MovieVO vo = new MovieVO();
		vo.setMovie_id(Long.parseLong(req.getParameter("movie_id")));
		vo.setMv_title(req.getParameter("title"));
		
		if(posterUrl == null){
			vo.setPoster_url(oldPosterUrl);
		}else {
			FileUtil.removeFile(req, oldPosterUrl);
			FileUtil.uploadFile(req, posterUrl);
			vo.setPoster_url(posterUrl);
		}
		vo.setDirector(req.getParameter("director"));
		vo.setActor(req.getParameter("actor"));
		
		String genres = String.join(",", req.getParameter("genre"));
		vo.setGenre(genres);
		vo.setAge_limit(req.getParameter("age_limit"));
		vo.setRelease_date(DBUtil.toSqlDate(req.getParameter("release_date")));
		vo.setRuntime(Integer.parseInt(req.getParameter("runtime")));
		vo.setDescription(req.getParameter("description"));
		
		MovieDAO dao = MovieDAO.getInstance();
		
		int result = dao.updateMovie(vo);
		
		if(result == 1) {
			req.setAttribute("result_title", "영화 수정 성공");
			req.setAttribute("result_message", "영화 수정이 성공했습니다.");
			req.setAttribute("result_url", "main.do");
		}else {
			req.setAttribute("result_title", "영화 수정 실패");
			req.setAttribute("result_message", "영화 수정이 실패했습니다.");
			req.setAttribute("result_url", "movieManagement.do");
		}
		return "common/result_view.jsp";
	}

}
