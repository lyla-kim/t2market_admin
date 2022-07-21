package kr.co.T2Market.admin.service;

import java.util.List;

import kr.co.T2Market.admin.domain.Admin_InfoVO;
import kr.co.T2Market.product.domain.ProductVO;

public interface Admin_InfoService {

	public void registerAdmin(Admin_InfoVO admin);
	
	public int getId(String id);
	
	public void unusedAdmin(String admin_id);
	
	public List<Admin_InfoVO> codeSelect();
}
