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
	        String id = request.getParameter("id");
	        String name = request.getParameter("name");
	        String password = request.getParameter("password");
	        String type = request.getParameter("type");

	        // 유효성/중복 체크
	        if (id == null || id.isBlank() || name == null || name.isBlank()
	            || password == null || password.isBlank() || type == null) {
	            request.getSession().setAttribute("flash", "필수 항목을 입력하세요.");
	            return "redirect:/signup/signUp.do";
	        }
	        if (memberService.isExistId(id)) {
	            request.getSession().setAttribute("flash", "이미 존재하는 아이디입니다.");
	            return "redirect:/signup/signUp.do";
	        }

	        MemberVO member = new MemberVO(id, password, name, type);
	        memberService.registerMember(member);

	        request.getSession().setAttribute("flash", "회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
	        return "redirect:/login/login.do";

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.getSession().setAttribute("flash", "회원가입 중 오류가 발생했습니다.");
	        return "redirect:/signup/signUp.do";
	    }
	}

	public MemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
}
