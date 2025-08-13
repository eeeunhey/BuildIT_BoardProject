package kr.ac.kopo.board.dao;

import java.security.Timestamp;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.util.ConnectionFactory;

public class BoardDAOImpl implements BoardDAO {

	@Override
	public List<BoardVO> selectBoardAll() {
		List<BoardVO> boardList = new ArrayList<>();

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT postid, title, writerid, content, location, pay, worktime, ");
		sql.append("       TO_CHAR(regdate, 'YYYY-MM-DD') regdate, ");
		sql.append("       TO_CHAR(deadline, 'YYYY-MM-DD') deadline, image ");
		sql.append("  FROM tbl_project_post ");
		sql.append(" ORDER BY postid DESC");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int postId = rs.getInt("postid");
				String title = rs.getString("title");
				String writerId = rs.getString("writerid");
				String content = rs.getString("content");
				String location = rs.getString("location");
				int pay = rs.getInt("pay");
				String workTime = rs.getString("worktime");
				String regDate = rs.getString("regdate");
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

		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO tbl_project_post (");
		sql.append("postid, title, writerid, content, location, pay, ");
		sql.append("worktime, regdate, deadline, image) ");
		sql.append("VALUES (seq_project_post.NEXTVAL, ?, ?, ?, ?, ?, ?, SYSDATE, TO_DATE(?, 'YYYY-MM-DD'), ?)");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, newBoard.getTitle()); // ① title
			pstmt.setString(2, newBoard.getWriterId()); // ② writer_id
			pstmt.setString(3, newBoard.getContent()); // ③ content
			pstmt.setString(4, newBoard.getLocation()); // ④ location
			pstmt.setInt(5, newBoard.getPay()); // ⑤ pay
			pstmt.setString(6, newBoard.getWorkTime()); // ⑥ work_time
			pstmt.setString(7, newBoard.getDeadline()); // ⑦ deadline (문자열 → TO_DATE 변환됨)
			pstmt.setBytes(8, newBoard.getImage()); // ⑧ image (byte[] 형태의 이미지 파일)

			System.out.println("📌 Title: " + newBoard.getTitle());
			System.out.println("📌 Writer: " + newBoard.getWriterId());
			System.out.println("📌 Pay: " + newBoard.getPay());
			System.out.println("📌 Title: " + newBoard.getLocation());
			System.out.println("📌 Writer: " + newBoard.getRegDate());
			System.out.println("📌 Pay: " + newBoard.getWorkTime());

			int result = pstmt.executeUpdate();
			System.out.println("✅ 삽입된 행 수: " + result);
			conn.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public BoardVO selectBoardByNo(int postId) {

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT postid, title, writerid, content, ");
		sql.append("       location, pay, worktime, ");
		sql.append("       TO_CHAR(regdate, 'yyyy-mm-dd') AS regdate, ");
		sql.append("       TO_CHAR(deadline, 'yyyy-mm-dd') AS deadline, ");
		sql.append("       image ");
		sql.append("  FROM tbl_project_post ");
		sql.append(" WHERE postid = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, postId);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				int post = rs.getInt("postid");
				String title = rs.getString("title");
				String writerId = rs.getString("writerid");
				String content = rs.getString("content");
				String location = rs.getString("location");
				int pay = rs.getInt("pay");
				String workTime = rs.getString("worktime");
				String regDate = rs.getString("regdate");
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

		String sql = "DELETE FROM tbl_project_post WHERE postid = ?";
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, boardNo);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public byte[] selectImageByPostId(int postId) {
		// 테이블/컬럼: TBL_PROJECT_POST.POSTID, IMAGE
		final String sql = "SELECT IMAGE FROM TBL_PROJECT_POST WHERE POSTID = ?";

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, postId);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					// 드라이버에 따라 getBytes로 충분
					byte[] bytes = rs.getBytes("IMAGE");
					if (bytes != null && bytes.length > 0)
						return bytes;

					// 예비: BLOB으로 재시도 (일부 환경)
					java.sql.Blob blob = rs.getBlob("IMAGE");
					if (blob != null) {
						return blob.getBytes(1, (int) blob.length());
					}
				}
			}
		} catch (Exception e) {
			// TODO: 로깅으로 교체 권장
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public byte[] selectLatestImage() {
		// Oracle 12c+ (권장)
		final String sql12c = "SELECT IMAGE " + "  FROM TBL_PROJECT_POST " + " WHERE IMAGE IS NOT NULL "
				+ " ORDER BY REGDATE DESC, POSTID DESC " + " FETCH FIRST 1 ROW ONLY";

		// Oracle 11g 호환 쿼리 (필요 시 이걸로 교체)
		final String sql11g = "SELECT IMAGE " + "  FROM ( " + "        SELECT IMAGE "
				+ "          FROM TBL_PROJECT_POST " + "         WHERE IMAGE IS NOT NULL "
				+ "         ORDER BY REGDATE DESC, POSTID DESC " + "       ) " + " WHERE ROWNUM = 1";

		final String sql = sql12c; // 11g면 sql11g 사용

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {

			if (rs.next()) {
				byte[] b = rs.getBytes("IMAGE");
				if (b != null && b.length > 0)
					return b;
				java.sql.Blob blob = rs.getBlob("IMAGE");
				if (blob != null)
					return blob.getBytes(1, (int) blob.length());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Integer selectLatestPostIdWithImage() {
		// Oracle 12c+ 권장
		final String sql12c = "SELECT POSTID " + "  FROM TBL_PROJECT_POST " + " WHERE IMAGE IS NOT NULL "
				+ " ORDER BY REGDATE DESC, POSTID DESC " + " FETCH FIRST 1 ROW ONLY";

		// Oracle 11g 호환 쿼리
		final String sql11g = "SELECT POSTID FROM ( " + "  SELECT POSTID " + "    FROM TBL_PROJECT_POST "
				+ "   WHERE IMAGE IS NOT NULL " + "   ORDER BY REGDATE DESC, POSTID DESC " + ") WHERE ROWNUM = 1";

		final String sql = sql12c; // 11g면 sql11g로 교체

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {

			if (rs.next()) {
				return rs.getInt("POSTID");
			}
		} catch (Exception e) {
			e.printStackTrace(); // TODO: 로거로 교체 권장
		}
		return null;
	}

	// BoardDAOImpl.java (예시 구현)
	@Override
	public List<BoardVO> selectLatest(int limit) {
		String sql = "SELECT postid, title, writerid, content, location, pay, worktime, "
				+ "       TO_CHAR(regdate,'YYYY-MM-DD') regdate, "
				+ "       TO_CHAR(deadline,'YYYY-MM-DD') deadline, image " + "  FROM TBL_PROJECT_POST "
				+ " ORDER BY regdate DESC, postid DESC " + " FETCH FIRST ? ROWS ONLY"; // 12c+ ; 11g면 ROWNUM 서브쿼리

		List<BoardVO> list = new ArrayList<>();
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, limit);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					BoardVO vo = new BoardVO(rs.getInt("postid"), rs.getString("title"), rs.getString("writerid"),
							rs.getString("content"), rs.getString("location"), rs.getInt("pay"),
							rs.getString("worktime"), rs.getString("regdate"), rs.getString("deadline"),
							rs.getBytes("image"));
					list.add(vo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
