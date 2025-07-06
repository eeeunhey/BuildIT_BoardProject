package kr.ac.kopo.controller;

import java.io.InputStream;
import java.time.LocalDate;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import kr.ac.kopo.board.dao.BoardDAOImpl;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.framework.Controller;
import jakarta.servlet.annotation.MultipartConfig;

public class BoardWriteController implements Controller {

	private BoardDAOImpl boardDao;

	public BoardWriteController() {
		boardDao = new BoardDAOImpl();
	}

	@Override

	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String title = getFormFieldValue(request, "title");
		String writerId = getFormFieldValue(request, "writer_id");
		String content = getFormFieldValue(request, "content");
		String payStr = getFormFieldValue(request, "pay");
		String location = getFormFieldValue(request, "location");
		String workTime = getFormFieldValue(request, "work_time");
		String deadline = getFormFieldValue(request, "deadline");
		String regDate = LocalDate.now().toString();

		int pay = 0;
		try {
			pay = Integer.parseInt(payStr.trim());
		} catch (Exception e) {
		}

		Part filePart = request.getPart("image");
		byte[] imageBytes = null;
		if (filePart != null && filePart.getSize() > 0) {
			try (InputStream inputStream = filePart.getInputStream()) {
				imageBytes = inputStream.readAllBytes();
			}
		}

		BoardVO board = new BoardVO(title, writerId, content, location, pay, workTime, regDate, deadline, imageBytes);
		boardDao.insertBoard(board);

		return "redirect:/board/list.do";
	}

	private String getFormFieldValue(HttpServletRequest request, String name) throws Exception {
		Part part = request.getPart(name);
		if (part != null) {
			try (InputStream is = part.getInputStream()) {
				byte[] bytes = is.readAllBytes();
				return new String(bytes, request.getCharacterEncoding());
			}
		}
		return null;
	}

}
