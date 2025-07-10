package kr.ac.kopo.board.batisdao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.MyBatisConfig;
import kr.ac.kopo.board.vo.BoardVO;

public class BoardDAO {

	private SqlSession session;

	public BoardDAO() {
		this.session = new MyBatisConfig().getInstance();

	}
	// 데이터 베이스와 통신하기 위해 session객체를 사용 session.쿼리 메소드 호출
	// board-mapper에 작성한 쿼리 아이디를 DAO.매핑한 쿼리 아이디 입력

	public void insert(BoardVO board) {
		session.insert("board.batisdao.BoardDAO.insert", board);
		session.commit();
		System.out.println("삽입완료");
		int result = session.insert("board.batisdao.BoardDAO.insert", board);
		System.out.println("삽입된 행 수: " + result);
	}

	// 보드 전체 내용을 출력한다
	public List<BoardVO> selectAll() {
		List<BoardVO> list = session.selectList("board.batisdao.BoardDAO.selectAll");
		// 여러개의 값을 보여주기 위해 리스트를 사용한다
		// 무조건 리턴값은 리스트가 리턴된다
		// 리스트의 오브젝트를 반환 타입을 boardVO 로 지정 했으니 넣어주장
		// session.selectList("board.dao.BoardDAO.selectAll"); 저장할 변수 만들장
		// 리스트에 저장한 값을 리턴해주자 반환값이 List<BoardVO> 니깐 void -> List<BoardVO> 수정해주자
		return list;
	}

	public BoardVO selectByNo(int postId) {
		// BoardVO 리턴 타입을 전해준다
		// 세션에서 select 했을 한개만 넘겨받으면 되니깐 selectOne 라는 메소드를 사용한다
		// 번호의 정보를 가져오자
		// return session.selectOne("board.batisdao.BoardDAO.selectByNo", postId);
		return session.selectOne("board.batisdao.BoardDAO.selectByNo2", postId);

	}

	public void deleteById(int postId) {
		session.delete("board.batisdao.BoardDAO.deleteById", postId);
		session.commit();
		System.out.println("삭제 완료");
	}

	public List<BoardVO> selectByWhere(BoardVO board) {
		// 레코드의 갯수가 한개이상이상에서 n개 이기 때문에 리스트로 받아온다
		return session.selectList("board.batisdao.BoardDAO.selectWhere", board);

	}

	public List<BoardVO> selectByWhereMap (Map<String, String> keywords) {
		return session.selectList("board.batisdao.BoardDAO.selectByWhereMap", keywords);
	}
	
	public Map<String, Object> selectByNoMap(int postId) {
		
		return session.selectOne("board.batisdao.BoardDAO.selectByNo3", postId);
	}
	
	public List<BoardVO> selectByNos(int[] nos) {
		return session.selectList("board.batisdao.BoardDAO.selectByNos", nos);
	}
}

