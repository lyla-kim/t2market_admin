package kr.co.T2Market.login.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.co.T2Market.login.domain.AdminVO;
import lombok.Getter;

@Getter
public class CustomAdmin extends User {

private static final long serialVersionUID = 1L;
	
	private AdminVO admin;
	
	public CustomAdmin(String username, String password, Collection<? extends GrantedAuthority> authorities ) {
		super(username, password, authorities);
	}
	
	public CustomAdmin(AdminVO vo) {
		super(vo.getAdmin_id(), vo.getPass(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getCode2())).collect(Collectors.toList()));
		
		this.admin = vo;
	}
}
