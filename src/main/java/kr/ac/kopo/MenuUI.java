package kr.ac.kopo;

import java.io.File;
import java.io.FileInputStream;
import java.nio.file.Files;
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
					0,                                      // post_id
				    "왕기초 웹 개발 프로젝트 모집",               // title
				    "user123",                              // writerId
				    "React 기반 웹 서비스 개발자 모집 중입니다.", // content
				    "서울 강남구",                          // location
				    300000,                                 // pay
				    "09:00~18:00",                          // workTime
				    "2025-07-05",                           // regDate
				    "2025-07-31",                           // deadline
				    null                            // image
			    );
		
		boardDao.insert(board);
	}
	// 보드값 출력하기
	private void selectAllBoard() {
		//boardDAO에서 만든 메소드 가져오기
		List<BoardVO> list = boardDao.selectAll();
		for(BoardVO board : list ) {
			System.out.println(board);
		}
		
	}
	
	private void selectByNo() {
		// 게시글 번호를 가져오자
		BoardVO board = boardDao.selectByNo(12);
		//boardVO를 호출하자
		System.out.println(board);
	}

	private void deleteById() {
		boardDao.deleteById(10);

	}
	
	private void selectTag() {
		
	}
	
	private void selectBoardWhere() {
		//제목이 왕기초 웹 개발 프로젝트 모집  작성자 : user123 을 찾아보장
		BoardVO board = new BoardVO();
		board.setTitle("왕기초 웹 개발 프로젝트 모집");
		board.setWriterId("user123");
		
		List<BoardVO> list = boardDao.selectByWhere(board);
		for(BoardVO vo : list) {
			System.out.println(vo);
		}
		
		
	}
	
	
	
	
	public void execute() {
		// 메소드 생성
		// 인서트 보드 하기
		//addBoard();
		
		//selectAllBoard();

		//보드를 검색하자
		//selectByNo();
		 
		 //보드를 삭제하자
		//deleteById();
		//서치올보드 
		//searchBoard();
		selectBoardWhere();
		
	}

}
