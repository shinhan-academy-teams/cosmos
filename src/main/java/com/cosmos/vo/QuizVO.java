package com.cosmos.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
//@ToString
public class QuizVO {
	private int quiz_no;
	private int sg_no;
	private String quiz_url;
	private String quiz_title;
	private Date quiz_date;
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("{\"quiz_no\":");
		builder.append(quiz_no);
		builder.append(",\"sg_no\":");
		builder.append(sg_no);
		builder.append(",\"quiz_url\":");
		builder.append("\""+quiz_url+"\"");
		builder.append(",\"quiz_title\":");
		builder.append("\""+quiz_title+"\"");
		builder.append(",\"quiz_date\":");
		builder.append("\"" + quiz_date + "\"}");
		return builder.toString();
	}
} // 230421 영선
