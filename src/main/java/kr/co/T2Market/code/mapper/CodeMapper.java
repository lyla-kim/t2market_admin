package kr.co.T2Market.code.mapper;

import java.util.List;

import kr.co.T2Market.code.domain.CodeVO;

public interface CodeMapper {
	public List<CodeVO> getList();
	
	public void insert(CodeVO code);
	
	public int update(CodeVO code);
	
	public CodeVO read(String code2);

}
