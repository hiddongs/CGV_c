package kr.event.action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.event.vo.EventVO;

public class EventTypeListAction implements Action{


	
	    @Override
	    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        String type = req.getParameter("type");
	        if (type == null) type = "SPECIAL";

	        EventDAO dao = EventDAO.getInstance();
	        List<EventVO> eventList = dao.getEventByType(type);
	        req.setAttribute("eventList", eventList);
	        req.setAttribute("now", new java.util.Date());
	        req.setAttribute("selectedType", type); 
	        return "/event/eventList.jsp";
	    }
	



}
