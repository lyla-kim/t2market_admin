package kr.co.T2Market.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.T2Market.board.domain.PagingVO;
import kr.co.T2Market.board.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public List<ReplyVO> read(String qna_no);
	
	public int delete(ReplyVO vo);
	
	public int update(ReplyVO reply);
	
	public ReplyVO selectReply(String answer_no);
	
	public int countReply();
	
	public List<ReplyVO> getListWithPaging(
			@Param("pag") PagingVO pag,
			@Param("qna_no") String qna_no);

}
