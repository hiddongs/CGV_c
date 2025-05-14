package kr.admin.auditorium;

import java.io.IOException;

import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.movietype.dao.MovieTypeDAO;
import kr.movietype.vo.MovieTypeVO;

public class InsertAuditoriumFormAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Long theaterId = Long.parseLong(req.getParameter("theaterId"));
		req.setAttribute("theaterId", theaterId);
		MovieTypeVO movieType = MovieTypeDAO.getInstance().getEveryMovieType();
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonMovieType = mapper.writeValueAsString( movieType);
		req.setAttribute("movieType", jsonMovieType);
		
		return "admin/auditorium/insertAuditoriumForm.jsp";
	}

}
