package com.cosmos.vo;

import java.util.Date;

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
public class CodeVO {
	private int code_no;
	private int quiz_no;
	private String quiz_title;
	private String quiz_url;
	private int sg_no;
	private String sg_name;
	private String code_content;
	private Date code_date;
	private int member_no;
	private String code_lang;
}
