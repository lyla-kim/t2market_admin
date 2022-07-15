package kr.co.T2Market.code.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.T2Market.code.domain.CodeVO;
import kr.co.T2Market.code.domain.PagingVO;
import kr.co.T2Market.code.mapper.CodeMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CodeServiceImpl implements CodeService {
	
	private CodeMapper mapper;

	@Override
	public List<CodeVO> getList() {
		// TODO Auto-generated method stub
		log.info("get List...");
		return mapper.getList();
	}

	@Override
	public CodeVO get(String code2) {
		// TODO Auto-generated method stub
		log.info("get....."+code2);
		return mapper.read(code2);
	}

	@Override
	public boolean modify(CodeVO code) {
		// TODO Auto-generated method stub
		log.info("modify....."+code);
		return mapper.update(code) ==1;
		
	}

	@Override
	public void register(CodeVO code) {
		// TODO Auto-generated method stub
		log.info("register..."+code);
		mapper.insert(code);

	}
	
	@Override
	public int countCode() {
		
		log.info("countCode...."+mapper.countCode());
		return mapper.countCode();
	}
	
	@Override
	public List<CodeVO> getListWithPaging(PagingVO vo) {
		log.info("getListWithPaging...."+vo);
		return mapper.selectCode(vo);
	}

}
