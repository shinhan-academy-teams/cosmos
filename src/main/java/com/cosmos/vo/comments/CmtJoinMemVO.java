package com.cosmos.vo.comments;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CmtJoinMemVO extends CommentsVO {
	private String member_name;

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append(super.toString())
			.append(",\"member_name\":")
			.append("\""+member_name+"\"}");
		return builder.toString();
	}
	
}
