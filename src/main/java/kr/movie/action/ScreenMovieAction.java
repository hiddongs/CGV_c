package kr.movie.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;
import kr.util.StringUtil;

public class ScreenMovieAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Map<String, Object> mapAjax =  new HashMap<String,Object>();
		
		HttpSession session = req.getSession();
		Long user_num = (Long) session.getAttribute("user_num");
		if(user_num == null) {
			mapAjax.put("result", "logout");
		}else {
			
			MovieDAO dao = MovieDAO.getInstance();
			int movieId = Integer.parseInt(req.getParameter("movie_id"));
			MovieVO movie = dao.getShowingMovie(movieId);

		    
			mapAjax.put("movie",movie);
		}
		
		// TODO Auto-generated method stub
		return StringUtil.parseJSON(req, mapAjax);
     }

}
