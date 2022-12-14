package com.teamone.ownit.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.*;
import java.util.stream.Stream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.teamone.ownit.service.AdminService;
import com.teamone.ownit.vo.*;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	// 관리자 메인으로 이동
	@GetMapping(value = "admin")
	public String admin(Model model) {
		
		// Main - 거래
		int salesCount = service.getSalesCount();
		
		// Main - 매출액
		String salesMoney = service.getSalesMoeny() + "";
		
		// Main - 회원
		int memberCount = service.getMemberCount();
		
		// Main - 리뷰
		int reviewCount = service.getReviewCount();
		
		model.addAttribute("salesCount", salesCount);
		model.addAttribute("salesMoney", salesMoney);
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("reviewCount", reviewCount);
		return "admin/admin_main";
	}
	
	// 상품 목록 조회 productList (검색, 페이징 추가)
	@GetMapping(value = "admin_productList")
	public String admin_productListAll(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum, 
			@RequestParam(defaultValue = "") String status,
			Model model) {
		
		System.out.println("searchType : " + searchType);
		System.out.println("keyword : " + keyword);
		
		// -------------------------------------------------------------------
		// 페이징 처리를 위한 계산 작업
		int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 5; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
//		int startRow = 1;

		// Service 객체의 getProductList() 메서드를 호출하여 게시물 목록 조회
		List<AdminProductVO> productList = service.getProductList(startRow, listLimit, searchType, keyword, status);
		
		// -------------------------------------------
		// Service 객체의 getProductListCount() 메서드를 호출하여 전체 상품 목록 갯수 조회
		int listCount = service.getProductListCount(searchType, keyword, status);
		
		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		// 시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		// 끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;
		
		// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우 
		// 끝 페이지 번호를 최대 페이지 번호로 교체
		if(endPage > maxPage) {	endPage = maxPage; }
		
		// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
		PageInfo pageInfo = new PageInfo(pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
//		System.out.println(pageInfo);
		// --------------------------------------------------------------------------------
		model.addAttribute("productList", productList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin/admin_productList";
	}
	
	
	// Product 등록 폼 이동
	@GetMapping(value = "admin_productWriteForm")
	public String admin_productWriteForm() {
		return "admin/admin_productWriteForm";
	}
	
	// Product 등록 (다중 파일 업로드 추가)
	@PostMapping (value = "admin_productWritePro")
	public String admin_productWritePro(@ModelAttribute AdminProductVO product, Model model, HttpSession session) {
		
		System.out.println(product.getFiles());
		
		// 가상 업로드 경로에 대한 실제 업로드 경로 알아내기
		String uploadDir = "/resources/img/product";
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		System.out.println("실제 업로드 경로 : " + saveDir);
		
		File f = new File(saveDir); // 실제 경로를 갖는 File 객체 생성
		// 만약, 해당 경로 상에 디렉토리(폴더)가 존재하지 않을 경우 생성
		if(!f.exists()) { // 해당 경로가 존재하지 않을 경우
			// 경로 상의 존재하지 않는 모든 경로 생성
			f.mkdirs();
		}
		
		List<Map<String, String>> fileList = new ArrayList<>();
		List<MultipartFile> mFiles = product.getFiles();
		Map<String, String> map = new HashMap<>();
		
		for(int i = 0; i < mFiles.size(); i++) {
			String originalFileName = mFiles.get(i).getOriginalFilename();
			long fileSize = mFiles.get(i).getSize();
			
			System.out.println("파일명 : " + originalFileName);
			System.out.println("파일크기 : " + fileSize + " Byte");
			
			String uuid = UUID.randomUUID().toString();
			
			String realFileName = uuid + "_" + originalFileName;
			System.out.println("realFileName : " + realFileName);
			
			map.put("originalFileName" + i, originalFileName);
			map.put("realFileName" + i, realFileName);
			
			fileList.add(map);
			System.out.println("fileList : " + fileList);

		}
		
		product.setImage_original_file1(fileList.get(0).get("originalFileName0").toString());
		product.setImage_original_file2(fileList.get(1).get("originalFileName1").toString());
		product.setImage_original_file3(fileList.get(2).get("originalFileName2").toString());
		product.setImage_real_file1(fileList.get(0).get("realFileName0").toString());
		product.setImage_real_file2(fileList.get(1).get("realFileName1").toString());
		product.setImage_real_file3(fileList.get(2).get("realFileName2").toString());
		
		
		int insertCount = service.registProduct(product);
		int insertCount2 = service.registProductImage(product);
		
		if(insertCount > 0 && insertCount2 > 0) {
			// 파일 등록 작업 성공 시 실제 폴더 위치에 파일 업로드 수행
			// => MultipartFile 객체의 transferTo() 메서드를 호출하여 파일 업로드 작업 수행
			//    (파라미터 : new File(업로드 경로, 업로드 할 파일명))
			try {
				mFiles.get(0).transferTo(new File(saveDir, product.getImage_real_file1()));
				mFiles.get(1).transferTo(new File(saveDir, product.getImage_real_file2()));
				mFiles.get(2).transferTo(new File(saveDir, product.getImage_real_file3()));
				System.out.println("다중 파일 업로드 성공");
			} catch (IllegalStateException e) {
				System.out.println("IllegalStateException");
				e.printStackTrace();
			} catch (IOException e) {
				System.out.println("IOException");
				e.printStackTrace();
			}
			
			return "redirect:/admin_productList";
		} else {
			model.addAttribute("msg", "상품 등록 실패!");
			return "notice/fail_back";
		}
	}
	
	// Product Modify 폼으로 이동
	@GetMapping(value = "admin_productModifyForm")
	public String admin_productModifyForm(@RequestParam int product_idx, Model model) {
		AdminProductVO product = service.getProduct(product_idx);
		model.addAttribute("product", product);
		
		return "admin/admin_productModify";
	}
	
	// Product Modify 수정 작업 수행
	@PostMapping(value = "admin_productModify")
	public String admin_productModify(@ModelAttribute AdminProductVO product, @RequestParam int pageNum, Model model, HttpSession session) {
		// 선택된 수정 업로드 파일명과 기존 파일명 출력
		System.out.println("기존 파일명 : " + product.getImage_original_file1());
		System.out.println("기존 실제 파일명 : " + product.getImage_real_file1());
		System.out.println("새 파일 객체1 : " + product.getFile1());
		System.out.println("새 파일 객체2 : " + product.getFile2());
		System.out.println("새 파일 객체3 : " + product.getFile3());
		System.out.println("새 파일명1 : " + product.getFile1().getOriginalFilename());
		System.out.println("새 파일명2 : " + product.getFile2().getOriginalFilename());
		System.out.println("새 파일명3 : " + product.getFile3().getOriginalFilename());
		
		// 기존 실제 파일명을 변수에 저장(= 새 파일 업로드 시 삭제하기 위함)
		String oldRealFile1 = product.getImage_real_file1();
		String oldRealFile2 = product.getImage_real_file2();
		String oldRealFile3 = product.getImage_real_file3();
		
		String uploadDir = "/resources/img/product";
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		System.out.println("실제 업로드 경로 : " + saveDir);
		
		File f = new File(saveDir); 
		
		if(!f.exists()) { // 해당 경로가 존재하지 않을 경우
			// 경로 상의 존재하지 않는 모든 경로 생성
			f.mkdirs();
		}
		
		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		MultipartFile mFile1 = product.getFile1();
		MultipartFile mFile2 = product.getFile2();
		MultipartFile mFile3 = product.getFile3();
		
		// 새 파일 업로드 여부와 관계없이 무조건 파일명을 가져와서 객체에 저장
		String originalFileName1 = mFile1.getOriginalFilename();
		String originalFileName2 = mFile2.getOriginalFilename();
		String originalFileName3 = mFile3.getOriginalFilename();
		
		String uuid = UUID.randomUUID().toString();
		
		product.setImage_original_file1(originalFileName1);
		product.setImage_original_file2(originalFileName2);
		product.setImage_original_file3(originalFileName3);
		product.setImage_real_file1(uuid + "_" + originalFileName1);
		product.setImage_real_file2(uuid + "_" + originalFileName2);
		product.setImage_real_file3(uuid + "_" + originalFileName3);
		
		int updateCount = service.modifyProduct(product);
		
		if(updateCount > 0) {
			if(!originalFileName1.equals("")) {
				try {
					mFile1.transferTo(new File(saveDir, product.getImage_real_file1()));
					
					// 기존 업로드 된 실제 파일 삭제
					File f2 = new File(saveDir, oldRealFile1);
					if(f2.exists()) {
						f2.delete();
					}
				} catch (IllegalStateException e) {
					System.out.println("IllegalStateException");
					e.printStackTrace();
				} catch (IOException e) {
					System.out.println("IOException");
					e.printStackTrace();
				}
			}
			
			if(!originalFileName2.equals("")) {
				try {
					mFile2.transferTo(new File(saveDir, product.getImage_real_file2()));
					
					// 기존 업로드 된 실제 파일 삭제
					File f2 = new File(saveDir, oldRealFile2);
					if(f2.exists()) {
						f2.delete();
					}
				} catch (IllegalStateException e) {
					System.out.println("IllegalStateException");
					e.printStackTrace();
				} catch (IOException e) {
					System.out.println("IOException");
					e.printStackTrace();
				}
			}
			
			if(!originalFileName3.equals("")) {
				try {
					mFile3.transferTo(new File(saveDir, product.getImage_real_file3()));
					
					// 기존 업로드 된 실제 파일 삭제
					File f2 = new File(saveDir, oldRealFile3);
					if(f2.exists()) {
						f2.delete();
					}
				} catch (IllegalStateException e) {
					System.out.println("IllegalStateException");
					e.printStackTrace();
				} catch (IOException e) {
					System.out.println("IOException");
					e.printStackTrace();
				}
			}
			return "redirect:/admin_productList?pageNum=" + pageNum;
		} else {
			model.addAttribute("msg", "상품 수정 실패!");
			return "notice/fail_back";
		}
	}
	
	
	// Product Delete 삭제 작업 수행
	@GetMapping(value = "admin_productDelete")
	public String admin_productDelete(@ModelAttribute AdminProductVO product, @RequestParam String deleteList, @RequestParam(defaultValue = "1") int pageNum, Model model, HttpSession session) {
		
		System.out.println("삭제할 상품번호 목록 : " + deleteList);
        int[] deleteNum = Stream.of(deleteList.split(",")).mapToInt(Integer::parseInt).toArray();
		
		for(int product_idx : deleteNum) {
			String realFiles = service.getRealFiles(product_idx);
			
			String[] realFileList = realFiles.split("/");
			
			int deleteCount = service.removeProduct(product_idx);
			
			if(deleteCount > 0) {
				String uploadDir = "/resources/img/product"; 
				String saveDir = session.getServletContext().getRealPath(uploadDir);
				System.out.println("실제 업로드 경로 : " + saveDir);
				
				for(int i = 0; i < realFileList.length; i++) {
					File f = new File(saveDir, realFileList[i]);	
					if(f.exists())  {f.delete();}
				}
				
			} else {
				model.addAttribute("msg", "상품 삭제 실패!");
				return "notice/fail_back";
			}
		}
		return "redirect:/admin_productList?pageNum=" + pageNum;
	}
	
	// Order - BuyList(구매목록) 조회
	@GetMapping(value = "admin_productBuyList")
	public String admin_productBuyList(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum, 
			@RequestParam(defaultValue = "") String status, Model model) {
		
		System.out.println("searchType : " + searchType);
		System.out.println("keyword : " + keyword);
		
		// -------------------------------------------------------------------
		// 페이징 처리를 위한 계산 작업
		int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 5; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;

		// Service 객체의 getProductList() 메서드를 호출하여 게시물 목록 조회
		List<AdminOrderVO> buyList = service.getBuyList(startRow, listLimit, searchType, keyword, status);
		// -------------------------------------------
		// Service 객체의 getProductListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
		int listCount = service.getBuyListCount(searchType, keyword, status);
		
		// 페이지 계산 작업 수행---------------------------------------------------------------
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {	endPage = maxPage; }
		// --------------------------------------------------------------------------------
		
		// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
		PageInfo pageInfo = new PageInfo(pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		//----------------------------------------------------------------------------------
		model.addAttribute("buyList", buyList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin/admin_productBuyList";
	}
	
	
	// ProductBuy 구매목록 상세조회
	@GetMapping(value = "admin_productBuyDetail")
	public String admin_productBuyDetail(@RequestParam int order_group_idx, Model model, HttpSession session) {
		
		System.out.println(order_group_idx);
		
		List<AdminOrderVO> buyList = service.getProductBuyDetail(order_group_idx);
		List<AdminOrderVO> memberInfo = service.getMemberInfo(order_group_idx);
		
		model.addAttribute("buyList", buyList);
		model.addAttribute("memberInfo", memberInfo);
		
		return "admin/admin_productBuyDetail";
	}
	

	// Order - SellList(판매목록) 조회
	@GetMapping(value = "admin_productSellList")
	public String admin_productSellList(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum, 
			@RequestParam(defaultValue = "") String status, Model model) {
		
		System.out.println("searchType : " + searchType);
		System.out.println("keyword : " + keyword);
		
		// -------------------------------------------------------------------
		// 페이징 처리를 위한 계산 작업
		int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 5; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;

		// Service 객체의 getSellList() 메서드를 호출하여 목록 조회
		List<AdminOrderVO> sellList = service.getSellList(startRow, listLimit, searchType, keyword, status);
		
		// -------------------------------------------
		// Service 객체의 getSellListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
		int listCount = service.getSellListCount(searchType, keyword, status);
		
		// 페이지 계산 작업 수행---------------------------------------------------------------
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {	endPage = maxPage; }
		// --------------------------------------------------------------------------------
		
		// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
		PageInfo pageInfo = new PageInfo(pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
//		System.out.println(pageInfo);
		// --------------------------------------------------------------------------------
		model.addAttribute("sellList", sellList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin/admin_productSellList";
	}	
	
	
	// Order_Buy 상태 변경 (order_buy_gb)
	@PostMapping(value = "admin_orderBuyModify")
	public String admin_orderBuyModify(@ModelAttribute AdminOrderVO adminOrder, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "")String status, Model model) {
		
		int updateCount = service.updateOrderBuy(adminOrder);
		
		if(updateCount > 0) {
			return "redirect:/admin_productBuyList?status=" + adminOrder.getOrder_buy_gb() + "&pageNum=" + pageNum;
		} else {
			model.addAttribute("msg", "상태 변경 실패!");
			return "notice/fail_back";
		}
		
	}
	
	// Order_Sell 상태 변경 (order_sell_gb) + product_left_count
	@PostMapping(value = "admin_orderSellModify")
	public String admin_orderSellModify(@ModelAttribute AdminOrderVO adminOrder, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "") String status, Model model) {
		
		int updateCount = service.updateOrderSell(adminOrder);
//		String page = "";
//		
//		switch (adminOrder.getOrder_sell_gb()) {
//		case "0": page += "0"; break;
//		case "1": page += "1"; break;
//		case "2": page += "2"; break;
//		case "3": page += ""; break;
//		default:
//			break;
//		}
		
		if(updateCount > 0) {
			return "redirect:/admin_productSellList?status=" + adminOrder.getOrder_sell_gb() + "&pageNum=" + pageNum;
		} else {
			model.addAttribute("msg", "상태 변경 실패!");
			return "notice/fail_back";
		}
		
	}

	// ProductList 재고변경
	@PostMapping(value = "admin_productLeftCountModify")
	public String admin_productLeftCountModify(@ModelAttribute ProductVO product, @RequestParam(defaultValue = "1") int pageNum, Model model, @RequestParam(defaultValue = "") String status) {
		
		int updateCount = service.updateProductLeftCount(product);
		
		if(updateCount > 0) {
			return "redirect:/admin_productList?status=" + status + "&pageNum=" + pageNum;
		} else {
			model.addAttribute("msg", "재고 변경 실패!");
			return "notice/fail_back";
		}
		
		
	}
	
	// 제품 등록폼 - 상품명 중복확인
	@RequestMapping("/checkProductName")
	@ResponseBody
	public Map<Object, Object> checkProductName(@RequestBody String productName) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		int count = service.checkProductName(productName);
		map.put("cnt", count);
		
		return map;
	}

	// 제품 등록폼 - 제품 번호 중복확인
	@RequestMapping("/checkModelNum")
	@ResponseBody
	public Map<Object, Object> checkModelNum(@RequestBody String modelNum) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		int count = service.checkModelNum(modelNum);
		map.put("cnt", count);
		
		return map;
	}


	// mbti_test 페이지로 이동
	@GetMapping(value = "mbti_test")
	public String mbti_test() {
		return "mbti/mbti_main";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 정채연 - 700
	@GetMapping(value = "/admin_memberList")
	public String memberList(Model model,
			@RequestParam(defaultValue = "all") String searchType,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum) {
		
		// 페이징 처리를 위한 계산 작업
		int listLimit = 15; // 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 5; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
		
		// 전체 회원 목록 조회
		// => 파라미터 : 시작행번호, 페이지 당 목록 갯수, 검색조건
		// => 리턴타입 : List<MemberVO> (memberList)
		List<MemberVO> memberList = service.getMemberList(startRow, listLimit, searchType, keyword);
		
		// Service 객체의 getOrderListCount() 메소드를 호출하여 해당 회원의 전체 구매 목록 갯수 조회
		// => 파라미터 : 검색조건, 리턴타입 : int(listCount)
		int listCount = service.getMemberListCount(searchType, keyword);
		
		// ----------------------------------------------------------------------------------------
		
		// 페이지 계산 작업 수행
		
		// 전체 페이지 수 계산
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		// 시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		// 끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;
		
		// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우 
		// 끝 페이지 번호를 최대 페이지 번호로 교체
		if(endPage > maxPage) { endPage = maxPage; }
		
		// 페이징 처리 정보 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
		PageInfo pageInfo = new PageInfo(pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		// ----------------------------------------------------------------------------------------
		
		// 회원 목록(memberList) 과 페이징 처리 정보(pageInfo)를 Model 객체에 저장
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("memberList", memberList);
		model.addAttribute("listCount", listCount);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		return "admin/admin_memberList";
	}
	
	@GetMapping(value = "removeMember")
	public String removeMember(int member_idx, int pageNum, String searchType, String keyword, Model model) {
		int deleteCount = service.removeMember(member_idx);
		
		try {
			keyword = URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		if(deleteCount > 0) {
			// 페이징 처리를 위한 계산 작업
			int listLimit = 15; // 한 페이지 당 표시할 게시물 목록 갯수 
			
			// 조회 시작 게시물 번호(행 번호) 계산
			int startRow = (pageNum - 1) * listLimit;
			
			// 해당 페이지 회원 목록 수 조회
			// => 파라미터 : 시작행번호, 페이지 당 목록 갯수, 검색조건
			// => 리턴타입 : int
			Integer memberListCount = service.getMemberListCount2(startRow, listLimit, searchType, keyword);
			
			// TODO memberListCount 리턴값 확인하고 nullpointerException 수정
			System.out.println(memberListCount);
			
			// 삭제 후 해당 pageNum 에 아무 목록 없을 경우 앞 페이지로 이동
			if(memberListCount == null) {
				if(pageNum != 1) {
					pageNum -= 1;
				}
			}
			
			return "redirect:/admin_memberList?searchType=" + searchType + "&keyword=" + keyword + "&pageNum=" + pageNum;
			
		} else {
			model.addAttribute("msg", "회원 탈퇴 실패!");
			return "notice/fail_back";
		}
	}
	

}
