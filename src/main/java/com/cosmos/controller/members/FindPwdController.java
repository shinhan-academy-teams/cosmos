package com.cosmos.controller.members;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cosmos.controller.CommonControllerInterface;
import com.cosmos.model.members.FindService;
import com.cosmos.vo.MemberVO;

public class FindPwdController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		HttpSession session = request.getSession();
		String method = (String) data.get("method");
		String page = "";

		if (method.equals("GET")) {
			// findId에서 넘어온 파라미터
			String parameterEmail = request.getParameter("inputEmail");
			String parameterId = request.getParameter("foundId");

			if (parameterEmail != null && parameterId != null) { // 파라미터가 넘어왔다면
				request.setAttribute("parameterEmail", parameterEmail);
				request.setAttribute("parameterId", parameterId);
			}

			page = "findPwd.jsp";
		} else {
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id"); // 아이디 가져옴
			String email = request.getParameter("email"); // 이메일 가져옴
			String username = request.getParameter("username"); // 이름 가져옴
			FindService service = new FindService();
			MemberVO vo = service.findById(id);// 아이디로 해당 데이터 찾기

			System.out.println(vo.getMember_email());
			System.out.println(email);
			System.out.println(vo.getMember_name());
			System.out.println(username);
			if (vo != null && vo.getMember_email().equals(email) && vo.getMember_name().equals(username)){ // 아이디로 특정된 회원이 있고 이메일과 이름을 정확히 입력했다면
				service.updateRndPwd(vo); // 해당 데이터를 업데이트하기
				session.setAttribute("message", "temporary password sent from FindPwdController");

				page = "redirect:" + request.getContextPath() + "/signin.do";
			} else {
				session.setAttribute("message", "can NOT find user by id or WRONG input datas");

				page = "redirect:" + request.getContextPath() + "/findpwd.do";
			}
		}

		return page;
	}
}
