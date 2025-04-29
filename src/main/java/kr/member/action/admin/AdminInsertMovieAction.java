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
import kr.util.CodeUtil;
import kr.util.DBUtil;
import kr.util.FileUtil;

public class AdminInsertMovieAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		MovieVO movieVO = new MovieVO();
		
		movieVO.setMv_title(req.getParameter("title"));
		movieVO.setActor(req.getParameter("actor"));
		movieVO.setDirector(req.getParameter("director"));
		// 포스터 업로드 처리
		String posterFileName = FileUtil.uploadFile(req, "poster_url");
		movieVO.setPoster_url(posterFileName);
		movieVO.setGenre(req.getParameter("genre"));
		String genreStr = null;
		String[] genres = req.getParameterValues("genre");
		genreStr = String.join(",", genres);
		movieVO.setGenre(genreStr);
		movieVO.setRuntime(Integer.parseInt(req.getParameter("runtime")));
		movieVO.setRelease_date(DBUtil.toSqlDate(req.getParameter("release_date")));
		movieVO.setDescription(req.getParameter("description"));
		movieVO.setActor(req.getParameter("age_limit"));
		
		MovieDAO movieDAO = MovieDAO.getInstance();
		
		int result = movieDAO.insertMovie(movieVO);
		
		if(result == 1) {
			req.setAttribute("result_title", "영화등록 완료");
			req.setAttribute("result_msg", "영화등록이 완료되었습니다.");
			req.setAttribute("result_url", "adminMain.do");
			return "common/result_view.jsp";
		}else {
			req.setAttribute("result_title", "영화등록 실패");
			req.setAttribute("result_msg", "영화등록이 실패했습니다.");
			req.setAttribute("result_url", "adminMain.do");
			return "common/result_view.jsp";
		}
	}

}
