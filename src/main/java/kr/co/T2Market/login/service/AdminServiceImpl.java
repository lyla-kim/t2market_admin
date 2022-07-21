package kr.co.T2Market.login.service;

import org.springframework.stereotype.Service;

import kr.co.T2Market.login.domain.AdminVO;
import kr.co.T2Market.login.mapper.AdminMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {

	private AdminMapper mapper;
	
	@Override
	public AdminVO login(AdminVO vo) {
		// TODO Auto-generated method stub
		return mapper.login(vo);
	}

}
