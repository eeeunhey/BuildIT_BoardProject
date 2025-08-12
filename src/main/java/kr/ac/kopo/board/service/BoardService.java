package kr.ac.kopo.board.service;

import java.util.List;
import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.dao.BoardDAOImpl;
import kr.ac.kopo.board.vo.BoardVO;

public class BoardService {
	private final BoardDAO boardDAO = new BoardDAOImpl();

	/**
	 * 이미지 바이트 반환
	 */
	public byte[] getImageBytes(int postId) {
		return boardDAO.selectImageByPostId(postId);
	}

	public byte[] getLatestImageBytes() {
		return boardDAO.selectLatestImage();
	}
}
