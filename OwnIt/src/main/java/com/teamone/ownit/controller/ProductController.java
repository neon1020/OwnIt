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
//		String sId = (String)session.getAttribute("sId");
		String sId = "test1@naver.com";
		if(sId.length() != 0) {
			List<ProductVO> productList = service.getProductList(sId);
	//		System.out.println(productList);
			int cnt = 0;
			for(ProductVO product : productList) cnt++;
			model.addAttribute("productList", productList);
			model.addAttribute("cnt", cnt);
		}
		return "product/product_list";
	}
	
	@GetMapping(value = "order_complete")
	public String complete() {
		return "product/product_order_complete";
	}
	
	@PostMapping(value = "listProductByCategory")
	@ResponseBody
	public void listProduct(String categories, HttpServletResponse response, HttpSession session) {
//		String sId = (String)session.getAttribute("sId");
		String sId = "test1@naver.com";
		if(sId.length() != 0) {
//			System.out.println(categories);
			String[] divideCategory = categories.split("/");
			List<String> brands = new ArrayList<String>();
			String category = "";
			String productListing = "";
			for(String str : divideCategory) {
				if(str.contains("brand")) {
					if(str.split(":")[1].equals("ETC")) {
						System.out.println("들어옴");
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
	}

	@PostMapping(value = "addAndRemoveLikeList")
	@ResponseBody
	public String addLikeList(HttpSession session, int product_idx) {
//		String sId = (String)session.getAttribute("sId");
		System.out.println(product_idx);
		String sId = "test1@naver.com";
		if(sId.length() != 0) {
			int ischecked = service.checkLike(sId, product_idx);
			if(ischecked == 0) {
				int insertCount = service.addLike(sId, product_idx);
				if(insertCount == 0) {
					System.out.println("위시리스트 추가 실패 : " + sId + " , " + product_idx);
				}
			} else {
				System.out.println("삭제할 번호 : " + product_idx);
				int deleteCount = service.deleteLike(sId, product_idx);
				if(deleteCount == 0) {
					System.out.println("위시리스트 삭제 실패 : " + sId + " , " + product_idx);
				}
			}
		}
		return product_idx + "";
	}

	@GetMapping(value = "addCart", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String addCart(HttpSession session, int product_idx) {
//		String sId = (String)session.getAttribute("sId");
		System.out.println(product_idx);
		String sId = "test1@naver.com";
		if(sId.length() != 0) {
			int isContained = service.isContainedInCart(sId, product_idx);
			if(isContained > 0) {
				return "Check Cart";
			} else {
				int insertCount = service.addToCart(sId, product_idx);
				if(insertCount > 0) {
					System.out.println("장바구니에 추가됨");
				}
				return "Added";
			}
		}
		return null;
	}

	@PostMapping(value = "checkCart", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public void checkCart(HttpSession session, HttpServletResponse response) {
//		String sId = (String)session.getAttribute("sId");
		List<CartVO> cart = null;
		String sId = "test1@naver.com";
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
//		String sId = (String)session.getAttribute("sId");
		List<CartVO> cart = null;
		String sId = "test1@naver.com";
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
//		String sId = (String)session.getAttribute("sId");
		List<CartVO> cart = null;
		String sId = "test1@naver.com";
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
//		String sId = (String)session.getAttribute("sId");
		String sId = "test1@naver.com";
		if(sId.length() != 0) {
			service.deleteAllCart(sId);
		}
	}
	
	@PostMapping(value = "updateCartCount")
	@ResponseBody
	public void updateCartCount(HttpSession session, HttpServletResponse response, int product_idx, int cart_count) {
//		String sId = (String)session.getAttribute("sId");
		List<CartVO> cart = null;
//		System.out.println(product_idx);
//		System.out.println(cart_count);
		String sId = "test1@naver.com";
		if(sId.length() != 0) {
			int leftCnt = service.selectCartCount(product_idx);
			if(leftCnt >= cart_count) {
				int updateCount = service.updateCartCount(sId, product_idx, cart_count);
				if(updateCount > 0) {
					cart = service.checkCart(sId);
					System.out.println(cart);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
// 박주닮 (ajax 수정 전 주석 2022-11-24)
//	@GetMapping(value = "product_detail")
//	public String product_detail(@RequestParam(defaultValue = "0") int product_idx, Model model,
//								@RequestParam(defaultValue = "1") int pageNum2,
//								@RequestParam(defaultValue = "") String keyword,
//								HttpServletResponse response) {
//		System.out.println("페이지넘 : " +pageNum2);
//		System.out.println("컨트롤러 리뷰 키워드 : " + keyword + " product_idx : " + product_idx);
//		// 상품 정보
//		ProductVO product = service.productDetail(product_idx);
//		model.addAttribute("product", product);
//
//		// 관심상품에 담은 총갯수
//		int wishCount = service.selectWishCount(product_idx);
//		model.addAttribute("wishCount", wishCount);
//
//		// 페이징
//		int listLimit = 8;
//		int pageListLimit = 10;
//		int startRow = (pageNum2 - 1) * listLimit;
//		// 상품에 대한 리뷰 목록
//		List<Product_ReviewListVO> reviewList = service.getReviewList(product_idx, startRow, listLimit,keyword);
//		int listCount = service.getReviewListCount(product_idx);
//		if(reviewList.get(0).getReview_idx() > 0) { // 상품에 대한 리뷰리스트가 존재할 경우에 실행
//			// style 좋아요 갯수 조회
//			int styleLikeCount = 0;
//			System.out.println("styleLikeCountstyleLikeCount : " + styleLikeCount);
//			for(Product_ReviewListVO style : reviewList) {
//				//각 리뷰에 대한 좋아요 갯수
//				styleLikeCount = service.getStyleLike(style.getReview_idx()); 
//				style.setStyle_like_count(styleLikeCount);
//			}
//			System.out.println("styleLikeCountstyleLikeCount : " + styleLikeCount);
//		}
//		
//		// 상품에 대한 리뷰 갯수
//		model.addAttribute("listCount", listCount);
//
//		int maxPage = (int) Math.ceil((double) listCount / listLimit);
//		int startPage = (pageNum2 - 1) / pageListLimit * pageListLimit + 1;
//		int endPage = startPage + pageListLimit - 1;
//		if (endPage > maxPage) {
//			endPage = maxPage;
//		}
//		Product_DetailPageInfoVO pageInfo = new Product_DetailPageInfoVO(pageNum2, listLimit, listCount, pageListLimit,
//				maxPage, startPage, endPage);
//
//		model.addAttribute("reviewList", reviewList);
//		model.addAttribute("pageInfo", pageInfo);
//		
//		if(!keyword.equals("")) { //체크박스가 체크됐을때만 
//			JSONArray jsonArray = new JSONArray();
//			JSONObject jsonObjectpage = new JSONObject(pageInfo);
//			jsonArray.put(jsonObjectpage);
//			for(Product_ReviewListVO review : reviewList) {
//				JSONObject jsonObject = new JSONObject(review);
//				// 2. JSONObject 클래스 인스턴스 생성
//				//    => 파라미터 : VO 객체(Getter/Setter, 기본생성자 필요)
//				
//				// 3. JSONArray 객체의 put() 메서드를 호출하여 JSONObject 객체 추가
//				System.out.println(jsonObject);
//				jsonArray.put(jsonObject);
//			}
//			System.out.println("리스트제이슨어레이 : " + jsonArray);
//			System.out.println("페이지인포제이슨 : " + jsonObjectpage);
//				
//			try {
//				 응답 데이터를 직접 생성하여 웹페이지에 출력
//				 HttpSertvletResponse 객체의 getWriter() 메서드를 통해 PrintWriter 객체를 리턴받아
//				 해당 객체의 print() 메서드를 호출하여 응답데이터 출력
//				 => 단, 객체 데이터 출력 전 한글 인코딩 처리 필수!
//				response.setCharacterEncoding("UTF-8");
//				response.getWriter().print(jsonArray);
//				System.out.println("리턴");
//				return null;
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			
//		}
//		
//
//		return "product/product_detail";
//
//	}

	@GetMapping(value = "product_detail")
	public ModelAndView product_detail(@RequestParam(defaultValue = "0") int product_idx,
									   @RequestParam(defaultValue = "1") int pageNum2,
									   @RequestParam(defaultValue = "") String keyword) {
		ModelAndView mav = new ModelAndView("product/product_detail");
		int listLimit = 8, pageListLimit = 10, startRow = (pageNum2 - 1) * listLimit;
		// 상품 정보
		ProductVO product = service.productDetail(product_idx);
		// 관심상품에 담은 총갯수
		int wishCount = service.selectWishCount(product_idx);
		// 상품에 대한 리뷰 목록
		List<Product_ReviewListVO> reviewList = service.getReviewList(product_idx, startRow, listLimit,keyword);
		int listCount = service.getReviewListCount(product_idx);
		if(reviewList.get(0).getReview_idx() > 0) { // 상품에 대한 리뷰리스트가 존재할 경우에 실행
			// style 좋아요 갯수 조회
			int styleLikeCount = 0;
			for(Product_ReviewListVO style : reviewList) {
				//각 리뷰에 대한 좋아요 갯수 추출
				styleLikeCount = service.getStyleLike(style.getReview_idx()); 
				style.setStyle_like_count(styleLikeCount);
			}
			System.out.println("styleLikeCountstyleLikeCount : " + styleLikeCount);
		}
		int maxPage = (int) Math.ceil((double) listCount / listLimit);
		int startPage = (pageNum2 - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		Product_DetailPageInfoVO pageInfo = new Product_DetailPageInfoVO(pageNum2, listLimit, listCount, pageListLimit,
				maxPage, startPage, endPage);
		
		mav.addObject("listCount", listCount);   //상품리뷰갯수
		mav.addObject("wishCount", wishCount);	 //상품관심갯수
		mav.addObject("product", product);		 //상품정보
		mav.addObject("reviewList", reviewList); //리뷰목록
		mav.addObject("pageInfo", pageInfo);	 //페이징
		return mav;
	}
	
	
	// 상품 상세 하단 리뷰 Ajax 리스트&페이징 처리
	@GetMapping(value = "reviewChange", produces = "application/json; charset=utf8")
	public void reviewChange(Model model, HttpServletResponse response,@RequestParam(defaultValue = "0") int product_idx, 
																	   @RequestParam(defaultValue = "1") int pageNum2,
																	   @RequestParam(defaultValue = "") String keyword) {
		int listLimit = 8, pageListLimit = 10, startRow = (pageNum2 - 1) * listLimit;
		
		// 상품에 대한 리뷰 목록
		List<Product_ReviewListVO> reviewList = service.getReviewList(product_idx, startRow, listLimit,keyword);
		int listCount = service.getReviewListCount(product_idx);
		if(reviewList.get(0).getReview_idx() > 0) { // 상품에 대한 리뷰리스트가 존재할 경우에 실행
			// style 좋아요 갯수 조회
			int styleLikeCount = 0;
			for(Product_ReviewListVO style : reviewList) {
				//각 리뷰에 대한 좋아요 갯수
				styleLikeCount = service.getStyleLike(style.getReview_idx()); 
				style.setStyle_like_count(styleLikeCount);
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











































































	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}