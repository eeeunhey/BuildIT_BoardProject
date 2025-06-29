package kr.ac.kopo.board.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.util.ConnectionFactory;

public class BoardDAOImpl implements BoardDAO {


	@Override
	public List<BoardVO> selectBoardAll() {
	    List<BoardVO> boardList = new ArrayList<>();

	    StringBuilder sql = new StringBuilder();
	    sql.append("SELECT post_id, title, writer_id, content, location, pay, work_time, ");
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
	            String content = rs.getString("content");
	            String location = rs.getString("location");
	            int pay = rs.getInt("pay");
	            String workTime = rs.getString("work_time");
	            String regDate = rs.getString("reg_date");
	            String deadline = rs.getString("deadline");

	            BoardVO job = new BoardVO(postId, title, writerId, content, location, pay, workTime, regDate, deadline);
	            boardList.add(job);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return boardList;
	}

	@Override
	public void insertBoard(BoardVO newBoard) {
	    StringBuilder sql = new StringBuilder();
	    sql.append("INSERT INTO tbl_job_post( ");
	    sql.append("post_id, title, writer_id, content, location, pay, work_time, reg_date, deadline) ");
	    sql.append("VALUES(seq_job_post.NEXTVAL, ?, ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), TO_DATE(?, 'YYYY-MM-DD'))");

	    try (
	        Connection conn = new ConnectionFactory().getConnection();
	        PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	    ) {
	        pstmt.setString(1, newBoard.getTitle());
	        pstmt.setString(2, newBoard.getWriterId());
	        pstmt.setString(3, newBoard.getContent());
	        pstmt.setString(4, newBoard.getLocation());
	        pstmt.setInt(5, newBoard.getPay());
	        pstmt.setString(6, newBoard.getWorkTime());
	        pstmt.setString(7, newBoard.getRegDate());
	        pstmt.setString(8, newBoard.getDeadline());

	        pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	@Override
	public BoardVO selectBoardByNo(int postId) {
	    StringBuilder sql = new StringBuilder();
	    sql.append("SELECT post_id, title, writer_id, content, ");
	    sql.append("       location, pay, work_time, ");
	    sql.append("       TO_CHAR(reg_date, 'yyyy-mm-dd') AS reg_date, ");
	    sql.append("       TO_CHAR(deadline, 'yyyy-mm-dd') AS deadline ");
	    sql.append("  FROM tbl_job_post ");
	    sql.append(" WHERE post_id = ? ");

	    try (
	        Connection conn = new ConnectionFactory().getConnection();
	        PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	    ) {
	        pstmt.setInt(1, postId);

	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            int post = rs.getInt("post_id");
	            String title = rs.getString("title");
	            String writerId = rs.getString("writer_id");
	            String content = rs.getString("content");
	            String location = rs.getString("location");
	            int pay = rs.getInt("pay");
	            String workTime = rs.getString("work_time");
	            String regDate = rs.getString("reg_date");
	            String deadline = rs.getString("deadline");

	            BoardVO job = new BoardVO(post, title, writerId, content, location, pay, workTime, regDate, deadline);
	            return job;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return null;
	}

	@Override
	public void updateBoard(BoardVO board) {
		// TODO: 구현 예정
	}

	@Override
	public void deleteBoardByNo(int boardNo) {
	    String sql = "DELETE FROM tbl_job_post WHERE post_id = ?";
	    try (Connection conn = new ConnectionFactory().getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setInt(1, boardNo);
	        pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}
