package co.kr.T2Market.login.security;

import static org.hamcrest.CoreMatchers.nullValue;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberTests {
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwdEncoder;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	@Test
	public void testInsertMember() {
		String sql ="insert into admin_info(admin_id, pass, name, code1, code2) values (?, ?, ?, 20000, 20100)";
		
		for(int i=10; i<20;i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "admin"+i);
				pstmt.setString(2, pwdEncoder.encode("pw"+i));
				pstmt.setString(3, "관리자"+i);
				
				
				pstmt.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
		}finally {
			if(pstmt!= null) {try {pstmt.close();}catch(Exception e) {}}
			if(con != null) {try {con.close();}catch(Exception e) {}}
			}
		}

	}
	
//	@Test
//	public void testInsertAuth() {
//		String sql = "insert into admin_info(admin_id, pass, name, code1, code2) values (?, ?, ?, 20000, 20100)";
//		
//		for(int i=0; i<10;i++) {
//			Connection con = null;
//			PreparedStatement pstmt = null;
//			try {
//				con = ds.getConnection();
//				pstmt = con.prepareStatement(sql);
//				
//					pstmt.setString(1, "admin"+i);
//					pstmt.setString(2, "123123");
//					pstmt.setString(3, "관리자"+i);
//				
//				pstmt.executeUpdate();
//			}catch(Exception e){
//				e.printStackTrace();
//		}finally {
//			if(pstmt!= null) {try {pstmt.close();}catch(Exception e) {}}
//			if(con != null) {try {con.close();}catch(Exception e) {}}
//			}
//		}
//
//	}
		
}
	

