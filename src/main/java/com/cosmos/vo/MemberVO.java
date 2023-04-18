package com.cosmos.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class MemberVO {
	private int member_no;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_email;
}
