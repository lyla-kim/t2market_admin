package kr.co.T2Market.admin.mapper;

import java.util.List;

import kr.co.T2Market.admin.domain.Admin_InfoVO;
import kr.co.T2Market.product.domain.ProductVO;

public interface Admin_InfoMapper {

	public void insertAdmin(Admin_InfoVO admin);
	
	public int getId(String id);
	
	public void unusedAdmin(String admin_id);
	
	public List<Admin_InfoVO> codeSelect();
}
