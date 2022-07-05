package kr.co.T2Market.login.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
/*
import kr.co.team2market.domain.MemberVO;
import kr.co.team2market.mapper.MemberMapper;
import kr.co.team2market.security.domain.CustomUser;
*/
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}
	/*
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		log.warn("Load User By UserName : " +username);
		
		MemberVO vo = memberMapper.read(username);
		
		log.warn("queried by member mapper:"+vo);
		
		return vo ==  null ? null : new CustomUser(vo);
	}
	*/

}
