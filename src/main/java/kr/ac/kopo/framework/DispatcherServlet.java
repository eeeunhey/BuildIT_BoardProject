package kr.ac.kopo.framework;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.BoardListController;

public class DispatcherServlet extends HttpServlet {

	private HandlerMapping mappings;
	// init 서비스가 알 수 있게 멤버변수 생성
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		mappings = new HandlerMapping();

	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    try {
	        String uri = request.getRequestURI();          // 예: /Board-WEB/signup/signupProcess.do
	        String ctx = request.getContextPath();         // 예: /Board-WEB
	        String command = uri.substring(ctx.length());  // 예: /signup/signupProcess.do

	        System.out.println("[DEBUG] uri=" + uri + ", ctx=" + ctx + ", command=" + command);

	        Controller control = mappings.getController(command);

	        if (control == null) {
	            System.out.println("[ERROR] No controller for: " + command);
	            // HandlerMapping에 아래 메서드 하나 추가해 두세요:
	            // public String debugMappings(){ return mappings.keySet().toString(); }
	            System.out.println("[ERROR] Available mappings: " + mappings.debugMappings());
	            response.sendError(HttpServletResponse.SC_NOT_FOUND, "No mapping for " + command);
	            return;
	        }

	        String callPage = control.handleRequest(request, response);

	        if (callPage != null && callPage.startsWith("redirect:")) {
	            callPage = callPage.substring("redirect:".length());
	            response.sendRedirect(request.getContextPath() + callPage);
	        } else {
	            RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
	            dispatcher.forward(request, response);
	        }
	    } catch (Exception e) {
	        throw new ServletException(e);
	    }
	}


}













