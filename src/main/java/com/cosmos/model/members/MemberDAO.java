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

	//회원가입(insert)
	public int signUpMember(MemberVO member) {
		int result = 0;
		//insert into members values(member_seq.nextval, 'hee00','hee00!','zzahee','zzahee@gmail.com');
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		
		return result;
	}
	
	//이메일 중복체크
	public int emailDupCheck(String email) {
		int count = 0;
		//select count(*) from members where member_email= 'zzahee@gmail.com';
		String sql = "select count(*) from members where member_email=?";
		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setString(1,email);
			rs = st.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		return count;
	}
	
	//id중복체크
	public int idDupCheck(String id) {
		int count = 0;
		//select count(*) from members where member_id = 'hee00';
		String sql = "select count(*) from members where member_id = ?";
		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, id);
			rs = st.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		
		return count;
	}
	
	//특정 멤버 select -> sign in에 활용
	public MemberVO signInCheck(String id, String pwd) {
		MemberVO member = null;
		//select * from members where member_id='hee00' and member_pwd='hee00!';
		String sql = "select * from members where member_id=? and member_pwd=?";
		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, id);
			st.setString(2, pwd);
			rs = st.executeQuery();
			
			while(rs.next()) {
				member = new MemberVO();
				member.setMember_no(rs.getInt("member_no"));
				member.setMember_id(id);
				member.setMember_name(rs.getString("member_name"));
				member.setMember_pwd(pwd);
				member.setMember_email(rs.getString("member_email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		return member;
	}
	
	//아이디, 비밀번호 체크
	public int idPwdCheck(String id, String pwd) {
		int count = 0;
		//select count(*) from members where member_id='bona366' and member_pwd='1234';
		String sql = "select count(*) from members where member_id=? and member_pwd=?";
		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, id);
			st.setString(2, pwd);
			rs = st.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		
		return count;
	}
	
	//아이디 찾기
	public MemberVO findId(String email) {
		MemberVO member = null;
		//select member_id from members where member_email='zzahee366@gmail.com';
		String sql ="select member_id from members where member_email=?";
		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, email);
			rs = st.executeQuery();
			
			while(rs.next()) {
				member = new MemberVO();
				member.setMember_id(rs.getString("member_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		return member;
	}
	
	//난수 비밀번호 수정
	public MemberVO updateRndPwd(MemberVO vo) {
		MemberVO member = null;
		int result = 0;
		//update members set member_pwd='4321' where member_id='bona366';
		String sql = "update members set member_pwd=? where member_id=?";
		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setString(1,vo.getMember_pwd());
			st.setString(2, vo.getMember_id());
			st.executeUpdate();  //SQL문 실행
			member = vo;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		System.out.println("update결과 : " +member);
		return member;
	}

	//아이디로 회원 찾기
	public MemberVO findById(String id) {
		MemberVO member = null;
		//select * from members where member_id='hee00';
		String sql = "select * from members where member_id=?";
		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setString(1,id);
			rs = st.executeQuery();
			while(rs.next()) {
				member = new MemberVO();
				member.setMember_no(rs.getInt("member_no"));
				member.setMember_id(id);
				member.setMember_name(rs.getString("member_name"));
				member.setMember_pwd(rs.getString("member_pwd"));
				member.setMember_email(rs.getString("member_email"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		return member;
		
	}
	
//	//아이디로 비밀번호 찾기(임시 비밀번호)
//	public String findPwById(String id) {
//		String mempw = "";
//		//select member_pwd from members where member_id = 'bona366';
//		String sql = "select member_pwd from members where member_id = ?";
//		conn = OracleUtil.getConnection();
//		
//		try {
//			st = conn.prepareStatement(sql);
//			st.setString(1, id);
//			rs = st.executeQuery();
//			while(rs.next()) {
//				mempw = rs.getString("member_pwd");
//			}
//				
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			OracleUtil.dbDisconnect(rs, st, conn);
//		}
//		return mempw;
//	}

}
