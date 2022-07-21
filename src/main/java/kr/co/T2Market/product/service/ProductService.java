package kr.co.T2Market.product.service;

import java.util.List;


import kr.co.T2Market.product.domain.PagingVO;
import kr.co.T2Market.product.domain.ProductAttachVO;
import kr.co.T2Market.product.domain.ProductVO;

public interface ProductService {
	
	public List<ProductVO> selectProduct(PagingVO vo);
	
	public int countProduct(PagingVO vo);
	
	public ProductVO readProduct (String product_no);
	
	public void register(ProductVO product);
	
	public void update(ProductVO product);
	
	public List<ProductAttachVO> getAttachList(String product_no);
	
	public List<ProductVO> codeSelect();
}
