package com.cosmos.model.study;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cosmos.util.OracleUtil;
import com.cosmos.vo.QuizVO;
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
	
	// 내 스터디 문제 목록 보여주기
	public List<QuizVO> showAllQuiz(int studyNO){
		// 쿼리문
		String sql = "select * from quiz where sg_no=" + studyNO;
		List<QuizVO> allQuiz = new ArrayList<>();
		conn = OracleUtil.getConnection();
		try {
			statement = conn.createStatement();
			result = statement.executeQuery(sql);
			while (result.next()) {
				QuizVO quiz = new QuizVO();
				quiz.setQuiz_no(result.getInt("quiz_no"));
				quiz.setSg_no(result.getInt("sg_no"));
				quiz.setQuiz_url(result.getString("quiz_url"));
				quiz.setQuiz_title(result.getString("quiz_title"));
				quiz.setQuiz_date(result.getDate("quiz_date"));
				allQuiz.add(quiz);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(result, statement, conn);
		}
		return allQuiz;
		
	}
	

}
