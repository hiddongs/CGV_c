package kr.admin.media;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.moviemedia.dao.MovieMediaDAO;
import kr.moviemedia.vo.MovieMediaVO;

public class DeleteMediaAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		long media_id = Long.parseLong(req.getParameter("media_id"));
		
		int result = MovieMediaDAO.getInstance().deleteMedia(media_id);
		
		if(result == 1) {
			req.setAttribute("result_title", "미디어 삭제 성공");
			req.setAttribute("result_message", "성공적으로 삭제되었습니다");
		}else {
			req.setAttribute("result_title", "미디어 삭제 성공");
			req.setAttribute("result_message", "성공적으로 삭제되었습니다");
		}
		req.setAttribute("result_url", "movieManagement.do");
		return "common/result_view.jsp";
	}
}
