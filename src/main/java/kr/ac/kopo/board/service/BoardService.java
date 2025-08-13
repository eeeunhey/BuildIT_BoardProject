package kr.ac.kopo.board.service;

import java.util.List;
import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.dao.BoardDAOImpl;
import kr.ac.kopo.board.vo.BoardVO;

public class BoardService {

	private final BoardDAO boardDAO = new BoardDAOImpl();

	/** 특정 게시글 이미지(BLOB) 바이트 */
	public byte[] getImageBytes(int postId) {
		return boardDAO.selectImageByPostId(postId);
	}

	/** 가장 최근 업로드 이미지 바이트 */
	public byte[] getLatestImageBytes() {
		return boardDAO.selectLatestImage();
	}

	/** 최신 게시글 목록 n개 (필요 시) */
	public List<BoardVO> findLatest(int limit) {
		return boardDAO.selectLatest(limit);
	}
}
