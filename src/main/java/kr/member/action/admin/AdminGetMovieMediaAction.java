package kr.member.action.admin;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.moviemedia.dao.MovieMediaDAO;
import kr.moviemedia.vo.MovieMediaVO;

public class AdminGetMovieMediaAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int movie_id = Integer.parseInt(req.getParameter("movie_id"));
		List<MovieMediaVO> movieMediaList = MovieMediaDAO.getInstance().getTargetMovieMediaList(movie_id);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(resp.getWriter(), movieMediaList);
		return null;
	}

}
