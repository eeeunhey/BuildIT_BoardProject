package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.dao.BoardDAOImpl;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.framework.Controller;

public class BoardWriteProcessController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.setCharacterEncoding("utf-8");

        BoardVO board = new BoardVO();
        board.setTitle(request.getParameter("title"));
        board.setWriterId(request.getParameter("writerId"));
        board.setLocation(request.getParameter("location"));
        board.setPay(Integer.parseInt(request.getParameter("pay")));
        board.setWorkTime(request.getParameter("workTime"));
        board.setDeadline(request.getParameter("deadline"));
        board.setContent(request.getParameter("content"));

        BoardDAO dao = new BoardDAOImpl();
        dao.insertBoard(board);

        return "redirect:/board/list.do";
    }
}
