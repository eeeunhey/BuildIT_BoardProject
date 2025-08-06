package kr.ac.kopo.member.dao;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberDAO {

    /**
     * 회원가입 기능
     */
    void insertMember(MemberVO member) throws Exception;

    /**
     * 로그인 기능
     * @param loginVO 사용자가 입력한 ID, PASSWORD를 저장한 객체
     * @return 로그인 성공 시 회원정보 VO 반환, 실패 시 null
     */
    MemberVO selectMemberByIDPassword(MemberVO loginVO) throws Exception;

    /**
     * 아이디 중복 여부 확인
     * @param id 입력받은 ID
     * @return 이미 존재하면 true, 없으면 false
     */
    boolean isExistId(String id) throws Exception;
    
   
}
