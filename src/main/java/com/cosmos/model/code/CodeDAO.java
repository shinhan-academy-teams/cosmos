package com.cosmos.model.code;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cosmos.util.OracleUtil;

public class CodeDAO {

	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	
	//코드 추가
	public int insertCode(int quizNo, int sgNo, String codeContent, int memberNo) {
		int result = 0;
		String sql = "insert into code values(code_seq.nextval, ?, ?, to_clob(?), sysdate, ?)";
		conn = OracleUtil.getConnection();
		
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, quizNo);
			st.setInt(2, sgNo);
			st.setString(3, codeContent);
			st.setInt(4, memberNo);
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
