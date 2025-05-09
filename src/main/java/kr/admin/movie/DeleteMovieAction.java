package kr.admin.movie;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;
import kr.moviemedia.dao.MovieMediaDAO;
import kr.moviemedia.vo.MovieMediaVO;
import kr.util.CodeUtil;
import kr.util.FileUtil;

public class DeleteMovieAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		
		int movie_id = Integer.parseInt(req.getParameter("movie_id"));
		System.out.println("movie_id : " + movie_id);
		MovieVO vo = MovieDAO.getInstance().getMovie(movie_id);
		String poster_url = vo.getPoster_url();
		MovieDAO dao = MovieDAO.getInstance();
		
		List<MovieMediaVO> list = MovieMediaDAO.getInstance().getTargetMovieMediaList(movie_id);
		
		if(list != null) {
			list.stream().forEach( e -> FileUtil.removeFile(req, e.getMedia_url()));
		}
		int result = dao.deleteMovie(movie_id);
		if(result > 0) {
			if(poster_url != null && !poster_url.isEmpty()) {
				FileUtil.removeFile(req, poster_url);
			}
			
			req.setAttribute("result_title", "영화삭제완료");
			req.setAttribute("result_message", "영화삭제 및 관련 데이터가 삭제완료되었습니다.");
			req.setAttribute("result_url", "movieManagement.do");
		} else {
			req.setAttribute("result_title", "영화삭제 실패");
			req.setAttribute("result_message", "영화 삭제가 실패했습니다.");
			req.setAttribute("result_url", "movieManagement.do");
		}
		
		return "common/result_view.jsp";
	}

}
