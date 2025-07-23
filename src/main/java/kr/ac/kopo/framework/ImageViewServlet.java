package kr.ac.kopo.framework;

import java.io.IOException;
import java.io.OutputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.dao.BoardDAOImpl;
import kr.ac.kopo.board.vo.BoardVO;

@WebServlet("/imageView")
public class ImageViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardDAO dao = new BoardDAOImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int postId = Integer.parseInt(request.getParameter("postId"));
		BoardVO board = dao.selectBoardByNo(postId);
		byte[] imageData = board.getImage();

		if (imageData != null) {
			response.setContentType("image/jpeg"); // PNG면 image/png
			response.setContentLength(imageData.length);
			OutputStream os = response.getOutputStream();
			os.write(imageData);
			os.flush();
		}
	}
}
