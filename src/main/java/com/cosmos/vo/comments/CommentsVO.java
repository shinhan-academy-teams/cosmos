package com.cosmos.vo.comments;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter

public class CommentsVO {
	private int cmt_no;
	private int code_no;
	private int member_no;
	private Date cmt_date;
	private String cmt_content;
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("cmt_no=")
			.append(cmt_no)
			.append(", code_no=")
			.append(code_no)
			.append(", member_no=")
			.append(member_no)
			.append(", cmt_date=")
			.append(cmt_date)
			.append(", cmt_content=")
			.append(cmt_content);
		return builder.toString();
	}
	
	
}
