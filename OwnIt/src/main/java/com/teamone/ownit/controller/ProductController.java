package com.teamone.ownit.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	@GetMapping(value = "cart")
	public String cart() {
		return "order/order_cart";
	}
	
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

	@GetMapping(value = "addLikeList")
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
			}
		}
		return product_idx + "";
	}

	@GetMapping(value = "deleteLikeList")
	@ResponseBody
	public String deleteLikeList(HttpSession session, int product_idx) {
//		String sId = (String)session.getAttribute("sId");
		System.out.println(product_idx);
		String sId = "test1@naver.com";
		if(sId.length() != 0) {
			int ischecked = service.checkLike(sId, product_idx);
			if(ischecked != 0) {
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

	@GetMapping(value = "checkCart", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> checkCart(HttpSession session) {
//		String sId = (String)session.getAttribute("sId");
		Map<String, Object> result = null;
		List<CartVO> cart = null;
		String sId = "test1@naver.com";
		if(sId.length() != 0) {
			cart = service.checkCart(sId);
			result.put("cart", cart);
//			System.out.println(cart);
			int cnt = 0;
			for(CartVO c : cart) cnt++;
		}
		return result;
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