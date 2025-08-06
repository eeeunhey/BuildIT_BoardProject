package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.member.service.MemberService;

public class CheckIdController implements Controller {

    private MemberService memberService;

    public CheckIdController() {
        this.memberService = new MemberService();
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        try {
            String id = request.getParameter("id");
            boolean isExist = memberService.isExistId(id);

            response.setContentType("text/plain; charset=UTF-8");
            if (isExist) {
                response.getWriter().write("exist");
            } else {
                response.getWriter().write("available");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // AJAX 요청은 응답만 보내므로 null 반환
        return null;
    }
}
