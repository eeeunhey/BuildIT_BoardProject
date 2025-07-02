package kr.ac.kopo.board.batisdao;

import org.apache.ibatis.session.SqlSession;

import java.util.List;

import kr.ac.kopo.MyBatisConfig;
import kr.ac.kopo.board.vo.BoardVO;

public class BoardDAO {

	
	private SqlSession session;

	public BoardDAO() {
		this.session = new MyBatisConfig().getInstance();
		
	}
	
	public void insert(BoardVO board) {
		session.insert("board.batisdao.BoardDAO.insert",board);
		session.commit();
		System.out.println("삽입완료");
	}
	
	// 보드 전체 내용을 출력한다
	public List<BoardVO> searchAll() {
		List<BoardVO> list = session.selectList("board.batisdao.BoardDAO.selectAll");
		// 여러개의 값을 보여주기 위해 리스트를 사용한다
		//무조건 리턴값은 리스트가 리턴된다
		// 리스트의 오브젝트를 반환 타입을 boardVO 로 지정 했으니 넣어주장
		//session.selectList("board.dao.BoardDAO.selectAll"); 저장할 변수 만들장
		//리스트에 저장한 값을 리턴해주자 반환값이 List<BoardVO> 니깐 void -> List<BoardVO> 수정해주자
		
		
		return list;
		
	}
}
