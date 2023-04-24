package com.cosmos.model.code;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cosmos.util.OracleUtil;
import com.cosmos.vo.CodeVO;

public class CodeDAO {

	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	
	//코드 추가
	public int insertCode(int quizNo, int sgNo, String codeContent, int memberNo, String lang) {
		int result = 0;
		String sql = "insert into code values(code_seq.nextval, ?, ?, to_clob(?), sysdate, ?, ?)";
		conn = OracleUtil.getConnection();
		
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, quizNo);
			st.setInt(2, sgNo);
			st.setString(3, codeContent);
			st.setInt(4, memberNo);
			st.setString(5, lang);
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		return result;
	}
	
	//코드 보기
	public List<CodeVO> showCode(int quizNo, int sgNo) {
		String sql = "select * from code where quiz_no =? and sg_no=?"; 
		conn = OracleUtil.getConnection();
		List<CodeVO> codes = new ArrayList<>();
		
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, quizNo);
			st.setInt(2, sgNo);
			rs = st.executeQuery();
			while(rs.next()) {
				CodeVO code = new CodeVO();
				code.setCode_no(rs.getInt("code_no"));
				code.setQuiz_no(rs.getInt("quiz_no"));
				code.setSg_no(rs.getInt("sg_no"));
				code.setCode_content(rs.getString("code_content"));
				//System.out.println(rs.getString("code_content"));
				code.setCode_date(rs.getDate("code_date"));
				code.setMember_no(rs.getInt("member_no"));
				code.setCode_lang(rs.getString("code_lang"));
				codes.add(code);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		return codes;
	}
}
