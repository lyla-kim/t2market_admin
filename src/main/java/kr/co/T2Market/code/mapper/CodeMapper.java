package kr.co.T2Market.code.mapper;

import java.util.List;

import kr.co.T2Market.code.domain.CodeVO;
import kr.co.T2Market.code.domain.PagingVO;

public interface CodeMapper {
	public List<CodeVO> getList();
	
	public void insert(CodeVO code);
	
	public int update(CodeVO code);
	
	public CodeVO read(String code2);
	
	// 게시물 총 갯수
	public int countCode();
		
	// 페이징 처리 게시글 조회
	public List<CodeVO> selectCode(PagingVO vo);

}
