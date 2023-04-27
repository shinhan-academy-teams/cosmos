package com.cosmos.model.comments;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cosmos.util.OracleUtil;
import com.cosmos.vo.comments.CmtJoinMemVO;

public class CommentsDAO {
	Connection conn;
	PreparedStatement st;
	ResultSet rs;

	// 댓글 추가
	public int insertComments(int codeNo, int memberNo, String cmtContent, int sgNo, int quizNo) {
		int result = 0;
		String sql = "insert into comments values(cmt_seq.nextval, ?, ?, sysdate, ?, ?, ?)";
		conn = OracleUtil.getConnection();

		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, codeNo);
			st.setInt(2, memberNo);
			st.setString(3, cmtContent);
			st.setInt(4, sgNo);
			st.setInt(5, quizNo);
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		return result;
	}

	// 코드에 맞는 댓글select
	public Map<Integer, List<CmtJoinMemVO>> selectCmtByCode(int quizNo, int sgNo){
		String sql = "select comments.cmt_no, comments.code_no, members.member_name, comments.cmt_date, comments.cmt_content "
				+ " from comments join members "
				+ "on comments.member_no = members.member_no "
				+ "where quiz_no=? and sg_no= ?";
		Map<Integer,List<CmtJoinMemVO>> cmtMap = new HashMap<>();
		
		conn = OracleUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, quizNo);
			st.setInt(2, sgNo);
			rs = st.executeQuery();
			while(rs.next()) {
				int code_no = rs.getInt("code_no");
				CmtJoinMemVO obj = new CmtJoinMemVO();
				obj.setCmt_no(rs.getInt("cmt_no"));
				obj.setMember_name(rs.getString("member_name"));
				obj.setCmt_date(rs.getDate("cmt_date"));
				obj.setCmt_content(rs.getString("cmt_content"));
				
				List<CmtJoinMemVO> list = null;
				if (cmtMap.get(code_no) == null) { // 해당 코드에 대한 댓글 없으면 list 만들어서 map에 넣음
					list = new ArrayList<>();
				} else { // 해당 코드에 대한 댓글 있으면 map에서 그 댓글 list 뽑아와서 그 list에 댓글 넣고 그 list를 map에 넣음
					list = cmtMap.get(code_no);
				}
				list.add(obj);
				cmtMap.put(code_no, list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		
		return cmtMap;
	}

}
