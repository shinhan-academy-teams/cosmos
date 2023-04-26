package com.cosmos.model.mark;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cosmos.util.OracleUtil;

public class MarkDAO {

	Connection conn;
	PreparedStatement st;
	ResultSet rs;

	// 코드 좋아요 누르기
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
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}

		return result;
	}

	// 좋아요 갯수 출력
	public int countMark(int codeNo) {
		int count = 0;
		String sql = "select count(*) from mark where code_no=?";
		conn = OracleUtil.getConnection();

		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, codeNo);
			rs = st.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		return count;
	}

	// 이미 좋아요 했는지
	public boolean isAlreadyMarked(int memberNo, int codeNo) {
		String sql = "select count(*) from mark where code_no = ? and member_no = ?";
		conn = OracleUtil.getConnection();

		int count = 0;
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, codeNo);
			st.setInt(2, memberNo);
			rs = st.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}

		return count > 0 ? true : false;
	}

	// 특정 사용자가 좋아요한 코드 select
	public List<Integer> selectMarkByMember(int memberNo) {
		String sql = "select code_no from mark where member_no = ? ";
		List<Integer> list = null;

		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, memberNo);
			rs = st.executeQuery();
			list = new ArrayList<>();
			while (rs.next()) {
				list.add(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}

		return list;
	}
}
