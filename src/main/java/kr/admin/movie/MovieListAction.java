package kr.admin.movie;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;

public class MovieListAction implements Action {

	  @Override
	    public String execute(HttpServletRequest request, HttpServletResponse response) {
	        
	    	
	    	response.setContentType("application/json;charset=utf-8");
	        response.setCharacterEncoding("utf-8");
	        
	        String order = request.getParameter("order");
	        MovieDAO dao = MovieDAO.getInstance();
	        List<MovieVO> movieList = new ArrayList<>();
	        
	        try {
	            if("showing".equals(order)) {
	                movieList = dao.getShowingMovieList();
	            } else if("release".equals(order)) {
	                movieList = dao.getReleaseMovieList();
	            } else {
	                movieList = dao.getEveryMovieList();
	            }
	            
	            ObjectMapper mapper = new ObjectMapper();
	            mapper.writeValue(response.getWriter(), movieList);
	            
	            return null; // Return null to prevent forwarding
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            try {
					response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				} catch (IOException e1) {
					e1.printStackTrace();
				}
	            return null; // Return null to prevent forwarding
	        }
	    }

}
