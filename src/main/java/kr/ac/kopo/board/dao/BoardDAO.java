package kr.ac.kopo.board.dao;

import java.util.List;
import kr.ac.kopo.board.vo.BoardVO;

/**
 * 게시글 CRUD + 조회 DAO
 */
public interface BoardDAO {

	/** 전체 게시글 조회 (최신순) */
	List<BoardVO> selectBoardAll();

	/** 새 글 등록 */
	void insertBoard(BoardVO newBoard);

	/** 게시글 단건 조회 */
	BoardVO selectBoardByNo(int boardNo); // 또는 selectByPostId(int postId)

	/** 게시글 수정 */
	void updateBoard(BoardVO board);

	/** 게시글 삭제 */
	void deleteBoardByNo(int boardNo);

	byte[] selectImageByPostId(int postId);

	/** 이미지가 있는 가장 최근 게시글의 이미지(BLOB) 1건 */
	byte[] selectLatestImage();

	Integer selectLatestPostIdWithImage();

}
