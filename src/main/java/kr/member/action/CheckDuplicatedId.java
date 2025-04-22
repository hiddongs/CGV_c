package kr.member.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.util.StringUtil;

public class CheckDuplicatedId implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("mem_id");
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		boolean find_result = memberDAO.checkDuplicateId(id);
		Map<String, String> ajaxResult = new HashMap<>();
		
		if(find_result) { // 찾은게 있음
			ajaxResult.put("result", "idDuplicated");
		}else if(!find_result) { // 찾은게 없음
			ajaxResult.put("result", "idNotFound");
		}
		return StringUtil.parseJSON(req, ajaxResult);
	}

}
