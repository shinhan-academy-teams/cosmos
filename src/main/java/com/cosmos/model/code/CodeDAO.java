package com.cosmos.model.code;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cosmos.model.mark.MarkDAO;
import com.cosmos.util.OracleUtil;
import com.cosmos.vo.code.CodeVO;
import com.cosmos.vo.code.MarkCodeVO;
import com.cosmos.vo.code.MyCodeVO;

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
	public List<MarkCodeVO> showCode(int quizNo, int sgNo) {
		String sql = "select * from code where quiz_no =? and sg_no=?";
		conn = OracleUtil.getConnection();
		List<MarkCodeVO> codes = new ArrayList<>();
		
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, quizNo);
			st.setInt(2, sgNo);
			rs = st.executeQuery();
			while(rs.next()) {
				MarkCodeVO code = new MarkCodeVO();
				code.setCode_no(rs.getInt("code_no"));
				MarkDAO markDao = new MarkDAO();
				int mark_count = markDao.countMark(code.getCode_no());
				code.setMark_count(mark_count);
				code.setQuiz_no(rs.getInt("quiz_no"));
				code.setSg_no(rs.getInt("sg_no"));
				code.setCode_content(rs.getString("code_content"));
				code.setCode_date(rs.getDate("code_date"));
				code.setMember_no(rs.getInt("member_no"));
				code.setCode_lang(rs.getString("code_lang"));
				codes.add(code);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		return codes;
	}
	
	// 내 코드 목록 보기
	public List<MyCodeVO> showMyCode(int memberNo) {
		String sql = "select code.code_no, quiz.quiz_title, quiz.quiz_url, studygroup.sg_no, studygroup.sg_name, code.code_lang, code.code_date "
				+ "from code join quiz on code.quiz_no=quiz.quiz_no "
				+ "join studygroup on code.sg_no = studygroup.sg_no "
				+ "where code.member_no = ?"; 
		conn = OracleUtil.getConnection();
		List<MyCodeVO> codes = new ArrayList<>();
		
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, memberNo);
			rs = st.executeQuery();
			while(rs.next()) {
				MyCodeVO code = new MyCodeVO();
				code.setCode_no(rs.getInt("code_no"));
				code.setQuiz_title(rs.getString("quiz_title"));
				code.setQuiz_url(rs.getString("quiz_url"));
				code.setSg_no(rs.getInt("sg_no"));
				code.setSg_name(rs.getString("sg_name"));
				code.setCode_lang(rs.getString("code_lang"));
				code.setCode_date(rs.getDate("code_date"));
				codes.add(code);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		return codes;
	}
	
	// 내 코드 상세 보기
	public CodeVO showMyCodeContent(int codeNo, int memberNo) {
		String sql = "select code_content from code where code_no=? and member_no=?"; 
		conn = OracleUtil.getConnection();
		CodeVO code = new CodeVO();
		
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, codeNo);
			st.setInt(2, memberNo);
			rs = st.executeQuery();
			while(rs.next()) {
				code.setCode_content(rs.getString("code_content"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			OracleUtil.dbDisconnect(rs, st, conn);
		}
		return code;
	}
}
