package kr.schedule.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.schedule.dao.ScheduleDAO;
import kr.schedule.vo.ScheduleVO;

public class ScheduleAjaxAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int movieID = Integer.parseInt(req.getParameter("movieID"));
		int theaterID = Integer.parseInt(req.getParameter("theaterID"));
	
		ScheduleDAO dao = new ScheduleDAO();
		try {
			List<ScheduleVO> list= dao.getScheduleList(movieID, theaterID);
			
			JSONArray array = new JSONArray();
			System.out.println(">>> movieID: " + movieID);
			System.out.println(">>> theaterID: " + theaterID);
			
			System.out.println(">>> 결과 개수: " + list.size());
			for(ScheduleVO s : list) {
				JSONObject obj = new JSONObject();
				System.out.println(">>> schedule json: " + obj.toJSONString());

				obj.put("scheduleID", s.getScheduleID());
				obj.put("screeningTime", s.getScreeningTime());
				array.add(obj);
				
			}
			
			resp.setContentType("application/json;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.print(array.toString());
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "ajax:";
	}

}
