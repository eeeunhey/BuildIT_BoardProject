package kr.ac.kopo;

import java.util.List;

import kr.ac.kopo.board.batisdao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;

public class MenuUI {
	
	BoardDAO boardDao; 

	public MenuUI() {
		boardDao = new BoardDAO();	
	}
	


	private void addBoard() {
		
		BoardVO board = new BoardVO(    
				0,
			    "백엔드 API 문서화 작업",
			    "backend02",
			    "기존 API 스펙 문서 작성 및 정리 작업",
			    "서울 강남구",
			    21000,
			    "13:00~17:00",
			    "2025-06-28",
			    "2025-07-08");
		
		boardDao.insert(board);
	}
	// 보드값 출력하기
	private void searchAllBoard() {
		//boardDAO에서 만든 메소드 가져오기
		List<BoardVO> list = boardDao.searchAll();
		for(BoardVO board : list ) {
			System.out.println(board);
		}
		
	}

	public void execute() {
		// 메소드 생성
		// 인서트 보드 하기
		//addBoard();
		
		searchAllBoard();

	}

}
