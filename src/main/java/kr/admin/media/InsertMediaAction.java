package kr.admin.media;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.media.dao.MovieMediaDAO;
import kr.media.vo.MovieMediaVO;
import kr.util.CodeUtil;
import kr.util.FileUtil;

public class InsertMediaAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
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
			req.setAttribute("result_url", "movieManagement.do");
		} else {
			req.setAttribute("result_title", "미디어 등록 실패");
			req.setAttribute("result_msg", "미디어 등록이 실패했습니다.");
			req.setAttribute("result_url", "movieManagement.do");
		}
		
		return "common/result_view.jsp";
	}

}
