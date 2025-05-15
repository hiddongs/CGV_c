package kr.admin.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.member.dao.MemberDAO;

public class MemberStatusUpdateAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Long memberId = Long.parseLong(req.getParameter("memberId"));
		MemberDAO.getInstance().changeStatus(memberId);
		return null;
	}

}
