package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;

public class LoginProcessController implements Controller {

	private MemberService memberService;

	public LoginProcessController() {
		memberService = new MemberService();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 파라미터 추출(id, password)
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String type = request.getParameter("type");

		System.out.println("id : " + id + ", password : " + password);

		// DB(t_member)에서 로그인여부 판단
		MemberVO member = new MemberVO(id, password, type);
		MemberVO userVO = memberService.login(member);

		// 판단여부에 따른 결과 응답(response)
		String url = "";
		if (userVO == null) {
			// 로그인 실패
			request.setAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다.");
			url = "/login/login.do";
		} else {
			// 로그인 성공
			url = "redirect:/";
			// 세션등록
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);

			// 회원 유형 세션에 추가 // userVO.getType() 값이 DB에 PARTNER 또는 CLIENT 형태로 들어있다고 가정
			String userType = userVO.getType();
			session.setAttribute("userType", userType);

		}

		return url;
	}
}
