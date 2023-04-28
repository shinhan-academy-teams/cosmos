package com.cosmos.model.members;

import com.cosmos.vo.MemberVO;

public class SignUpService {

	MemberDAO dao = new MemberDAO();

	public int signUpMember(MemberVO member) {
		return dao.signUpMember(member);
	}

	public int emailDupCheck(String email) {
		return dao.emailDupCheck(email);
	}

	public int idDupCheck(String id) {
		return dao.idDupCheck(id);
	}
}
