package co.kr.T2Market.login.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.T2Market.login.domain.AdminVO;
import kr.co.T2Market.login.mapper.AdminLoginMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MemberMapperTests {

	@Setter(onMethod_ = @Autowired)
	private AdminLoginMapper mapper;
	
	@Test
	public void testRead() {
		AdminVO vo = mapper.read("idle918");
		
		log.info(vo);
		
		vo.getAuthList().forEach(authVO -> log.info(authVO));
	}
}
