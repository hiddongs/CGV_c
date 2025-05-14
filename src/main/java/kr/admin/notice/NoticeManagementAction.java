package kr.admin.notice;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.notice.dao.NoticeDAO;
import kr.notice.vo.NoticeVO;

public class NoticeManagementAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<NoticeVO> noticeList = NoticeDAO.getInstance().getEveryNotice();
		
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonNoticeList = mapper.writeValueAsString(noticeList);
		req.setAttribute("noticeList", jsonNoticeList);
		
		return "admin/notice/noticeManagement.jsp";
	}

}
