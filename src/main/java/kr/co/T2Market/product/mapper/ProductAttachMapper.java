package kr.co.T2Market.product.mapper;

import java.util.List;

import kr.co.T2Market.product.domain.ProductAttachVO;


public interface ProductAttachMapper {
	
public List<ProductAttachVO> findByCode(String product_no);
	
	public List<ProductAttachVO> getOldFiles(String product_no);
	
	public void insert(ProductAttachVO vo);
	
	public void delete(String uuid);
	
	public void deleteAll(String product_no);

}
