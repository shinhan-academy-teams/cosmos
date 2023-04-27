package com.cosmos.model.quiz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cosmos.util.OracleUtil;
import com.cosmos.vo.QuizVO;
import com.shinhan.vo.EmpVO;

public class QuizDAO {
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	
	//문제 추가
	public int insertQuiz(int sgNo, String quizUrl, String quizTitle) {
		int result = 0;
		//insert into quiz values(quiz_seq.nextval, 8,'https://www.acmicpc.net/problem/1018','체스판 다시 칠하기',sysdate);
		String sql="insert into quiz values(quiz_seq.nextval, ?,?,?,sysdate)";
		conn = OracleUtil.getConnection();
		
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, sgNo);
			st.setString(2, quizUrl);
			st.setString(3, quizTitle);
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		
		return result;
	}
	
	// quiz_no로 quiz_title, quiz_url 찾기
	public QuizVO selectByQuizNo(int quiz_no) {
		QuizVO quizVo = null;
		
		// select * from quiz where quiz_no = 48;
		String sql = "select * from quiz where quiz_no = ?";
		conn = OracleUtil.getConnection();

		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, quiz_no);
			rs = st.executeQuery();

			if (rs.next()) {
				quizVo = new QuizVO();
				quizVo.setQuiz_title(rs.getString("quiz_title"));
				quizVo.setQuiz_url(rs.getString("quiz_url"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		
		return quizVo;
	}
}
