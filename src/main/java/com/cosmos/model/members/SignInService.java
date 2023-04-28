package com.cosmos.model.members;

import com.cosmos.vo.MemberVO;

public class SignInService {

	MemberDAO dao = new MemberDAO();

	public MemberVO signInCheck(String id, String pwd) {
		return dao.signInCheck(id, pwd);
	}

	public int idPwdCheck(String id, String pwd) {
		return dao.idPwdCheck(id, pwd);
	}
}
