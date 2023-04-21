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

// 내 스터디 그룹 관련
public class MyStudyDAO {
	Connection conn;
	Statement statement;
	ResultSet result;
	PreparedStatement prepared;
	StudyGroupDAO studyGruopdao = new StudyGroupDAO();
	
	// 내가 가입된 스터디 목록 보여주기
	public List<StudyGroupVO> selectMyStudy(int memberNo){
		// 쿼리문
		String sql = "select studygroup.*, members.member_name "
				+ "from party join studygroup on party.sg_no = studygroup.sg_no "
				+ "join members on studygroup.sg_manager = members.member_no "
				+ "where party.member_no=" + memberNo;
		List<StudyGroupVO> studyGroup = new ArrayList<>();
		conn = OracleUtil.getConnection();
		try {
			statement = conn.createStatement();
			result = statement.executeQuery(sql);
			while (result.next()) {
				// 만들어진 그룹 객체를 리스트에 추가
				studyGroup.add(studyGruopdao.getOneGroup(result));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(result, statement, conn);
		}
		return studyGroup;
	
	}
	

}
