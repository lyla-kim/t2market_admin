package kr.co.T2Market.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.T2Market.admin.domain.Admin_InfoVO;
import kr.co.T2Market.admin.mapper.Admin_InfoMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class Admin_InfoServiceImpl implements Admin_InfoService {

	@Setter(onMethod_ = @Autowired)
	private Admin_InfoMapper adminMapper;
	
	@Override
	public void registerAdmin(Admin_InfoVO admin) {
		// TODO Auto-generated method stub

		log.info("register........"+admin);
		adminMapper.insertAdmin(admin);
	}

	@Override
	public int getId(String id) {
		return adminMapper.getId(id);
	}
	
	@Override
	public void unusedAdmin(String admin_id) {
		log.info("unused........"+admin_id);
		adminMapper.unusedAdmin(admin_id);
	}
}
