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
public class CommentsVO {
	private int cmt_no;
	private int code_no;
	private int member_no;
	private Date cmt_date;
	private String cmt_content;
}
