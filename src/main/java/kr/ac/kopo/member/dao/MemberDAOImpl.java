package kr.ac.kopo.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;

public class MemberDAOImpl implements MemberDAO {

	@Override
	public MemberVO selectMemberByIDPassword(MemberVO loginVO) throws Exception {

		StringBuilder sql = new StringBuilder();
		sql.append("select id, name, type ");
		sql.append("  from tbl_member ");
		sql.append(" where id = ? and password = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, loginVO.getId());
			pstmt.setString(2, loginVO.getPassword());

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String type = rs.getString("type");

				MemberVO member = new MemberVO();
				member.setId(id);
				member.setName(name);
				member.setType(type);

				return member;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public void insertMember(MemberVO member) throws Exception {
		String sql = "INSERT INTO tbl_member(id, password, name, type) VALUES (?, ?, ?, ?)";

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getType());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	// ✅ 아이디 중복 확인 메서드 구현
	@Override
	public boolean isExistId(String id){
	    String sql = "SELECT COUNT(*) cnt FROM tbl_member WHERE id = ?";

	    try (
	        Connection conn = new ConnectionFactory().getConnection();
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	    ) {
	        pstmt.setString(1, id);
	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            return rs.getInt("cnt") > 0;
	        }

	        return false;

	    } catch (Exception e) {
	        e.printStackTrace(); // 🔴 예외 로그 출력
	        throw new RuntimeException("아이디 중복 검사 중 오류 발생", e); // 🔴 예외 wrapping & 전달
	    }
	}


}
