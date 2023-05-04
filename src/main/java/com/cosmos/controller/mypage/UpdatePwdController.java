package com.cosmos.controller.mypage;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.controller.members.Encrypt;
import com.cosmos.model.members.FindService;
import com.cosmos.model.members.UpdatePwdService;
import com.cosmos.vo.MemberVO;

public class UpdatePwdController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		HttpSession session = request.getSession(); // 세션연결
		String method = (String) data.get("method");
		String page = "";

		if (method.equals("GET")) {
			page = "myPage.jsp";
		} else {
			MemberVO nowUser = (MemberVO) session.getAttribute("user"); // 세션 정보 불러오기
			UpdatePwdService service = new UpdatePwdService();

			// 입력한 현재 패스워드
			String currentPW = request.getParameter("current-pw");

			// 암호화해서 Session에 저장된 것과 비교
			Encrypt en = new Encrypt();
			String en_currentPW = en.getEncrypt(currentPW); // 입력한 패스워드를 암호화한것
			String db_currentPW = nowUser.getMember_pwd(); // DB에 있는 패스워드

			if (!en_currentPW.equals(db_currentPW)) { // 현재 비밀번호를 잘못 입력한 경우
				session.setAttribute("message", "current password is WRONG");
			} else { // 현재 비밀번호를 제대로 입력한 경우
				// 업데이트할 패스워드
				String updatePwd = request.getParameter("new-pw2");

				// 암호화
				Encrypt en2 = new Encrypt();
				String en_pwd = en2.getEncrypt(updatePwd);
				// 업데이트 수행
				service.updatePwd(nowUser, en_pwd);
				
				session.setAttribute("user", new FindService().findById(nowUser.getMember_id())); // 현재 세션에 있는 user 정보를 업데이트
				session.setAttribute("message", "password modified successfully");
			}
			
			page = "redirect:" + request.getContextPath() + "/mypage.do";
		}
		
		return page;
	}
}