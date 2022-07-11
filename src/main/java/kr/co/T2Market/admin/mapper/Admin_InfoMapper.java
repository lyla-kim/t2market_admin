package kr.co.T2Market.admin.mapper;

import kr.co.T2Market.admin.domain.Admin_InfoVO;

public interface Admin_InfoMapper {

	public void insertAdmin(Admin_InfoVO admin);
	
	public int getId(String id);
	
	public void unusedAdmin(String admin_id);
}
