package com.teamone.ownit.controller;

import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.teamone.ownit.service.AdminService;
import com.teamone.ownit.vo.*;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	// 관리자 메인으로 이동
	@GetMapping(value = "admin")
	public String admin() {
		return "admin/admin_main";
	}
	
	// 상품 목록 조회 productList (검색, 페이징 추가)
	@GetMapping(value = "admin_productList")
	public String admin_productList(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		System.out.println("searchType : " + searchType);
		System.out.println("keyword : " + keyword);
		
		// -------------------------------------------------------------------
		// 페이징 처리를 위한 계산 작업
		int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
//		int startRow = 1;

		// Service 객체의 getProductList() 메서드를 호출하여 게시물 목록 조회
		List<AdminProductVO> productList = service.getProductList(startRow, listLimit, searchType, keyword);
		
		// -------------------------------------------
		// Service 객체의 getProductListCount() 메서드를 호출하여 전체 상품 목록 갯수 조회
		int listCount = service.getProductListCount(searchType, keyword);
		
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
		
		System.out.println(pageInfo);
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
			return "";
		}
	
	}
	
	// Order - BuyList(구매목록) 조회
	@GetMapping(value = "admin_productBuyList")
	public String admin_productBuyList(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		System.out.println("searchType : " + searchType);
		System.out.println("keyword : " + keyword);
		
		// -------------------------------------------------------------------
		// 페이징 처리를 위한 계산 작업
		int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
//		int startRow = 1;

		// Service 객체의 getProductList() 메서드를 호출하여 게시물 목록 조회
		List<AdminOrderVO> buyList = service.getBuyList(startRow, listLimit, searchType, keyword);
		
		// -------------------------------------------
		// Service 객체의 getProductListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
		int listCount = service.getBuyListCount(searchType, keyword);
		
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
		
		System.out.println(pageInfo);
		// --------------------------------------------------------------------------------
		model.addAttribute("buyList", buyList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin/admin_productBuyList";
	}

	// Order - SellList(판매목록) 조회
	@GetMapping(value = "admin_productSellList")
	public String admin_productSellList(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		System.out.println("searchType : " + searchType);
		System.out.println("keyword : " + keyword);
		
		// -------------------------------------------------------------------
		// 페이징 처리를 위한 계산 작업
		int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
//		int startRow = 1;

		// Service 객체의 getProductList() 메서드를 호출하여 게시물 목록 조회
		List<AdminOrderVO> sellList = service.getSellList(startRow, listLimit, searchType, keyword);
		
		// -------------------------------------------
		// Service 객체의 getProductListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
		int listCount = service.getSellListCount(searchType, keyword);
		
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
		
		System.out.println(pageInfo);
		// --------------------------------------------------------------------------------
		model.addAttribute("sellList", sellList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin/admin_productSellList";
	}	
	
	
	@GetMapping(value = "admin_productUpdate")
	public String admin3() {
		
		return "admin/admin_productUpdate";
	}
	
	
	

	
	
	
	
	
	


	


	
	
	
	
	
	
	
	
	// 정채연 - 300
	@GetMapping(value = "admin_memberList")
	public String admin7() {
		
		return "admin/admin_memberList";
	}
	

}
