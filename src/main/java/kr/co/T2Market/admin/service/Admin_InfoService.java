package kr.co.T2Market.admin.service;

import kr.co.T2Market.admin.domain.Admin_InfoVO;

public interface Admin_InfoService {

	public void registerAdmin(Admin_InfoVO admin);
	
	public int getId(String id);
	
	public void unusedAdmin(String admin_id);
}
