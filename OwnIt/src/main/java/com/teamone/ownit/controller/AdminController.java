package com.teamone.ownit.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.teamone.ownit.service.AdminService;
import com.teamone.ownit.vo.PageInfo;
import com.teamone.ownit.vo.ProductVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	// 김소희
	@GetMapping(value = "admin")
	public String admin() {
		return "admin/admin_main";
	}
	
	@GetMapping(value = "admin_productList")
	public ModelAndView admin_productList(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		// -------------------------------------------------------------------
		// 페이징 처리를 위한 계산 작업
		int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
//		int startRow = 1;

		// Service 객체의 getProductList() 메서드를 호출하여 게시물 목록 조회
		List<ProductVO> productList = service.getProductList(startRow, listLimit);
		
		// -------------------------------------------
		// Service 객체의 getProductListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
		int listCount = service.getProductListCount();
		
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
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productList", productList);
		map.put("pageInfo", pageInfo);
		
		return new ModelAndView("admin/admin_productList", "map", map);
	}
	
	// 관리자 - Product 등록 폼 이동
	@GetMapping(value = "admin_productWriteForm")
	public String admin_productWriteForm() {
		return "admin/admin_productWriteForm";
	}
	
	// 관리자 - 글쓰기 작업을 수행할 admin_productWritePro()
	@PostMapping (value = "admin_productWritePro")
	public String admin_productWritePro(@ModelAttribute ProductVO product, Model model, HttpSession session) {
		
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
		
//		ProductVO 객체에 전달된 MultipartFile 객체 꺼내기
//		MultipartFile[] mFiles = product.getFiles();
		
		return "";
	}
	
	
	@GetMapping(value = "admin_productUpdate")
	public String admin3() {
		
		return "admin/admin_productUpdate";
	}
	
	
	@GetMapping(value = "admin_productBuy")
	public String admin5() {
		
		return "admin/admin_productBuy";
	}
	
	@GetMapping(value = "admin_productSell")
	public String admin6() {
		
		return "admin/admin_productSell";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
	
	
	
	// 정채연 - 300
	@GetMapping(value = "admin_memberList")
	public String admin7() {
		
		return "admin/admin_memberList";
	}
	

}
