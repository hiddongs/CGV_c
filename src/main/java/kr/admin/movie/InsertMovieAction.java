package kr.admin.movie;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;
import kr.util.CodeUtil;
import kr.util.DBUtil;
import kr.util.FileUtil;

public class InsertMovieAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		MovieVO movie = new MovieVO();
		movie.setMv_title(req.getParameter("title"));
		
		Part filePart = req.getPart("poster_url");
		if(filePart != null && filePart.getSize() > 0) {
			String fileName = FileUtil.uploadFile(req, "poster_url");
			movie.setPoster_url(fileName);
		}
		
		movie.setDirector(req.getParameter("director"));
		movie.setActor(req.getParameter("actor"));
		
		String genres = String.join(",", req.getParameter("genre"));
		movie.setGenre(genres);
		movie.setAge_limit(req.getParameter("age_limit"));
		movie.setRelease_date(DBUtil.toSqlDate(req.getParameter("release_date")));
		movie.setRuntime(Integer.parseInt(req.getParameter("runtime")));
		movie.setDescription(req.getParameter("description"));
		
		MovieDAO dao = MovieDAO.getInstance();
		int result = dao.insertMovie(movie);
		
		if(result == 1) {
			req.setAttribute("result_title", "영화등록 완료");
			req.setAttribute("result_msg", "영화등록이 완료되었습니다.");
			req.setAttribute("result_url", "main.do");
		} else {
			req.setAttribute("result_title", "영화등록 실패");
			req.setAttribute("result_msg", "영화등록이 실패했습니다.");
			req.setAttribute("result_url", "main.do");
		}
		
		return "common/result_view.jsp";
	}

}
