package com.cosmos.controller.mypage;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.controller.members.Encrypt;
import com.cosmos.model.members.UpdatePwdService;
import com.cosmos.vo.MemberVO;

public class UpdatePwdController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		HttpSession session = request.getSession();  //세션연결
		String method = (String)data.get("method");
		
		if(method.equals("GET")) {
			return "myPage.jsp";
		}
		MemberVO nowUser = (MemberVO) session.getAttribute("user");  //세션 정보 불러오기
		UpdatePwdService service = new UpdatePwdService();
		
		//입력한 현재 패스워드
		String currentPW = request.getParameter("current-pw");
		
		//암호화해서 Session에 저장된 것과 비교
		Encrypt en = new Encrypt();
		String en_currentPW = en.getEncrypt(currentPW);  //입력한 패스워드를 암호화한것
		String db_currentPW = nowUser.getMember_pwd();  //DB에 있는 패쓰워드
		
		//System.out.println("입력한 패스워드 암호화 : "+en_currentPW);
		//System.out.println("DB에 있는 패쓰워드 : "+db_currentPW);
		
		if(!en_currentPW.equals(db_currentPW) ) {  
			//잘못입력한 경우
			//System.out.println("현재 패스워드 잘못입력했어!!!");
			return "myPage.jsp";
		}else{
			//잘 입력한 경우
			//업데이트할 패스워드
			//System.out.println("현재 패스워드 잘 입력했다~");
			String updatePwd = request.getParameter("new-pw2");
			
			//암호화
			Encrypt en2 = new Encrypt();
			String en_pwd = en2.getEncrypt(updatePwd);
			
			String mem = service.updatePwd(nowUser, en_pwd);
			String message = mem;
			System.out.println(message);
			return "myPage.jsp";
		}
		
		
		
	}

}
