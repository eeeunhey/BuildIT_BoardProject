package kr.ac.kopo;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.ac.kopo.board.vo.BoardVO;


public class MyBatisMain {

	public static void main(String[] args) {

		/*
		 * try { String resource = "mybatis-config.xml"; InputStream inputStream =
		 * Resources.getResourceAsStream(resource); SqlSessionFactory sqlSessionFactory
		 * = new SqlSessionFactoryBuilder().build(inputStream); SqlSession session =
		 * sqlSessionFactory.openSession();
		 * 
		 * BoardVO board = new BoardVO( "웹앱 기능 테스트 및 피드백", "ituser05",
		 * "주어진 기능 테스트하고 UI 피드백 작성", "서울 마포구", 19000, "11:00~15:00", "2025-06-29",
		 * "2025-07-10" );
		 * 
		 * //VO로 넘기장
		 * 
		 * session.insert("board.batisdao.BoardDAO.insert",board); // 인자값을 하나밖에 못넘긴다
		 * 인자값을 넘기기 위해서 묶음
		 * 
		 * session.commit();
		 * 
		 * System.out.println("삽입완료");
		 * 
		 * 
		 * } catch (Exception e) { e.print	StackTrace(); }
		 */

		
		MenuUI ui = new MenuUI();
		ui.execute();
	}
}