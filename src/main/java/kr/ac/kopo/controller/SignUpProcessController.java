package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;

public class SignUpProcessController implements Controller {

	private MemberService memberService;

	public SignUpProcessController() {
		this.memberService = new MemberService();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		try {
			// 1. 파라미터 추출
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String type = request.getParameter("type");

			// 2. 아이디 중복 검사
			if (memberService.isExistId(id)) {
				request.setAttribute("msg", "이미 존재하는 아이디입니다.");
				request.setAttribute("url", "/register.jsp");
				return "/jsp/result.jsp";
			}

			// 3. 비밀번호 암호화 (추후 적용 가능)
			// String hashedPw = BCrypt.hashpw(password, BCrypt.gensalt());

			// 4. 회원 정보 등록
			MemberVO member = new MemberVO(id, password, name, type);
			memberService.registerMember(member);

			// 5. 가입 완료 후 메시지
			request.setAttribute("msg", "회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
			request.setAttribute("url", "/login.jsp");
			return "/jsp/result.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "회원가입 중 오류가 발생했습니다.");
			request.setAttribute("url", "/register.jsp");
			return "/jsp/result.jsp";
		}
	}

	public MemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
}
