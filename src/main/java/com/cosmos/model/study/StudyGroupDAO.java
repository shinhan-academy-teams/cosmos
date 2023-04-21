package com.cosmos.model.study;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cosmos.util.OracleUtil;
import com.cosmos.vo.StudyGroupVO;

// StudyGroup 테이블 접근
public class StudyGroupDAO {
	Connection conn;
	Statement statement;
	ResultSet result;
	PreparedStatement prepared;

	// 존재하는 전체 스터디 그룹 목록 보여주기
	public List<StudyGroupVO> selectAllGroup() {
		// 쿼리문
		String sql = "select studygroup.*, member_name from studygroup join members "
				+ "on studygroup.sg_manager = members.member_no";
		// DB에서 가져온 그룹 목록을 저장할 리스트
		List<StudyGroupVO> studyGroup = new ArrayList<>();
		conn = OracleUtil.getConnection();
		try {
			statement = conn.createStatement();
			result = statement.executeQuery(sql);
			while (result.next()) {
				// 만들어진 그룹 객체를 리스트에 추가
				studyGroup.add(getOneGroup(result));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(result, statement, conn);
		}
		return studyGroup;
	}

	/*
	 * 
	 */

	// 스터디명으로 검색하기
	public List<StudyGroupVO> searchGroupByName(String keyword) {
		String sql = "select studygroup.*, member_name from studygroup join members "
				+ "on studygroup.sg_manager = members.member_no "
				+ "where sg_name like '%" + keyword + "%'";
		List<StudyGroupVO> studyGroup = new ArrayList<>();
		conn = OracleUtil.getConnection();
		try {
			statement = conn.createStatement();
			result = statement.executeQuery(sql);
			while (result.next()) {
				studyGroup.add(getOneGroup(result));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(result, statement, conn);
		}
		return studyGroup;
	}

	/*
	 * 
	 */

	// 스터디장 이름으로 검색하기
	public List<StudyGroupVO> searchGroupByManager(String keyword) {
		String sql = "select studygroup.*, member_name from studygroup join members "
				+ "on studygroup.sg_manager = members.member_no "
				+ "where member_name like '%" + keyword + "%'";
		List<StudyGroupVO> studyGroup = new ArrayList<>();
		conn = OracleUtil.getConnection();
		try {
			statement = conn.createStatement();
			result = statement.executeQuery(sql);
			while (result.next()) {
				studyGroup.add(getOneGroup(result));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(result, statement, conn);
		}
		return studyGroup;
	}

	/*
	 * 
	 */
	
	// 스터디명 또는 스터디장으로 검색
	public List<StudyGroupVO> searchGroupByKeyword(String keyword) {
		String sql = "select studygroup.*, member_name from studygroup join members "
				+ "on studygroup.sg_manager = members.member_no "
				+ "where member_name like '%" + keyword + "%'"
						+ "or sg_name like '%" + keyword + "%'";
		List<StudyGroupVO> studyGroup = new ArrayList<>();
		conn = OracleUtil.getConnection();
		try {
			statement = conn.createStatement();
			result = statement.executeQuery(sql);
			while (result.next()) {
				studyGroup.add(getOneGroup(result));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(result, statement, conn);
		}
		return studyGroup;
	}

	/*
	 * 
	 */
	
	// 스터디 아이디로 스터디 그룹 정보 가져오기
	public StudyGroupVO getGroupInfo(int studyNo) {
		String sql = "select studygroup.*, member_name from studygroup join members "
				+ "on studygroup.sg_manager = members.member_no "
				+ "where sg_no=" + studyNo;
		StudyGroupVO studyGroup = new StudyGroupVO();
		conn = OracleUtil.getConnection();
		try {
			statement = conn.createStatement();
			result = statement.executeQuery(sql);
			while (result.next()) {
				studyGroup.setSg_no(result.getInt("sg_no"));
				studyGroup.setSg_info(result.getString("sg_info"));
				// 멤버(추후 추가)
				studyGroup.setSg_lang(result.getString("sg_lang"));
				studyGroup.setSg_name(result.getString("sg_name"));
				studyGroup.setManager_name(result.getString("member_name"));
				studyGroup.setSg_created(result.getDate("sg_created"));
				studyGroup.setSg_max(result.getInt("sg_max"));
				studyGroup.setSg_cur(result.getInt("sg_cur"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(result, statement, conn);
		}
		return studyGroup;
	}
	
	/*
	 * 
	 */
	
	// 스터디 가입
	public int joinStudyGroup(int memberNo, int studyNo) {
		int resultCount = 0;
		String sql = "insert into party values(?,?,'member')";
		conn = OracleUtil.getConnection();
		try {
			prepared = conn.prepareStatement(sql);
			prepared.setInt(1, memberNo);
			prepared.setInt(2, studyNo);
			resultCount = prepared.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(null, prepared, conn);
		}
		return resultCount;
	}
	
	/*
	 * 
	 */
	
	// 스터디 가입 가능 여부 확인
	public boolean canJoinStudy(int memberNo, int studyNo) {
		conn = OracleUtil.getConnection();
		// 이미 가입되어 있는지 확인
		String already = "select * from party where member_no=? and sg_no=?";
		try {
			prepared = conn.prepareStatement(already);
			prepared.setInt(1, memberNo);
			prepared.setInt(2, studyNo);
			result = prepared.executeQuery();
			while (result.next()) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(result, statement, conn);
		}
		return true;
	}
	
	/*
	 * 
	 */
	
	// 스터디 생성
	public int createStudyGroup(StudyGroupVO object) {
		int resultCount1 = 0;
		int resultCount2 = 0;
		String createStudy = "insert into studygroup values(sg_seq.nextval,?,?,?,?,sysdate,?,default)";
		String insertParty = "insert into party values(?,sg_seq.currval,'manager')";
		conn = OracleUtil.getConnection();
		try {
			// 스터디 그룹 생성
			prepared = conn.prepareStatement(createStudy);
			prepared.setString(1, object.getSg_name());
			prepared.setInt(2, object.getSg_manager());
			prepared.setInt(3, object.getSg_max());
			prepared.setString(4, object.getSg_lang());
			prepared.setString(5, object.getSg_info());
			resultCount1 = prepared.executeUpdate();
			
			// 스터디장을 party테이블에 추가
			if(resultCount1>0) {
				prepared = conn.prepareStatement(insertParty);
				prepared.setInt(1, object.getSg_manager());
				resultCount2 = prepared.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(null, prepared, conn);
		}
		return resultCount1+resultCount2;
	}
	
	/*
	 * 
	 */

	// 스터디 그룹 객체를 생성해서 반환해주는 메서드
	private StudyGroupVO getOneGroup(ResultSet result) throws SQLException {
		StudyGroupVO groupObject = new StudyGroupVO();
		// 스터디 번호
		groupObject.setSg_no(result.getInt("sg_no"));
		// 스터디 이름
		groupObject.setSg_name(result.getString("sg_name"));
		// 스터디장(현재 단순 회원 번호를 가져오지만 추후 이름 불러오는걸로 수정)
		groupObject.setSg_manager(result.getInt("sg_manager"));
		// 스터디 최대 인원
		groupObject.setSg_max(result.getInt("sg_max"));
		// 사용 언어
		groupObject.setSg_lang(result.getString("sg_lang"));
		// 스터디 생성일
		groupObject.setSg_created(result.getDate("sg_created"));
		// 스터디장 이름
		groupObject.setManager_name(result.getString("member_name"));
		return groupObject;

	}

}
