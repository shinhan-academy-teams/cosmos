package com.cosmos.controller.members;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encrypt {
	public String getEncrypt(String pwd) {
		String result = "";
		try {
			// 1. SHA256 알고리즘 객체 생성
			MessageDigest md = MessageDigest.getInstance("SHA-256");

			// 2. pwd에 SHA-256 적용
			md.update((pwd).getBytes());
			byte[] pwdsalt = md.digest();

			// 3. byte To String(16진수의 문자열로 변경)
			StringBuffer sb = new StringBuffer();
			for (byte b : pwdsalt) {
				sb.append(String.format("%02x", b)); // 최소 2자리 숫자를 사용, 0을 사용하여 길이를 채운 16진수
			}

			result = sb.toString();

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return result;

	}
}
