package com.teamone.ownit.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
//	@GetMapping(value = "cart")
//	public String cart() {
//		return "order/order_cart";
//	}
	
	@GetMapping(value = "order_complete")
	public String complete() {
		return "product/product_order_complete";
	}
	
	@GetMapping(value = "listProductByCategory")
	public String listProduct(String id, Model model, HttpSession session) {
//		String sId = (String)session.getAttribute("sId");
		String sId = "test1@naver.com";
		if(sId.length() != 0) {
			List<ProductVO> productList = service.getCategorisedProduct(id, sId);
	//		System.out.println(productList);
			int cnt = 0;
			System.out.println(productList);
			for(ProductVO product : productList) cnt++;
			model.addAttribute("productList", productList);
			model.addAttribute("cnt", cnt);
		}
		return "product/product_list";
	}

	@GetMapping(value = "arrayByCategory")
	public String arrayByCategory(String id, Model model, HttpSession session) {
//		String sId = (String)session.getAttribute("sId");
		String sId = "test1@naver.com";
		if(sId.length() != 0) {
			List<ProductVO> productList = service.arrayByCategory(id, sId);
	//		System.out.println(productList);
			int cnt = 0;
			for(ProductVO product : productList) cnt++;
			model.addAttribute("productList", productList);
			model.addAttribute("cnt", cnt);
		}
		return "product/product_list";
	}

	@GetMapping(value = "arrayByBrand")
	public String arrayByBrand(String chArr) {
		System.out.println(chArr);
		return "";
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
			int deleteCount = service.deleteCart(sId, product_idx);
			if(deleteCount > 0) {
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
	
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
// 박주닮
	@GetMapping(value = "product_detail")
	public String product_detail(@RequestParam(defaultValue = "0") int product_idx, Model model,
								@RequestParam(defaultValue = "1") int pageNum, 
								@RequestParam(defaultValue = "1") int pageNum2,
								@RequestParam(defaultValue = "") String keyword,
								HttpServletResponse response) {
//		System.out.println("컨트롤러 리뷰 키워드 : " + keyword + " product_idx : " + product_idx);
		// 상품 정보
		ProductVO product = service.productDetail(product_idx);
		model.addAttribute("product", product);

		// 관심상품에 담은 총갯수
		int wishCount = service.selectWishCount(product_idx);
		model.addAttribute("wishCount", wishCount);

		// 페이징
		int listLimit = 8;
		int pageListLimit = 10;
		int startRow = (pageNum2 - 1) * listLimit;
		// 상품에 대한 리뷰 목록
		List<ReviewListVO> reviewList = service.getReviewList(product_idx, startRow, listLimit,keyword);
		int listCount = service.getReviewListCount(product_idx);
		
		// 상품에 대한 리뷰 갯수
		model.addAttribute("listCount", listCount);

		int maxPage = (int) Math.ceil((double) listCount / listLimit);
		int startPage = (pageNum2 - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		Product_DetailPageInfoVO pageInfo = new Product_DetailPageInfoVO(pageNum2, listLimit, listCount, pageListLimit,
				maxPage, startPage, endPage);

		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pageInfo", pageInfo);
		
		if(!keyword.equals("")) { //체크박스가 체크됐을때만 
			JSONArray jsonArray = new JSONArray();
			for(ReviewListVO review : reviewList) {
				// 2. JSONObject 클래스 인스턴스 생성
				//    => 파라미터 : VO 객체(Getter/Setter, 기본생성자 필요)
				JSONObject jsonObject = new JSONObject(review);
				
				// 3. JSONArray 객체의 put() 메서드를 호출하여 JSONObject 객체 추가
				jsonArray.put(jsonObject);
			}
			System.out.println(jsonArray);
			
			try {
				// 응답 데이터를 직접 생성하여 웹페이지에 출력
				// HttpSertvletResponse 객체의 getWriter() 메서드를 통해 PrintWriter 객체를 리턴받아
				// 해당 객체의 print() 메서드를 호출하여 응답데이터 출력
				// => 단, 객체 데이터 출력 전 한글 인코딩 처리 필수!
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print(jsonArray);
				System.out.println(jsonArray);
				return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		

		

		return "product/product_detail";

	}
	




















































































	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}