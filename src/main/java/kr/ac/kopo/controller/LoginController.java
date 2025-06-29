package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.framework.Controller;

public class LoginController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
<<<<<<< HEAD
		return "login/login.jsp";
=======
		return "/login/login.jsp";
>>>>>>> 1696acf (ui update250629)
	}

}
