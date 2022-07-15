package kr.co.T2Market.reciept.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.T2Market.reciept.domain.PagingVO;
import kr.co.T2Market.reciept.domain.RecieptAdminVO;
import kr.co.T2Market.reciept.mapper.RecieptAdminMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RecieptAdminServiceImpl implements RecieptAdminService {

	@Setter(onMethod_ = @Autowired)
	private RecieptAdminMapper mapper;
	
	@Override
	public List<RecieptAdminVO> recieptList() {
		// TODO Auto-generated method stub
		List<RecieptAdminVO> list = mapper.recieptList();
		log.info("reciept list...."+list);
		
		return list;
	}

	@Override
	// 게시물 총 갯수
	public int countReciept(PagingVO vo) {
		log.info("countReciept....");
		return mapper.countReciept(vo);
	};
		
	@Override
	// 페이징 처리 게시글 조회
	public List<RecieptAdminVO> selectReciept(PagingVO vo){
		log.info("selectReciept....");
		return mapper.selectReciept(vo);
	};
	
	@Override
	public RecieptAdminVO recieptRead(String detail_no) {
		return mapper.recieptRead(detail_no);
	}
	
	@Override
	public void recieptUpdate(RecieptAdminVO vo) {
		mapper.recieptUpdate(vo);
	}
}
