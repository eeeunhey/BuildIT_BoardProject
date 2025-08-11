package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.framework.Controller;

public class IndexController implements Controller {
	private final BoardService boardService = new BoardService();

	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setAttribute("hotBoardList", boardService.findLatest(4));
		return "/index.jsp"; // forward
	}
}
