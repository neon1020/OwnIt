package com.teamone.ownit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.teamone.ownit.vo.CartVO;
import com.teamone.ownit.vo.ImageVO;
import com.teamone.ownit.vo.ProductVO;
import com.teamone.ownit.vo.ReviewListVO;
import com.teamone.ownit.vo.WishlistVO;

public interface ProductMapper {
	// 상품목록 조회
	List<ProductVO> getProductList(String sId); 

	// 이미지 조회
	List<ImageVO> selectImage(List<ProductVO> productList); 
	
	// 상품 카테고리에 따른 상품목록 조회(휴대폰, 태블릿...)
	List<ProductVO> getCategorisedProduct(@Param("id")String id, @Param("sId")String sId); 

	// 상품 카테고리에 따른 상품목록 조회(인기순, 가격순...)
	List<ProductVO> arrayByCategory(@Param("id")String id, @Param("sId")String sId);

	// 위시리스트 추가 여부 확인
	int checkLike(@Param("sId")String sId, @Param("product_idx")int product_idx);

	// 위시리스트 추가 작업
	int addLike(@Param("sId")String sId, @Param("product_idx")int product_idx);

	// 위시리스트 삭제 작업
	int deleteLike(@Param("sId")String sId, @Param("product_idx")int product_idx);

	// 장바구니에 추가돼있는 상품인지 조회
	int isContainedInCart(@Param("sId")String sId, @Param("product_idx")int product_idx);

	// 장바구니에 추가돼있지 않은 상품 추가 작업
	int addToCart(@Param("sId")String sId, @Param("product_idx")int product_idx);

	// 장바구니 조회
	List<CartVO> checkCart(@Param("sId")String sId);

	// 장바구니 항목삭제
	int deleteCart(@Param("sId")String sId, @Param("product_idx")int product_idx);






































































	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
// 박주닮 501

	// 한 상품에 대한 상세정보
	ProductVO productDetail(@Param("product_idx") int product_idx);
	// 상품 상세정보 리뷰리스트
	List<ReviewListVO> selectReviewList(@Param("product_idx") int product_idx, 
										@Param("startRow") int startRow,
										@Param("listLimit") int listLimit, 
										@Param("keyword") String keyword);

	int selectReviewListCount(@Param("product_idx") int product_idx);

	int selectWishCount(@Param("product_idx") int product_idx);


	

	
								

	

	

	

	

	

	

	

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
























































	
	
	
	
	
	
	
	
	
	
	
	

	
	
}