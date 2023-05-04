package com.cosmos.model.members;

public class MemberService {
	MemberDAO dao = new MemberDAO();

	public int deleteMember(int memberNo) {
		return dao.deleteMember(memberNo);
	}

}
