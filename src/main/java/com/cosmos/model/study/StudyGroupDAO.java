package com.cosmos.model.study;

import java.sql.Connection;
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

	// 존재하는 전체 스터디 그룹 목록 보여주기
	public List<StudyGroupVO> selectAllGroup() {
		// 쿼리문
		String sql = "select * from studygroup";
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
		String sql = "select * from studygroup where sg_name like '%" + keyword + "%'";
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
		String sql = "select * from studygroup where sg_manager in"
				+ "(select member_no from members where member_name like '%"
				+ keyword
				+ "%')";
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
		return groupObject;

	}

}
