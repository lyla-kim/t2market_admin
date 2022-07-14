package kr.co.T2Market.login.security;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.T2Market.login.domain.AdminVO;
import kr.co.T2Market.login.mapper.AdminLoginMapper;
import kr.co.T2Market.login.security.domain.CustomUser;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = @Autowired)
	private AdminLoginMapper adminMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		log.warn("check By id: "+username);
		
		AdminVO vo = adminMapper.read(username);
		
		log.warn("queried by admin mapper: "+vo);
		
		
		return vo == null ? null : new CustomUser(vo);
	}

}
