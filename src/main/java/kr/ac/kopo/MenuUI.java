package kr.ac.kopo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import kr.ac.kopo.board.batisdao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;

public class MenuUI {

	BoardDAO boardDao;

	public MenuUI() {
		boardDao = new BoardDAO();
	}

	private void addBoard() {

		BoardVO board = new BoardVO(0, // post_id
				"왕기초 웹 개발 프로젝트 모집", // title
				"user", // writerId
				"React 기반 웹 서비스 개발자 모집 중입니다.", // content
				"서울 강남구", // location
				300000, // pay
				"09:00~18:00", // workTime
				"2025-07-05", // regDate
				"2025-07-31", // deadline
				null // image
		);

		boardDao.insert(board);
	}

	// 보드값 출력하기
	private void selectAllBoard() {
		// boardDAO에서 만든 메소드 가져오기
		List<BoardVO> list = boardDao.selectAll();
		for (BoardVO board : list) {
			System.out.println(board);
		}

	}

	private void selectByNo() {
		// 게시글 번호를 가져오자
		BoardVO board = boardDao.selectByNo(12);
		// boardVO를 호출하자
		System.out.println(board);
	}

	private void deleteById() {
		boardDao.deleteById(10);

	}

	private void selectTag() {

	}

	private void selectBoardWhere() {

		// 제목이 왕기초 웹 개발 프로젝트 모집 작성자 : user123 을 찾아보장
		// 방법1 제목이 왕기초 웹 개발 프로젝트 모집 글쓴이 user123
		// board.setTitle("왕기초 웹 개발 프로젝트 모집");

		// 방법 2 글쓴이 상관없이 제목만 검색할 경우
		// board-mapper에서 where 태그안에 if 조건을 사용하여 제어한다
		// writer 가 null 이 아닐 때

		// 방법 3 같은 글쓴이만 검색할 경우
		// board-mapper에서 where 태그안에 if 조건을 사용하여 제어한다
		// title가 null 이 아닐 때

		// 방법 4 아무것도 입력값이 없을 경우는 모든 리스트가 출력된다
		// 나중에 태그를 이런식으로 호출하면 되겠다 나중에 tagVO를 만들어서 TagVO 객체를 새로 할당하고 mapper에서 쿼리작성 DAO
		// 메소드 생성하고 실행
		BoardVO board = new BoardVO();

		// 방법 2 제목이 왕기초 웹 개발 프로젝트 모집 게시물 조회하기
		// board.setTitle("왕기초 웹 개발 프로젝트 모집");
		// board.setWriterId("user123");

		List<BoardVO> list = boardDao.selectByWhere(board);
		for (BoardVO vo : list) {
			System.out.println(vo);
		}
	}

	private void selectBoardWhereMap() {
		// HashMap key, value 값으로 입력 받기
		Map<String, String> keywords = new HashMap<>();

		// 1. 제목 글쓴이 입력받는 값이 동일한 게시글 조회
		// keywords.put("title", "왕기초 웹 개발 프로젝트 모집");
		// keywords.put("writerid", "user123");

		// 2. 제목 입력받는 값이 동일한 게시글 조회
		// keywords.put("title", "왕기초 웹 개발 프로젝트 모집");

		// 3. 글쓴이 입력받는 값이 동일한 게시글 조회
		// keywords.put("writerid", "user123");

		// 4. 전체 게시글 조회
		// -- put 둘다 주석

		List<BoardVO> list = boardDao.selectByWhereMap(keywords);
		for (BoardVO vo : list) {
			System.out.println(vo);
		}
	}

	private void selectByNoMap() {
		// 게시글을 맵형태로 가져와 보조
		Map<String, Object> map  = boardDao.selectByNoMap(9);
		Set<String> keys = map.keySet();
		for(String key : keys) {
			System.out.println(key + ":"+map.get(key));
		}
	}

	public void execute() {
		// 메소드 생성
		// 인서트 보드 하기
		// addBoard();

		// selectAllBoard();

		// 보드를 검색하자
		// selectByNo();

		// 보드를 삭제하자
		// deleteById();
		// 서치올보드
		// searchBoard();
		// selectBoardWhere();
		// selectBoardWhereMap();
		   selectByNoMap();

	}

}
