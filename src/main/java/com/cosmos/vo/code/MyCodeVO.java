package com.cosmos.vo.code;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class MyCodeVO extends CodeVO {
	private String quiz_title;
	private String quiz_url;
	private String sg_name;
}
