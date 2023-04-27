package com.cosmos.vo;

import java.sql.Date;

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
		builder.append("{\"title\":");
		builder.append("\""+quiz_title+"\"");
		builder.append(",\"start\":");
		builder.append("\"" + quiz_date + "\"");
		builder.append(",\"end\":");
		builder.append("\"" + quiz_date + "\"");
		builder.append(",\"url\":");
		builder.append("\""+quiz_url+"*"+quiz_no+"\"}");
		return builder.toString();
	}
} // 230421 영선