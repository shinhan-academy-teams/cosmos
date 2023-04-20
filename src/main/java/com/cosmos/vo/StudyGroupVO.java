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
	private int sg_max; // 최대 모집 인원
	private String sg_lang; // 사용 언어
	private Date sg_created;
	private String sg_info; // 스터디 소개글
	private String manager_name;
	private int sg_cur; // 현재 참여 인원

} // 230418 영선
