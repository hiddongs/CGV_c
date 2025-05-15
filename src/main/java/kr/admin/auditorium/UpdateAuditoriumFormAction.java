package kr.admin.auditorium;

import java.io.IOException;

import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.auditorium.dao.AuditoriumDAO;
import kr.auditorium.vo.AuditoriumVO;
import kr.controller.Action;
import kr.movietype.dao.MovieTypeDAO;
import kr.movietype.vo.MovieTypeVO;

public class UpdateAuditoriumFormAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Long auditoriumId = Long.parseLong(req.getParameter("auditoriumId"));
		
		AuditoriumVO auditorium = AuditoriumDAO.getInstance().getAuditorium(auditoriumId);
		
		req.setAttribute("auditorium", auditorium);
		
		MovieTypeVO movieType = MovieTypeDAO.getInstance().getEveryMovieType();
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonMovieType = mapper.writeValueAsString( movieType);
		req.setAttribute("movieType", jsonMovieType);
		
		return "admin/auditorium/updateAuditoriumForm.jsp";
	}

}
