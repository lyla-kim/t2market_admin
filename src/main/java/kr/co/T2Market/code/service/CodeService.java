package kr.co.T2Market.code.service;

import java.util.List;

import kr.co.T2Market.code.domain.CodeVO;
import kr.co.T2Market.code.domain.PagingVO;

public interface CodeService {
	
	public List<CodeVO> codeList();
	
	public void register(CodeVO code);
	
	public int countCode(PagingVO vo);
	
	public List<CodeVO> selectCode(PagingVO vo);
	
	public CodeVO readCode(String code_no);
	
	public void updateCode (CodeVO code);

}
