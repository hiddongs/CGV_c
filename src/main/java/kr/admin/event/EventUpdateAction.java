package kr.admin.event;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.event.vo.EventVO;
import kr.member.vo.MemberVO;
import kr.util.CodeUtil;
import kr.util.DBUtil;
import kr.util.FileUtil;

public class EventUpdateAction implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
    	if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
    	
        EventVO event = new EventVO();
        String oldPosterUrl = req.getParameter("oldPosterUrl");
        Part filePart = req.getPart("poster_url");
        String posterUrl;
        String submittedFileName = (filePart != null) ? filePart.getSubmittedFileName() : "";

        if(submittedFileName != null && !submittedFileName.isEmpty()) {
            String newFilename = FileUtil.uploadFile(req, "poster_url");
            if(oldPosterUrl != null && !oldPosterUrl.isEmpty()) {
                FileUtil.removeFile(req, oldPosterUrl);
            }
            posterUrl = newFilename;
        } else {
            posterUrl = oldPosterUrl;
        }

        event.setEvent_id(Long.parseLong(req.getParameter("event_id")));
        event.setTitle(req.getParameter("title"));
        event.setContent(req.getParameter("content"));
        event.setStart_date(DBUtil.toSqlDate(req.getParameter("start_date")));
        event.setEnd_date(DBUtil.toSqlDate(req.getParameter("end_date")));
        event.setType(req.getParameter("type"));
        event.setPoster_url(posterUrl);

        int result = EventDAO.getInstance().updateEvent(event);

        if(result == 1) {
            req.setAttribute("result_title", "이벤트 수정 성공");
            req.setAttribute("result_message", "이벤트 수정이 완료되었습니다.");
            req.setAttribute("result_url", "eventManagement.do");
            return "common/result_view.jsp";
        } else {
            req.setAttribute("result_title", "이벤트 수정 실패");
            req.setAttribute("result_message", "이벤트 수정이 실패했습니다.");
            req.setAttribute("result_url", "eventManagement.do");
            return "common/result_view.jsp";
        }
    }
}
