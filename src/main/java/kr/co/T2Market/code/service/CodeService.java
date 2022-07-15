package kr.co.T2Market.code.service;

import java.util.List;

import kr.co.T2Market.code.domain.CodeVO;
import kr.co.T2Market.code.domain.PagingVO;

public interface CodeService {
	public List<CodeVO> getList();
	
	public CodeVO get (String code2);
	
	public boolean modify (CodeVO code);
	
	public void register (CodeVO code);
	
	public int countCode();
	
	public List<CodeVO> getListWithPaging(PagingVO vo);

}
