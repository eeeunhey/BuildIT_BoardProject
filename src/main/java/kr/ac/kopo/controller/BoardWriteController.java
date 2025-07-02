package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.board.batisdao.BoardDAO;
import kr.ac.kopo.board.dao.BoardDAOImpl;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.framework.Controller;

public class BoardWriteController implements Controller {
	

	private BoardDAOImpl boardDao;
	
	public BoardWriteController() {
		boardDao = new BoardDAOImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 1. 폼에서 보낸 모든 파라미터 받기
	    String title = request.getParameter("title");
	    String writerId = request.getParameter("writer_id"); // name="writer_id"로 전송됨
	    String content = request.getParameter("content");
	    String location = request.getParameter("location");
	    int pay = Integer.parseInt(request.getParameter("pay"));
	    String workTime = request.getParameter("work_time");
	    String deadline = request.getParameter("deadline"); // "YYYY-MM-DD" 문자열

	    // 2. BoardVO에 값 설정 (생성자 또는 setter)
	    BoardVO board = new BoardVO();
	    board.setTitle(title);
	    board.setWriterId(writerId);
	    board.setContent(content);
	    board.setLocation(location);
	    board.setPay(pay);
	    board.setWorkTime(workTime);
	    board.setDeadline(deadline);

	    // 3. DB 저장
	    boardDao.insertBoard(board);

	    // 4. 공고 목록 페이지로 리다이렉트
	    return "redirect:/board/list.do";
	}

}
