package kr.admin.media;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.media.dao.MovieMediaDAO;
import kr.media.vo.MovieMediaVO;

public class GetMovieMediaAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int movie_id = Integer.parseInt(req.getParameter("movie_id"));
		List<MovieMediaVO> movieMediaList = MovieMediaDAO.getInstance().getTargetMovieMediaList(movie_id);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(resp.getWriter(), movieMediaList);
		return null;
	}
}
