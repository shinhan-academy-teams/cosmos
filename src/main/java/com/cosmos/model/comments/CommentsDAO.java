package com.cosmos.model.comments;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cosmos.util.OracleUtil;

public class CommentsDAO {
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	
	//댓글 추가
	public int insertComments(int codeNo, int memberNo, String cmtContent) {
		int result = 0;
		//insert into comments values(cmt_seq.nextval, 6, 146, sysdate, '굳굳!');  
		String sql = "insert into comments values(cmt_seq.nextval, ?, ?, sysdate, ?)";
		conn = OracleUtil.getConnection();
		
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, codeNo);
			st.setInt(2, memberNo);
			st.setString(3, cmtContent);
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
