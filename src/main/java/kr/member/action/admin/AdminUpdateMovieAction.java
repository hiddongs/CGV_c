package kr.member.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.member.vo.MemberVO;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;
import kr.util.DBUtil;
import kr.util.FileUtil;
import kr.util.CodeUtil;

public class AdminUpdateMovieAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		String oldPosterUrl = req.getParameter("oldPosterUrl");
		String posterUrl = req.getParameter("poster_url");
		
		MovieVO movieVO = new MovieVO();
		movieVO.setMovie_id(Integer.parseInt(req.getParameter("movie_id")));
		movieVO.setMv_title(req.getParameter("title"));
		
		if(req.getParameter("deletePosterUrl").isEmpty()){
			movieVO.setPoster_url(oldPosterUrl);
		}else {
			FileUtil.removeFile(req, oldPosterUrl);
			FileUtil.uploadFile(req, posterUrl);
			movieVO.setPoster_url(posterUrl);
		}
		movieVO.setDirector(req.getParameter("director"));
		movieVO.setActor(req.getParameter("actor"));
		
		String genres = String.join(",", req.getParameter("genre"));
		movieVO.setGenre(genres);
		movieVO.setAge_limit(req.getParameter("age_limit"));
		movieVO.setRelease_date(DBUtil.toSqlDate(req.getParameter("release_date")));
		movieVO.setRuntime(Integer.parseInt(req.getParameter("runtime")));
		movieVO.setDescription(req.getParameter("description"));
		
		MovieDAO dao = MovieDAO.getInstance();
		
		int result = dao.updateMovie(movieVO);
		
		if(result == 1) {
			req.setAttribute("result_title", "영화 수정 성공");
			req.setAttribute("result_message", "영화 수정이 성공했습니다.");
			req.setAttribute("result_url", "adminMain.do");
		}else {
			req.setAttribute("result_title", "영화 수정 실패");
			req.setAttribute("result_message", "영화 수정이 실패했습니다.");
			req.setAttribute("result_url", "adminMain.do");
		}
		return "common/result_view.jsp";
	}

}
