package kr.co.T2Market.login.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class AdminVO {
	private String admin_id;
	private String pass;
	private String name;
	private Date regdate;
	private Date updatedate;
	private char active;
	private String code_no;
	
	private List<AuthVO> authList;
	
}
