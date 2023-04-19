package com.cosmos.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class StudyGroupVO {
	private int sg_no;
	private String sg_name;
	private int sg_manager;
	private int sg_max;
	private String sg_lang;
	private Date sg_created;
	private String sg_info;
	private String manager_name;

} // 230418 영선
