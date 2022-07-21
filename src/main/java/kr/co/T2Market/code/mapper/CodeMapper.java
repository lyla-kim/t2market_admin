package kr.co.T2Market.code.mapper;

import java.util.List;

import kr.co.T2Market.code.domain.CodeVO;
import kr.co.T2Market.code.domain.PagingVO;


public interface CodeMapper {
	public List<CodeVO> getCodeList();
	
	public void insertCode(CodeVO code);
	
	public void updateCode(CodeVO code);
	
	public CodeVO readCode(String code2);
	
	public int countCode(PagingVO vo);
	
	public List<CodeVO> selectCode(PagingVO vo);
	
}
