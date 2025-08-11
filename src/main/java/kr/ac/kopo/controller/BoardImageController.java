package kr.ac.kopo.controller;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.dao.BoardDAOImpl;
// import kr.ac.kopo.board.vo.BoardVO;  // selectBoardByNo로 할 경우 사용

@WebServlet("/board/image.do")
public class BoardImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final BoardDAO boardDAO = new BoardDAOImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String idStr = req.getParameter("postId");
		if (idStr == null) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		final int postId;
		try {
			postId = Integer.parseInt(idStr);
		} catch (NumberFormatException e) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		// ① 전용 메서드로 BLOB 가져오기
		byte[] image = boardDAO.selectImageByPostId(postId);

		// // 또는 ② 게시글 단건조회로 가져오기
		// BoardVO vo = boardDAO.selectBoardByNo(postId);
		// byte[] image = (vo != null) ? vo.getImage() : null;

		if (image == null || image.length == 0) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}

		// mime_type 컬럼이 없다면 기본값(대부분 jpeg) 사용
		resp.setContentType("image/jpeg");
		resp.setHeader("Cache-Control", "public, max-age=86400");
		resp.setContentLength(image.length); // 선택: 길이 지정
		resp.getOutputStream().write(image);
	}
}
