package kr.co.T2Market.code.service;

import java.util.List;

import kr.co.T2Market.code.domain.CodeVO;

public interface CodeService {
	public List<CodeVO> getList();
	
	public CodeVO get (String code2);
	
	public boolean modify (CodeVO code);
	
	public void register (CodeVO code);

}
