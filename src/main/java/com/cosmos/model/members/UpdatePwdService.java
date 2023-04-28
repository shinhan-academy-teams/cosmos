package com.cosmos.model.members;

import com.cosmos.vo.MemberVO;

public class UpdatePwdService {

	MemberDAO dao = new MemberDAO();

	public String updatePwd(MemberVO member, String pwd) {
		int result = dao.updatePwd(member, pwd);
		if (result < 1) {
			return "비밀번호 변경 실패";
		} else {
			return "비밀번호 변경 성공";
		}
	}
}
