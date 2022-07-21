package kr.co.T2Market.code.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CodeVO {
	private String code_no;
	private String code1;
	private String code1_name;
	private String code2;
	private String code2_name;
	private String code3;
	private String code3_name;
	private String bigo;
	private Date regdate;
	private Date updatedate;
	private String active;
}
