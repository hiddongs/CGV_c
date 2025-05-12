package kr.admin.media;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.media.dao.MovieMediaDAO;
import kr.util.CodeUtil;

public class MediaStatusUpdateAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		
		int media_id = Integer.parseInt(req.getParameter("media_id"));
		String status = req.getParameter("status");
		
		MovieMediaDAO dao = MovieMediaDAO.getInstance();
		int result = dao.updateMediaStatus(media_id, status);
		
		req.setAttribute("result", result);
		return null;
	}

}
