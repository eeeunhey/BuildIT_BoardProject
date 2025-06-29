package kr.ac.kopo.board.batisdao;

import org.apache.ibatis.session.SqlSession;

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
}
