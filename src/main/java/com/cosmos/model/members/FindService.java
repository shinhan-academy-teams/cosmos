package com.cosmos.model.members;

import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServlet;

import com.cosmos.vo.MemberVO;

public class FindService extends HttpServlet{

	MemberDAO dao = new MemberDAO();
	public MemberVO findId(String email) {
		return dao.findId(email);
	}
	
	//임시비밀 번호 난수 배열
	private final char[] rndCharSet = new char[]{
			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
		    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
		    'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
		    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
		    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
		    // 원하는 특수문자 추가해서 사용
	};
	//임시비밀번호 생성
	public String getRandomString(int size) {
		StringBuilder sb = new StringBuilder();
	    
	    Random rnd = new Random(new Date().getTime());

	    int len = rndCharSet.length;
	    
	    for (int i = 0; i < size; i++) {
	        sb.append(rndCharSet[rnd.nextInt(len)]);
	    }

	    return sb.toString();
	}
	
	//임시비밀번호로 업데이트
	public MemberVO updateRndPwd(MemberVO vo) {
		String tempwd = getRandomString(7);  //7자리 임시비밀번호 생성
		System.out.println("임시 비밀번호 : "+tempwd);
		
		vo.setMember_pwd(tempwd);  //vo에 임시비밀번호 넣고
		return dao.updateRndPwd(vo);  //업데이트
	}
	
	//아이디로 데이터 찾기 (임시비밀번호 업데이트때 사용)
	public MemberVO findById(String id) {
		return dao.findById(id);
	}
}
