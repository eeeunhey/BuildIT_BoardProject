package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;

import java.util.Collections;
import java.util.List;

public class IndexController implements Controller {

	private final BoardService boardService;

	public IndexController() {
		this.boardService = new BoardService(); // DI를 쓰면 주입받아도 됩니다.
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<BoardVO> latest;
		try {
			latest = boardService.findLatest(4); // ✅ 최신 4개만
		} catch (Exception e) {
			latest = Collections.emptyList();
			request.setAttribute("error", "목록을 불러오지 못했습니다.");
		}

		request.setAttribute("boardList", latest); // ✅ JSP에서 사용
		return "/index.jsp";
	}
}
