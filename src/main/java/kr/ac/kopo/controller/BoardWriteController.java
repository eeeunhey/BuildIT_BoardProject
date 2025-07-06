package kr.ac.kopo.controller;

import java.io.InputStream;
import java.time.LocalDate;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
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

        // 1. 파라미터 수집 및 유효성 검사
        String title = request.getParameter("title");
        String writerId = request.getParameter("writer_id");
        String content = request.getParameter("content");
        String payStr = request.getParameter("pay");
        String location = request.getParameter("location");
        String workTime = request.getParameter("work_time");
        String deadline = request.getParameter("deadline");
        String regDate = LocalDate.now().toString();


        int pay = 0;
        try {
            pay = Integer.parseInt(payStr.trim());
        } catch (Exception e) {
            System.out.println("pay 파싱 실패: " + e.getMessage());
            pay = 0; // 예외 회피용 기본값 (필요 시 삭제)
        }

        // 2. 이미지 파일 처리
        Part filePart = request.getPart("image");
        byte[] imageBytes = null;
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                imageBytes = inputStream.readAllBytes();
            }
        }

        // 3. VO 객체 생성
        BoardVO board = new BoardVO(
            title,
            writerId,
            content,
            location,
            pay,
            workTime,
            regDate,
            deadline,
            imageBytes
        );

        // 4. DB 저장
        boardDao.insertBoard(board);

        // 5. 목록 페이지로 이동
        return "redirect:/board/list.do";
    }

}
