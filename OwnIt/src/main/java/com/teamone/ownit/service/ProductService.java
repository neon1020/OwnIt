package com.teamone.ownit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.ProductMapper;
import com.teamone.ownit.vo.CartVO;
import com.teamone.ownit.vo.ImageVO;
import com.teamone.ownit.vo.ProductVO;
import com.teamone.ownit.vo.Product_ReviewListVO;
import com.teamone.ownit.vo.ReviewListVO;
import com.teamone.ownit.vo.WishlistVO;

@Service
public class ProductService {
	@Autowired
	private ProductMapper mapper;
	// 상품목록 조회
	public List<ProductVO> getProductList(String sId) {
//		System.out.println("ProductService - getProductList()");
		return mapper.getProductList(sId);
	}

	public List<ProductVO> getCategorisedProduct(String sId, List<String> brands, String category, String productListing) {
//		System.out.println("getCategorisedProduct()");
		return mapper.getCategorisedProduct(sId, brands, category, productListing);
	}

	public int checkLike(String sId, int product_idx) {
//		System.out.println("checkLike()");
		return mapper.checkLike(sId, product_idx);
	}

	public int addLike(String sId, int product_idx) {
//		System.out.println("addLike()");
		return mapper.addLike(sId, product_idx);
	}

	public int deleteLike(String sId, int product_idx) {
//		System.out.println("deleteLike()");
		return mapper.deleteLike(sId, product_idx);
	}

	public int isContainedInCart(String sId, int product_idx) {
//		System.out.println("isContainedInCart()");
		return mapper.isContainedInCart(sId, product_idx);
	}

	public int addToCart(String sId, int product_idx) {
//		System.out.println("addToCart()");
		return mapper.addToCart(sId, product_idx);
	}

	public List<CartVO> checkCart(String sId) {
		return mapper.checkCart(sId);
	}

	public int deleteCart(String sId, int product_idx) {
		return mapper.deleteCart(sId, product_idx);
	}

	public int deleteAllCart(String sId) {
		return mapper.deleteAllCart(sId);
	}

	public int updateCartCount(String sId, int product_idx, int cart_count) {
//		System.out.println("updateCartCount()");
		return mapper.updateCartCount(sId, product_idx, cart_count);
	}

	public int selectCartCount(int product_idx) {
//		System.out.println("selectCartCount()");
		return mapper.selectCartCount(product_idx);
	}

	public List<ProductVO> getListToMain() {
		return mapper.getListToMain();
	}

// 박주닮
	public ProductVO productDetail(int product_idx) {
		return mapper.productDetail(product_idx);
	}
	//리뷰 목록
	public List<Product_ReviewListVO> getReviewList(int product_idx, int startRow, int listLimit, String keyword) {
		return mapper.selectReviewList(product_idx, startRow,listLimit,keyword);
	}

	public int getReviewListCount(int product_idx) {
		return mapper.selectReviewListCount(product_idx);
	}

	public int selectWishCount(int product_idx) {
		return mapper.selectWishCount(product_idx);
	}

	public int getStyleLike(int review_idx) {
		return mapper.selectStyleCount(review_idx);
	}

	public List<Integer> getLikeMemberList(int review_idx) {
		return mapper.getLikeMemberList(review_idx);
	}

	public void deleteReviewLike(int member_idx, int review_idx) {
		mapper.deleteReviewLike(member_idx,review_idx);
	}

	public void insertReviewLike(int member_idx, int review_idx) {
		mapper.insertReviewLike(member_idx,review_idx);
	}

	// 관심상품에 존재유무(혜지)
	public int isContainedInWish(int member_idx, int product_idx) {
		return mapper.isContainedInWish(member_idx, product_idx);
	}

}
