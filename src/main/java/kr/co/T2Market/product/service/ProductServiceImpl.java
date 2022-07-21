package kr.co.T2Market.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.T2Market.product.domain.PagingVO;
import kr.co.T2Market.product.domain.ProductAttachVO;
import kr.co.T2Market.product.domain.ProductVO;
import kr.co.T2Market.product.mapper.ProductAttachMapper;
import kr.co.T2Market.product.mapper.ProductMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ProductServiceImpl implements ProductService {

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private ProductAttachMapper attachMapper;
	
	
	@Override
	public List<ProductVO> selectProduct(PagingVO vo) {
		// TODO Auto-generated method stub
		log.info("selectProduct...");
		return mapper.selectProduct(vo);
	}

	@Override
	public int countProduct(PagingVO vo) {
		// TODO Auto-generated method stub
		log.info("countProduct...");
		return mapper.countProduct(vo);
	}

	@Override
	public ProductVO readProduct(String product_no) {
		// TODO Auto-generated method stub
		log.info("readProduct: "+product_no);
		return mapper.readProduct(product_no);
	}
	
	@Transactional
	@Override
	public void register(ProductVO product) {
		// TODO Auto-generated method stub
		log.info("register: "+product);

		mapper.insertProduct(product);
		
		if(product.getAttachList() == null || product.getAttachList().size()<0) {
			return;
		}
		
		product.getAttachList().forEach(attach -> {
			attach.setProduct_no(product.getProduct_no());
			
			attachMapper.insert(attach);
		});
	}

	@Transactional
	@Override
	public void update(ProductVO product) {
		// TODO Auto-generated method stub
		log.info("update: "+product);
		
		attachMapper.deleteAll(product.getProduct_no());
		
		mapper.updateProduct(product);
		
		if(product.getAttachList() != null) {
			if(product.getAttachList().size()>0) {
				product.getAttachList().forEach(attach -> {
					attach.setProduct_no(product.getProduct_no());
					attachMapper.insert(attach);
				});
			}
		}
	}
	
	@Override
	public List<ProductAttachVO> getAttachList(String product_no){
		log.info("get attachList by product_no: "+product_no);
		return attachMapper.findByCode(product_no);
	}
	
	@Override
	public List<ProductVO> codeSelect(){
		log.info("code Select...");
		
		return mapper.codeSelect();
	}

}
