package kr.util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.member.vo.MemberVO;

public class CodeUtil {
    
	public static boolean isAdmin(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		return member != null && member.getMember_id() == 1;
	}
	
	/**
	 * 관리자가 아닌 경우 true를 반환
	 * @param req HttpServletRequest
	 * @return 관리자가 아니면 true, 관리자면 false
	 */
	public static boolean isNotAdmin(HttpServletRequest req) {
		return !isAdmin(req);
	}
}
