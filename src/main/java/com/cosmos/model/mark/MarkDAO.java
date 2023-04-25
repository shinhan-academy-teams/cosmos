package com.cosmos.model.mark;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cosmos.util.OracleUtil;

public class MarkDAO {
	
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	
	//코드 좋아요 누르기
	public int insertMark(int memberNo, int codeNo) {
		int result = 0;
		String sql = "insert into mark values(?,?)";
		conn = OracleUtil.getConnection();
		
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, memberNo);
			st.setInt(2, codeNo);
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		
		return result;
	}
	
	//좋아요 갯수 출력
	public int countMark(int codeNo) {
		int count = 0;
		//select count(*) from mark where code_no=10;
		String sql = "select count(*) from mark where code_no=?";
		conn = OracleUtil.getConnection();
		
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1,codeNo);
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
}
