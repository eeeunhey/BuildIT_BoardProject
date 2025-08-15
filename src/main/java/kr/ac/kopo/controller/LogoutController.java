package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.framework.Controller;

public class LogoutController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession(false); // 세션이 없으면 null
		if (session != null) {
			session.invalidate(); // 세션 종료
		}

		// 메인 페이지로 리다이렉트
		return "redirect:";
	}
}