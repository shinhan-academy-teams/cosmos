package com.cosmos.controller.members;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encrypt {
	public static void main(String pwd) {
		Encrypt en = new Encrypt();
		
		System.out.println("pwd : "+pwd);
		//최종 pwd 생성
		String res = en.getEncrypt(pwd);
	}
	

	
	public String getEncrypt(String pwd) {
		String result = "";
		try {
			//1. SHA256 알고리즘 객체 생성
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			
			//2. pwd와 salt 합친 문자열에 SHA-256 적용
			md.update((pwd).getBytes());
			byte[] pwdsalt = md.digest();
			
			//3. byte To String(10진수의 문자열로 변경)
			StringBuffer sb = new StringBuffer();
			for(byte b: pwdsalt) {
				sb.append(String.format("%02x", b));
			}
			
			result = sb.toString();
			System.out.println("pwd 암호화 후 : "+result);
			
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
			
		return result;
		
	}
}
