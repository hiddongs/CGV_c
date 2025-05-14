package kr.admin.movie;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movietype.dao.MovieTypeDAO;
import kr.movietype.vo.MovieTypeVO;
import kr.util.CodeUtil;

public class UpdateMovieTypeFormAction implements Action {
	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		Long movie_id = Long.parseLong(req.getParameter("movie_id"));		
		req.setAttribute("movie_id", movie_id);
		
		MovieTypeVO movietype = MovieTypeDAO.getInstance().getMovietype(movie_id);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonMovieType = mapper.writeValueAsString(movietype);
		req.setAttribute("movietype", jsonMovieType);
		
		return "admin/movie/updateMovieType.jsp";
		
	}

}
