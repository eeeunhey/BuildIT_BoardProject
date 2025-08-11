package kr.ac.kopo.board.service;

import java.util.List;
import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.dao.BoardDAOImpl;
import kr.ac.kopo.board.vo.BoardVO;

public class BoardService {
	private final BoardDAO boardDAO = new BoardDAOImpl();

	/** 최신 게시글 n개 */
	public List<BoardVO> findLatest(int limit) {
		return boardDAO.selectLatest(limit);
	}

	// 필요하면 나머지 메서드도 전달용으로 추가
	public List<BoardVO> findAll() {
		return boardDAO.selectBoardAll();
	}

	public BoardVO findById(int postId) {
		return boardDAO.selectBoardByNo(postId);
	}

}
