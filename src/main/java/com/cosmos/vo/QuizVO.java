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
public class QuizVO {
	private int quiz_no;
	private int sg_no;
	private String quiz_url;
	private String quiz_title;
	private Date quiz_date;
}
