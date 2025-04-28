package kr.member.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.event.vo.EventVO;
import kr.util.DBUtil;
import kr.util.FileUtil;

/**
 * AdminEventUpdateAction
 * - 이벤트 수정(파일 업로드 포함) robust 버전
 */
public class AdminEventUpdateAction implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 인코딩
        req.setCharacterEncoding("UTF-8");

        // 2. 파라미터 및 VO 세팅
        EventVO event = new EventVO();
        String oldPosterUrl = req.getParameter("oldPosterUrl");
        // 파일 업로드 파트
        Part filePart = req.getPart("poster_url");
        String posterUrl;
        String submittedFileName = (filePart != null) ? filePart.getSubmittedFileName() : "";

        // 3. 파일 업로드: 새 파일 있으면 업로드/기존 삭제, 없으면 기존 유지
        if(submittedFileName != null && !submittedFileName.isEmpty()) {
            // 새 파일 업로드
            String newFilename = FileUtil.uploadFile(req, "poster_url");
            // 기존 파일 삭제
            if(oldPosterUrl != null && !oldPosterUrl.isEmpty()) {
                FileUtil.removeFile(req, oldPosterUrl);
            }
            posterUrl = newFilename;
        } else {
            posterUrl = oldPosterUrl;
        }

        // 4. 나머지 정보 세팅
        event.setEvent_id(Long.parseLong(req.getParameter("event_id")));
        event.setTitle(req.getParameter("title"));
        event.setContent(req.getParameter("content"));
        event.setStart_date(DBUtil.toSqlDate(req.getParameter("start_date")));
        event.setEnd_date(DBUtil.toSqlDate(req.getParameter("end_date")));
        event.setType(req.getParameter("type"));
        event.setPoster_url(posterUrl);

        // 5. DB 업데이트
        int result = EventDAO.getInstance().updateEvent(event);

        // 6. 결과 처리
        if(result == 1) {
            req.setAttribute("result_title", "이벤트 수정 성공");
            req.setAttribute("result_message", "이벤트 수정이 완료되었습니다.");
            req.setAttribute("result_url", "adminMain.do");
            return "common/result_view.jsp";
        } else {
            req.setAttribute("result_title", "이벤트 수정 실패");
            req.setAttribute("result_message", "이벤트 수정이 실패헀습니다.");
            req.setAttribute("result_url", "adminMain.do");
            return "common/result_view.jsp";
        }
    }
}
