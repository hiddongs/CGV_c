package kr.movie.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;

public class MovieListAction implements Action {
    public String execute(HttpServletRequest req, HttpServletResponse resp) {
        MovieDAO dao = MovieDAO.getInstance();
        List<MovieVO> list = dao.getAvailableMovies();
        req.setAttribute("movieList", list);
        return "movie/movieList.jsp";
    }
}
