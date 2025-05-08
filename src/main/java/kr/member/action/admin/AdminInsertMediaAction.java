package kr.member.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.moviemedia.dao.MovieMediaDAO;
import kr.moviemedia.vo.MovieMediaVO;
import kr.util.FileUtil;

public class AdminInsertMediaAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MovieMediaVO vo = new MovieMediaVO();
		
		vo.setMovie_id(Integer.parseInt(req.getParameter("movie_id")));
		vo.setMedia_type(req.getParameter("mediaType"));
		String FileName = FileUtil.uploadFile(req, "preview");
		vo.setMedia_url(FileName);
		vo.setMedia_status("Y");
		
		int result = MovieMediaDAO.getInstance().insertMedia(vo);
		
		if(result == 1) {
			req.setAttribute("result_title", "미디어 등록 완료");
			req.setAttribute("result_msg", "미디어 등록이 완료되었습니다.");
			req.setAttribute("result_url", "adminMain.do");
			return "common/result_view.jsp";
		}else {
			req.setAttribute("result_title", "미디어 등록 실패");
			req.setAttribute("result_msg", "미디어 등록이 실패했습니다.");
			req.setAttribute("result_url", "adminMain.do");
			return "common/result_view.jsp";
		}
	}

}
