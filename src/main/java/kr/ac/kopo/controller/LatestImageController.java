package kr.ac.kopo.controller;

import java.io.IOException;
import java.io.OutputStream;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.service.BoardService;

@WebServlet("/board/latest-image.do")
public class LatestImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final BoardService boardService = new BoardService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		byte[] imageBytes = boardService.getLatestImageBytes();

		if (imageBytes == null || imageBytes.length == 0) {
			// 이미지가 없으면 기본 이미지로
			resp.sendRedirect(req.getContextPath() + "/resources/images/workimage.png");
			return;
		}

		String mime = sniffMime(imageBytes);
		resp.setContentType(mime);

		// 최신 이미지는 자주 바뀔 수 있으니 캐시 비활성화
		resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		resp.setHeader("Pragma", "no-cache");
		resp.setDateHeader("Expires", 0);

		resp.setContentLength(imageBytes.length);
		try (OutputStream out = resp.getOutputStream()) {
			out.write(imageBytes);
		}
	}

	private String sniffMime(byte[] b) {
		if (b == null || b.length < 8)
			return "application/octet-stream";
		if ((b[0] & 0xFF) == 0xFF && (b[1] & 0xFF) == 0xD8)
			return "image/jpeg"; // JPEG
		if ((b[0] & 0xFF) == 0x89 && b[1] == 0x50 && b[2] == 0x4E && b[3] == 0x47)
			return "image/png"; // PNG
		if (b[0] == 'G' && b[1] == 'I' && b[2] == 'F')
			return "image/gif"; // GIF
		return "application/octet-stream";
	}
}
