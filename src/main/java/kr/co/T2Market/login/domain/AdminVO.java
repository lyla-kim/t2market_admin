package kr.co.T2Market.login.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class AdminVO {
	private String adminid;
	private String adminpw;
	private String adminName;
	private Date regdate;
	private Date updatedate;
	private boolean active;
	
	private List<AuthVO> authList;
	
}
