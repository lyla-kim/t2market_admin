package kr.co.T2Market.product.mapper;

import java.util.List;

import kr.co.T2Market.product.domain.PagingVO;
import kr.co.T2Market.product.domain.ProductVO;

public interface ProductMapper {
	
	public List<ProductVO> selectProduct(PagingVO vo);
	
	public void insertProduct(ProductVO product);
	
	public void updateProduct(ProductVO product);
	
	public ProductVO readProduct(String product_no);
	
	public int countProduct(PagingVO vo);
	
	public List<ProductVO> codeSelect();

}
