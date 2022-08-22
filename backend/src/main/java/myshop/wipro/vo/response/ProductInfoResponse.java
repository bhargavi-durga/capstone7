package myshop.wipro.vo.response;

import java.util.List;

import myshop.wipro.entity.ProductInfo;

public class ProductInfoResponse {
	
	private List<ProductInfo> productList;

	public List<ProductInfo> getProductList() {
		return productList;
	}

	public void setProductList(List<ProductInfo> productList) {
		this.productList = productList;
	}
	

}
