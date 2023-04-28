package com.cosmos.model.members;

import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.cosmos.controller.members.Encrypt;
import com.cosmos.vo.MemberVO;

public class FindService{

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
		// System.out.println("임시 비밀번호 : "+tempwd);
		String email = vo.getMember_email();
		EmailTest.naverMailSend("COSMOS: 임시 비밀번호", tempwd, email); //이메일 전송
		
		//비밀번호 암호화
		Encrypt en = new Encrypt();
		String en_pwd = en.getEncrypt(tempwd);
		
		vo.setMember_pwd(en_pwd);  //vo에 임시비밀번호 넣고
		return dao.updateRndPwd(vo);  //업데이트
	}
	
	//아이디로 데이터 찾기 (임시비밀번호 업데이트때 사용)
	public MemberVO findById(String id) {
		return dao.findById(id);
	}
	//이메일 전송
	static class EmailTest {
		private static final String HOST = "smtp.naver.com";
		/** 메일 PORT **/
		private static final String PORT = "587";
		/** 메일 ID **/
		private static final String MAIL_ID = "cosmaker2023@naver.com";  //보내는 사람 이메일
		/** 메일 PW **/
		private static final String MAIL_PW = "cosmaker2023!";  //보내는 사람 비밀번호
		
		
		public static void naverMailSend(String subejct, String tempwd, String email) {
			try {
				InternetAddress[] receiverList = new InternetAddress[1];
				receiverList[0] = new InternetAddress(email);  //받는 사람 이메일(회원이메일)
				
				// SMTP 발송 Properties 설정
				Properties props = new Properties();
				props.put("mail.transport.protocol", "smtp");
				props.put("mail.smtp.host", HOST);
				props.put("mail.smtp.port", PORT);
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.ssl.trust", "*");
				props.put("mail.smtp.ssl.enabled", "true");
				props.put("mail.smtp.ssl.protocols", "TLSv1.2");
				props.put("mail.smtp.auth", "true");

				// SMTP Session 생성
				Session mailSession = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
						return new javax.mail.PasswordAuthentication(MAIL_ID, MAIL_PW);
					}
				});

				// Mail 조립
				Message mimeMessage = new MimeMessage(mailSession);
				mimeMessage.setFrom(new InternetAddress(MAIL_ID));
				mimeMessage.setRecipients(Message.RecipientType.TO, receiverList);
				// 메일 제목
				mimeMessage.setSubject(subejct);
				
				
				
				
				// 메일 본문 (.setText를 사용하면 단순 텍스트 전달 가능)
				mimeMessage.setContent("<div style=\"background-color:#FAE6D4; width: 500px; text-align:center; padding: 15px; margin:auto;\" > \r\n"
						+ "	<img src=\"https://i.imgur.com/AxVhoO6.png\" width=\"140px\" style=\"margin-bottom:15px\"/>\r\n"
						+ "	<p style=\"font-weight: bold ;\">임시 비밀번호 : "+tempwd+"</p>\r\n"
						+ "	<hr style=\"color:black;\">\r\n"
						+ "	<p>로그인 후 마이페이지>비밀번호 수정 페이지에서 새 비밀번호로 수정해주세요.</p>\r\n"
						+ "</div>", "text/html; charset=UTF-8");

				// Mail 발송
				Transport.send(mimeMessage);

			} catch (Exception e) {
				System.out.println("메일 발송 오류!!");
				e.printStackTrace();
			}

		}
		 
	}

}
