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

<<<<<<< HEAD
	    StringBuilder sql = new StringBuilder();
	    sql.append("SELECT post_id, title, writer_id, content, location, pay, work_time, ");
	    sql.append("       TO_CHAR(reg_date, 'YYYY-MM-DD') reg_date, ");
	    sql.append("       TO_CHAR(deadline, 'YYYY-MM-DD') deadline ");
	    sql.append("  FROM tbl_project_post ");
	    sql.append(" ORDER BY post_id DESC");
=======
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT post_id, title, writer_id, content, location, pay, work_time, ");
		sql.append("       TO_CHAR(reg_date, 'YYYY-MM-DD') reg_date, ");
		sql.append("       TO_CHAR(deadline, 'YYYY-MM-DD') deadline, ");
		sql.append("       image ");
		sql.append("  FROM tbl_project_post ");
		sql.append(" ORDER BY post_id DESC");
>>>>>>> d560f20a6a385c7c6dd6056c4e4d0dc377271aea

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
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
				byte[] image = rs.getBytes("image"); // 🔹 이미지 byte 배열로 읽기

				// BoardVO 생성 및 값 설정
				BoardVO job = new BoardVO(postId, title, writerId, content, location, pay, workTime, regDate, deadline,
						image);
				job.setImage(image); // 🔹 이미지 저장

				boardList.add(job);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return boardList;
	}

	@Override
	public void insertBoard(BoardVO newBoard) {
<<<<<<< HEAD
	    StringBuilder sql = new StringBuilder();
	    sql.append("INSERT INTO tbl_project_post( ");
	    sql.append("post_id, title, writer_id, content, location, pay, work_time, reg_date, deadline) ");
	    sql.append("VALUES( seq_project_post.NEXTVAL, ?, ?, ?, ?, ?, ?, SYSDATE, TO_DATE(?, 'YYYY-MM-DD'))");
=======
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO tbl_project_post (");
		sql.append("post_id, title, writer_id, content, location, pay, ");
		sql.append("work_time, reg_date, deadline, image) ");
		sql.append("VALUES (seq_project_post.NEXTVAL, ?, ?, ?, ?, ?, ?, SYSDATE, TO_DATE(?, 'YYYY-MM-DD'), ?)");
>>>>>>> d560f20a6a385c7c6dd6056c4e4d0dc377271aea

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			System.out.println("📌 Title: " + newBoard.getTitle());
			System.out.println("📌 Writer: " + newBoard.getWriterId());
			System.out.println("📌 Pay: " + newBoard.getPay());
			System.out.println("📌 Title: " + newBoard.getLocation());
			System.out.println("📌 Writer: " + newBoard.getRegDate());
			System.out.println("📌 Pay: " + newBoard.getWorkTime());

			pstmt.setString(1, newBoard.getTitle());
			pstmt.setString(2, newBoard.getWriterId());
			pstmt.setString(3, newBoard.getContent());
			pstmt.setString(4, newBoard.getLocation());
			pstmt.setInt(5, newBoard.getPay());
			pstmt.setString(6, newBoard.getWorkTime());
			pstmt.setString(7, newBoard.getDeadline());

			if (newBoard.getImage() != null) {
				pstmt.setBytes(8, newBoard.getImage());
			} else {
				pstmt.setNull(8, java.sql.Types.BLOB);
			}

			int result = pstmt.executeUpdate();
			System.out.println("✅ 삽입된 행 수: " + result);
			conn.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public BoardVO selectBoardByNo(int postId) {
<<<<<<< HEAD
	    StringBuilder sql = new StringBuilder();
	    sql.append("SELECT post_id, title, writer_id, content, ");
	    sql.append("       location, pay, work_time, ");
	    sql.append("       TO_CHAR(reg_date, 'yyyy-mm-dd') AS reg_date, ");
	    sql.append("       TO_CHAR(deadline, 'yyyy-mm-dd') AS deadline ");
	    sql.append("  FROM tbl_project_post ");
	    sql.append(" WHERE post_id = ? ");
=======
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT post_id, title, writer_id, content, ");
		sql.append("       location, pay, work_time, ");
		sql.append("       TO_CHAR(reg_date, 'yyyy-mm-dd') AS reg_date, ");
		sql.append("       TO_CHAR(deadline, 'yyyy-mm-dd') AS deadline, ");
		sql.append("       image ");
		sql.append("  FROM tbl_project_post ");
		sql.append(" WHERE post_id = ? ");
>>>>>>> d560f20a6a385c7c6dd6056c4e4d0dc377271aea

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
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
				byte[] image = rs.getBytes("image"); // 🔹 이미지 가져오기

				BoardVO job = new BoardVO(post, title, writerId, content, location, pay, workTime, regDate, deadline,
						image);
				job.setImage(image); // 🔹 세팅

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
<<<<<<< HEAD
	    String sql = "DELETE FROM tbl_project_post WHERE post_id = ?";
	    try (Connection conn = new ConnectionFactory().getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setInt(1, boardNo);
	        pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
=======
		String sql = "DELETE FROM tbl_project_post WHERE post_id = ?";
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, boardNo);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
>>>>>>> d560f20a6a385c7c6dd6056c4e4d0dc377271aea
	}
}
