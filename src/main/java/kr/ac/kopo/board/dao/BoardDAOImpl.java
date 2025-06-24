package kr.ac.kopo.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.util.ConnectionFactory;

/**
 * @author 홍길동
 */

public class BoardDAOImpl implements BoardDAO {

	@Override
	public List<BoardVO> selectBoardAll() {
	    List<BoardVO> boardList = new ArrayList<>();

	    StringBuilder sql = new StringBuilder();
	    sql.append("SELECT post_id, title, writer_id, location, pay, work_time, ");
	    sql.append("       TO_CHAR(reg_date, 'YYYY-MM-DD') reg_date, ");
	    sql.append("       TO_CHAR(deadline, 'YYYY-MM-DD') deadline ");
	    sql.append("  FROM tbl_job_post ");
	    sql.append(" ORDER BY post_id DESC");

	    try (
	        Connection conn = new ConnectionFactory().getConnection();
	        PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	    ) {
	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            int postId = rs.getInt("post_id");
	            String title = rs.getString("title");
	            String writerId = rs.getString("writer_id");
	            String location = rs.getString("location");
	            int pay = rs.getInt("pay");
	            String workTime = rs.getString("work_time");
	            String regDate = rs.getString("reg_date");
	            String deadline = rs.getString("deadline");

	            BoardVO job = new BoardVO(postId, title, writerId, location, pay, workTime, regDate, deadline);
	            boardList.add(job);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return boardList;
	}


	@Override
	public void insertBoard(BoardVO newBoard) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardVO selectBoardByNo(int boardNo) {

		StringBuilder sql = new StringBuilder();
		sql.append("select no, title, writer, content, view_cnt, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append("  from tbl_job_post ");
		sql.append(" where no = ? ");
		
		try(
			// AutoCloseable 상속받은 객체 생성 가능
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			pstmt.setInt(1, boardNo);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");
				
				BoardVO board = new BoardVO(no, title, writer, content, viewCnt, regDate, regDate, regDate);
				return board;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	@Override
	public void updateBoard(BoardVO board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoardByNo(int boardNo) {
	    String sql = "DELETE FROM board WHERE no = ?";
	    try (Connection conn = new ConnectionFactory().getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setInt(1, boardNo);
	        pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

}
