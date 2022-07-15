package kr.co.T2Market.reciept.mapper;

import java.util.List;

import kr.co.T2Market.reciept.domain.PagingVO;
import kr.co.T2Market.reciept.domain.RecieptAdminVO;

public interface RecieptAdminMapper {

	public List<RecieptAdminVO> recieptList();
	
	// 게시물 총 갯수
	public int countReciept();
	
	// 페이징 처리 게시글 조회
	public List<RecieptAdminVO> selectReciept(PagingVO vo);
}
