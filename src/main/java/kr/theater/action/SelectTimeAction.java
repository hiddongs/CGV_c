	package kr.theater.action;
	
	import java.text.SimpleDateFormat;
	import java.util.Date;
	import java.util.List;
	
	import jakarta.servlet.http.HttpServletRequest;
	import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.member.vo.MemberVO;
import kr.schedule.dao.ScheduleDAO;
	import kr.schedule.vo.ScheduleVO;
	
	public class SelectTimeAction implements Action {
		
		@Override
	    public String execute(HttpServletRequest req, HttpServletResponse resp) {
	        try {
	        	HttpSession session = req.getSession();
	    		MemberVO member = (MemberVO) session.getAttribute("member");
	    		int memberID = member.getMember_id(); // 로그인된 사용자 ID
	            String movieIDStr = req.getParameter("movieID");
	            String theaterIDStr = req.getParameter("theaterID");
	            String screenDate = req.getParameter("screenDate");
	
	            if (movieIDStr == null || theaterIDStr == null || movieIDStr.isEmpty() || theaterIDStr.isEmpty()) {
	                req.setAttribute("errorMsg", "영화 또는 극장 정보가 누락되었습니다.");
	                return "error/invalidParameter.jsp";
	            }
	
	            int movieID = Integer.parseInt(movieIDStr);
	            int theaterID = Integer.parseInt(theaterIDStr);
	            if (screenDate == null || screenDate.isEmpty()) {
	                screenDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	            }
	
	            ScheduleDAO dao = ScheduleDAO.getInstance();
	            List<ScheduleVO> scheduleList = dao.getScheduleWithAuditorium(movieID, theaterID, screenDate);
	
	            req.setAttribute("mem_ID", memberID);
	            req.setAttribute("movieID", movieID);
	            req.setAttribute("theaterID", theaterID);
	            req.setAttribute("screenDate", screenDate);
	            req.setAttribute("scheduleList", scheduleList);
	
	            return "theater/selectTime.jsp";
	        } catch (Exception e) {
	            e.printStackTrace();
	            req.setAttribute("errorMsg", "상영 시간 조회 중 오류가 발생했습니다.");
	            return "error/invalidParameter.jsp";
	        }
	    }
	}
	
	
