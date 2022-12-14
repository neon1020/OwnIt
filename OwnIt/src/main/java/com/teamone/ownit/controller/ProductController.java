package com.teamone.ownit.controller;

import java.io.IOException;
import java.util.*;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.CommonDataSource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.CommonAnnotationBeanPostProcessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CommonsLogWriter;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.filter.CommonsRequestLoggingFilter;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.teamone.ownit.service.ProductService;
import com.teamone.ownit.vo.*;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService service;

	@GetMapping(value = "product_list")
	public String product_list(Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
//		String sId = "test1@naver.com";
		List<ProductVO> productList = service.getProductList(sId);
//		System.out.println(productList);
		int cnt = 0;
		for(ProductVO product : productList) cnt++;
		model.addAttribute("productList", productList);
		model.addAttribute("cnt", cnt);
		return "product/product_list";
	}
	
	@GetMapping(value = "order_complete")
	public String complete() {
		return "product/product_order_complete";
	}
	
	@PostMapping(value = "listProductByCategory")
	@ResponseBody
	public void listProduct(String categories, HttpServletResponse response, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
//		String sId = "test1@naver.com";
//		System.out.println(categories);
		String[] divideCategory = categories.split("/");
		List<String> brands = new ArrayList<String>();
		String category = "";
		String productListing = "";
		for(String str : divideCategory) {
			if(str.contains("brand")) {
				if(str.split(":")[1].equals("ETC")) {
//					System.out.println("들어옴");
					brands.add("BANG&OLUFSEN");
					brands.add("LENOVO");
					brands.add("MARSHALL");
					brands.add("XIAOMI");
				} else {
					brands.add(str.split(":")[1]);
				}
			} else if(str.contains("category")) {
				category = str.split(":")[1];
			} else if(str.contains("productListing")) {
				productListing = str.split(":")[1];
			}
		}
//			System.out.println(brands+", "+category+", "+ productListing);
		List<ProductVO> productList = service.getCategorisedProduct(sId, brands, category, productListing);
		JSONArray jsonArray = new JSONArray();
		for(ProductVO product : productList) {
			JSONObject jsonObject = new JSONObject(product);
			jsonArray.put(jsonObject);
		}
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonArray);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@PostMapping(value = "addAndRemoveLikeList")
	@ResponseBody
	public String addLikeList(HttpSession session, int product_idx) {
		String sId = (String)session.getAttribute("sId");
//		System.out.println(product_idx);
//		String sId = "test1@naver.com";
		if(sId.length() != 0) {
			int ischecked = service.checkLike(sId, product_idx);
			if(ischecked == 0) {
				int insertCount = service.addLike(sId, product_idx);
				if(insertCount == 0) {
//					System.out.println("위시리스트 추가 실패 : " + sId + " , " + product_idx);
				}
			} else {
				System.out.println("삭제할 번호 : " + product_idx);
				int deleteCount = service.deleteLike(sId, product_idx);
				if(deleteCount == 0) {
//					System.out.println("위시리스트 삭제 실패 : " + sId + " , " + product_idx);
				}
			}
		}
		return product_idx + "";
	}

	@GetMapping(value = "addCart", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String addCart(HttpSession session, int product_idx) {
		String sId = (String)session.getAttribute("sId");
//		System.out.println(product_idx);
//		String sId = "test1@naver.com";
		if(sId.length() != 0) {
			int isContained = service.isContainedInCart(sId, product_idx);
			if(isContained > 0) {
				return "Check Cart";
			} else {
				int insertCount = service.addToCart(sId, product_idx);
				if(insertCount > 0) {
//					System.out.println("장바구니에 추가됨");
				}
				return "Added";
			}
		}
		return null;
	}

	@PostMapping(value = "checkCart", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public void checkCart(HttpSession session, HttpServletResponse response) {
		String sId = (String)session.getAttribute("sId");
		List<CartVO> cart = null;
//		String sId = "test1@naver.com";
		if(sId.length() != 0) {
			cart = service.checkCart(sId);
			JSONArray jsonArray = new JSONArray();
			
			for(CartVO c : cart) {
				JSONObject jsonObject = new JSONObject(c);
				jsonArray.put(jsonObject);
			}
//			System.out.println(cart);
			try {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print(jsonArray);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@GetMapping(value = "viewMyCart")
	public String viewMyCart(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		List<CartVO> cart = null;
//		String sId = "test1@naver.com";
		if(sId.length() != 0) {
			cart = service.checkCart(sId);
			model.addAttribute("cart", cart);
//			System.out.println(cart);
		}
		return "order/order_cart";
	}
	
	@PostMapping(value = "delAndReloadCart")
	@ResponseBody
	public void deleteCart(HttpSession session, HttpServletResponse response, int product_idx) {
		String sId = (String)session.getAttribute("sId");
		List<CartVO> cart = null;
//		String sId = "test1@naver.com";
		if(sId.length() != 0) {
		    service.deleteCart(sId, product_idx);
			cart = service.checkCart(sId);
			JSONArray jsonArray = new JSONArray();
			
			for(CartVO c : cart) {
				JSONObject jsonObject = new JSONObject(c);
				jsonArray.put(jsonObject);
			}
			try {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print(jsonArray);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@PostMapping(value = "deleteAllCart")
	@ResponseBody
	public void deleteAllCart(HttpSession session) {
		String sId = (String)session.getAttribute("sId");
//		String sId = "test1@naver.com";
		if(sId.length() != 0) {
			service.deleteAllCart(sId);
		}
	}
	
	@PostMapping(value = "updateCartCount")
	@ResponseBody
	public void updateCartCount(HttpSession session, HttpServletResponse response, int product_idx, int cart_count) {
		String sId = (String)session.getAttribute("sId");
		List<CartVO> cart = null;
//		System.out.println(product_idx);
//		System.out.println(cart_count);
//		String sId = "test1@naver.com";
		if(sId.length() != 0) {
			int leftCnt = service.selectCartCount(product_idx);
			if(leftCnt >= cart_count) {
				int updateCount = service.updateCartCount(sId, product_idx, cart_count);
				if(updateCount > 0) {
					cart = service.checkCart(sId);
//					System.out.println(cart);
					JSONArray jsonArray = new JSONArray();
					
					for(CartVO c : cart) {
						JSONObject jsonObject = new JSONObject(c);
						jsonArray.put(jsonObject);
					}
					try {
						response.setCharacterEncoding("UTF-8");
						response.getWriter().print(jsonArray);
					} catch (IOException e) {
						e.printStackTrace();
					}
				} 
			} else {
				try {
					String err = "{\"err\": \"구매가능 갯수초과\"}";
					JSONObject jsonObject = new JSONObject(err);
					response.setCharacterEncoding("UTF-8");
					response.getWriter().print(jsonObject);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@PostMapping(value = "listToMain")
	@ResponseBody
	public void listToMain(HttpServletResponse response) {
		List<ProductVO> productList = service.getListToMain();
		JSONArray jsonArray = new JSONArray();
		for(ProductVO product : productList) {
			JSONObject jsonObject = new JSONObject(product);
			jsonArray.put(jsonObject);
		}
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonArray);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping(value = "loadCart")
	public void loadCart(HttpSession session, HttpServletResponse response) {
		String sId = (String)session.getAttribute("sId");
		List<CartVO> cart = null;
		if(sId.length() != 0) {
			cart = service.checkCart(sId);
			JSONArray jsonArray = new JSONArray();
			for(CartVO c : cart) {
				JSONObject jsonObject = new JSONObject(c);
				jsonArray.put(jsonObject);
			}
			try {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print(jsonArray);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
		
// 박주닮

	@GetMapping(value = "product_detail")
	public ModelAndView product_detail(@RequestParam(defaultValue = "0") int product_idx, HttpSession session,
            @RequestParam(defaultValue = "1") int pageNum2,
            @RequestParam(defaultValue = "") String keyword) {
		String heartImg = "like_none.jpg";
		int member_idx = 0;
		if(session.getAttribute("sId") != null) {
			member_idx = (int)session.getAttribute("sIdx");
		}
		ModelAndView mav = new ModelAndView("product/product_detail");
		int listLimit = 8, pageListLimit = 10, startRow = (pageNum2 - 1) * listLimit;
		// 상품 정보
		ProductVO product = service.productDetail(product_idx);
		// 관심상품에 담은 총갯수
		int wishCount = service.selectWishCount(product_idx);
		// 상품에 대한 리뷰 목록
		List<Product_ReviewListVO> reviewList = service.getReviewList(product_idx, startRow, listLimit,keyword);
		// 관심상품에 존재유무(혜지)
		int isContainedInWish = service.isContainedInWish(member_idx, product_idx);
		int listCount = service.getReviewListCount(product_idx);
		int maxPage = (int) Math.ceil((double) listCount / listLimit);
		int startPage = (pageNum2 - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		Product_DetailPageInfoVO pageInfo = new Product_DetailPageInfoVO(pageNum2, listLimit, listCount, pageListLimit,
				maxPage, startPage, endPage);
		
		if(reviewList != null) { // 상품에 대한 리뷰리스트가 존재할 경우에 실행
			mav.addObject("reviewList", reviewList); //리뷰목록
			mav.addObject("pageInfo", pageInfo);	 //리뷰 페이징
			for(int i = 0; i < reviewList.size(); i++) {
					
				//각 리뷰에 대한 좋아요 member_idx 추출
				List<Integer> memberLikeList = service.getLikeMemberList(reviewList.get(i).getReview_idx());
				if(memberLikeList.contains(member_idx)) { // 사용자가 좋아요를 누른 리뷰일 시 image 변경
					reviewList.get(i).setHeartImg("like2.jpg");
				}else {
					reviewList.get(i).setHeartImg(heartImg);
				}
			}
		}
		
		mav.addObject("listCount", listCount);   //상품리뷰갯수
		mav.addObject("wishCount", wishCount);	 //상품관심갯수
		mav.addObject("isContainedInWish", isContainedInWish);	 //관심상품에 존재유무(혜지)
		mav.addObject("product", product);		 //상품정보
		return mav;
	}
	
	
	// 상품 상세 하단 리뷰 Ajax 리스트&페이징 처리
	@GetMapping(value = "reviewChange", produces = "application/json; charset=utf8")
	public void reviewChange(Model model, HttpServletResponse response, HttpSession session,
			@RequestParam(defaultValue = "0") int product_idx, 
	        @RequestParam(defaultValue = "1") int pageNum2,
	        @RequestParam(defaultValue = "") String keyword) {
		int member_idx = 0;
		if(session.getAttribute("sId") != null) {
			member_idx = (int)session.getAttribute("sIdx");
		}
		int listLimit = 8, pageListLimit = 10, startRow = (pageNum2 - 1) * listLimit;
		
		// 상품에 대한 리뷰 목록
		List<Product_ReviewListVO> reviewList = service.getReviewList(product_idx, startRow, listLimit,keyword);
		int listCount = service.getReviewListCount(product_idx);
		
		String heartImg = "like_none.jpg";
		if(reviewList.get(0).getReview_idx() > 0) { // 상품에 대한 리뷰리스트가 존재할 경우에 실행
			for(int i = 0; i < reviewList.size(); i++) {
					
				//각 리뷰에 대한 좋아요 member_idx 추출
				List<Integer> memberLikeList = service.getLikeMemberList(reviewList.get(i).getReview_idx());
				if(memberLikeList.contains(member_idx)) { // 사용자가 좋아요를 누른 리뷰일 시 image 변경
					reviewList.get(i).setHeartImg("like2.jpg");
				}else {
					reviewList.get(i).setHeartImg(heartImg);
				}
			}
		}
		
		int maxPage = (int) Math.ceil((double) listCount / listLimit);
		int startPage = (pageNum2 - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		Product_DetailPageInfoVO pageInfo = new Product_DetailPageInfoVO(pageNum2, listLimit, listCount, pageListLimit,
				maxPage, startPage, endPage);

			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObjectpage = new JSONObject(pageInfo);
			jsonArray.put(jsonObjectpage);
			for(Product_ReviewListVO review : reviewList) {
				JSONObject jsonObject = new JSONObject(review);
				jsonArray.put(jsonObject);
			}
				response.setCharacterEncoding("UTF-8");
				try {
					response.getWriter().print(jsonArray);
				} catch (IOException e) {
					e.printStackTrace();
				}
	}


	//리뷰 좋아요
	@ResponseBody
	@GetMapping(value = "heartChange" ,produces = "application/json")
	public Product_ReviewListVO heartChange(@RequestParam int review_idx,@RequestParam String heartImg, @RequestParam int style_like_count, HttpSession session, HttpServletResponse response) {
		int member_idx = 0;
		if(session.getAttribute("sId") != null) {
			member_idx = (int)session.getAttribute("sIdx");
		}
		
		if(member_idx > 0) { // 로그인 중일경우에만 실행
			// 좋아요를 누른 member일시
			if(heartImg.equals("like2.jpg")) {
				service.deleteReviewLike(member_idx,review_idx);
				style_like_count -= 1;
				heartImg = "like_none.jpg";
			} else {//안누른 member일시
				service.insertReviewLike(member_idx,review_idx);
				style_like_count += 1;
				heartImg = "like2.jpg";
			}
			Product_ReviewListVO review = new Product_ReviewListVO();
			review.setHeartImg(heartImg);
			review.setStyle_like_count(style_like_count);
			
			return review;
		}
		
		return null;
	}

}