package com.cosmos.model.members;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cosmos.util.OracleUtil;
import com.cosmos.vo.MemberVO;

public class MemberDAO {
	Connection conn;
	PreparedStatement st;
	ResultSet rs;

	// 회원가입(insert)
	public int signUpMember(MemberVO member) {
		int result = 0;
		String sql = "insert into members values(member_seq.nextval, ?,?,?,?)";
		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, member.getMember_id());
			st.setString(2, member.getMember_pwd());
			st.setString(3, member.getMember_name());
			st.setString(4, member.getMember_email());
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}

		return result;
	}

	// 이메일 중복체크
	public int emailDupCheck(String email) {
		int count = 0;
		String sql = "select count(*) from members where member_email=?";
		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, email);
			rs = st.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		return count;
	}

	// id중복체크
	public int idDupCheck(String id) {
		int count = 0;
		String sql = "select count(*) from members where member_id = ?";
		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, id);
			rs = st.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}

		return count;
	}

	// 특정 멤버 select -> sign in에 활용
	public MemberVO signInCheck(String id, String pwd) {
		MemberVO member = null;
		String sql = "select * from members where member_id=? and member_pwd=?";
		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, id);
			st.setString(2, pwd);
			rs = st.executeQuery();

			while (rs.next()) {
				member = new MemberVO();
				member.setMember_no(rs.getInt("member_no"));
				member.setMember_id(id);
				member.setMember_name(rs.getString("member_name"));
				member.setMember_pwd(pwd);
				member.setMember_email(rs.getString("member_email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		return member;
	}

	// 아이디, 비밀번호 체크
	public int idPwdCheck(String id, String pwd) {
		int count = 0;
		String sql = "select count(*) from members where member_id=? and member_pwd=?";
		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, id);
			st.setString(2, pwd);
			rs = st.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}

		return count;
	}

	// 아이디 찾기
	public MemberVO findId(String email) {
		MemberVO member = null;
		String sql = "select member_id from members where member_email=?";
		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, email);
			rs = st.executeQuery();

			while (rs.next()) {
				member = new MemberVO();
				member.setMember_id(rs.getString("member_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		return member;
	}

	// 난수 비밀번호 수정
	public MemberVO updateRndPwd(MemberVO vo) {
		MemberVO member = null;
		String sql = "update members set member_pwd=? where member_id=?";
		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, vo.getMember_pwd());
			st.setString(2, vo.getMember_id());
			st.executeUpdate(); // SQL문 실행
			member = vo;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		return member;
	}

	// 아이디로 회원 찾기
	public MemberVO findById(String id) {
		MemberVO member = null;
		String sql = "select * from members where member_id=?";
		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, id);
			rs = st.executeQuery();
			while (rs.next()) {
				member = new MemberVO();
				member.setMember_no(rs.getInt("member_no"));
				member.setMember_id(id);
				member.setMember_name(rs.getString("member_name"));
				member.setMember_pwd(rs.getString("member_pwd"));
				member.setMember_email(rs.getString("member_email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		return member;

	}

	// 비밀번호 변경
	public int updatePwd(MemberVO member, String pwd) {
		int resultCount = 0;
		String sql = "update members set member_pwd=? where member_id=?";
		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, pwd);
			st.setString(2, member.getMember_id());
			resultCount = st.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		return resultCount;
	}

	// 회원 탈퇴
	public int deleteMember(int memberNo) {
		int resultCount = 0;
		String sql = "delete from members where member_no=?";
		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, memberNo);
			// 스터디 생성 여부 확인
			if (hasStudygroup(memberNo)) {
				// 스터디가 있어서 회원 탈퇴가 불가능합니다
				return -1;
			}
			resultCount = st.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(null, st, conn);
		}
		return resultCount;
	}

	// 회원 탈퇴 - 스터디 그룹 생성 여부 확인
	private boolean hasStudygroup(int memberNo) {
		PreparedStatement st = null;
		boolean flag = false;
		String sql = "select * from studygroup where sg_manager=?";
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, memberNo);
			rs = st.executeQuery();
			while (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, st, null);
		}
		return flag;
	}

}
