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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
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
			System.out.println(categories);
			String[] divideCategory = categories.split("/");
			List<String> brands = new ArrayList<String>();
			String category = "";
			String productListing = "";
			for(String str : divideCategory) {
				if(str.contains("brand")) {
					brands.add(str.split(":")[1]);
				} else if(str.contains("category")) {
					category = str.split(":")[1];
				} else if(str.contains("productListing")) {
					productListing = str.split(":")[1];
				}
			}
//			System.out.println(brands+", "+category+", " + productListing);
			List<ProductVO> productList = service.getCategorisedProduct(sId, brands, category, productListing);
			JSONArray jsonArray = new JSONArray();
			System.out.println(productList);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
// 박주닮
	@GetMapping(value = "product_detail")
	public String product_detail(@RequestParam int product_idx, Model model,
								 @RequestParam(defaultValue = "1") int pageNum,
								 @RequestParam(defaultValue = "1") int pageNum2) {
		ProductVO product = service.productDetail(product_idx);
		model.addAttribute("product", product);
		// 페이징
		int listLimit = 10; 
		int pageListLimit = 10; 
		int startRow = (pageNum2 - 1) * listLimit;
		// 상품에 대한 리뷰 목록
		List<ReviewListVO> reviewList = service.getReviewList(product_idx,startRow,listLimit);
		int listCount = service.getReviewListCount(product_idx);
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = (pageNum2 - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		Product_DetailPageInfoVO pageInfo = new Product_DetailPageInfoVO(
				pageNum2, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pageInfo", pageInfo);
		
			return "product/product_detail";
		
	}
	




















































































	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}