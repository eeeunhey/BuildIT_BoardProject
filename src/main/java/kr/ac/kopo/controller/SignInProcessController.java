package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;

public class SignInProcessController implements Controller {

    private MemberService memberService;

    public SignInProcessController() {
        setMemberService(new MemberService());
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // 1. 파라미터 추출
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        // 2. VO 객체에 데이터 담기
        MemberVO member = new MemberVO();
        member.setId(id);
        member.setPassword(password);



        // 4. 완료 후 로그인 페이지로 리다이렉트
        return "redirect:/login.do";
    }

	public MemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
}
