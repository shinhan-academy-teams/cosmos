package com.cosmos.model.quiz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cosmos.util.OracleUtil;

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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		
		return result;
	}
}
