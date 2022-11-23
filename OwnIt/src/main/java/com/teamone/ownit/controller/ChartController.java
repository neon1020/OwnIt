package com.teamone.ownit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.teamone.ownit.service.ChartService;
import com.teamone.ownit.vo.ChartVO;

@Controller
public class ChartController {

	@Autowired
	private ChartService service;
	
	
	@GetMapping(value = "orderBuy_ProductType_Ratio")
	public void orderBuy_ProductType_Ratio(Model model, HttpServletResponse response) {
		
		List<ChartVO> typeList = service.getTypeList();
		
		JSONArray jsonArray = new JSONArray();
		
		for(ChartVO chart : typeList) {
			// 2. JSONObject 클래스 인스턴스 생성
			//    => 파라미터 : VO 객체(Getter/Setter, 기본생성자 필요)
			JSONObject jsonObject = new JSONObject(chart);
			
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
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	
	
	@GetMapping(value = "orderBuy_monthly_salesBuy")
	public void orderBuy_monthly_salesBuy(Model model, HttpServletResponse response) {
		
		List<ChartVO> monthlySalesBuy = service.monthlySalesBuy();
		
		JSONArray jsonArray = new JSONArray();
		
		for(ChartVO chart : monthlySalesBuy) {
			// 2. JSONObject 클래스 인스턴스 생성
			//    => 파라미터 : VO 객체(Getter/Setter, 기본생성자 필요)
			JSONObject jsonObject = new JSONObject(chart);
			
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
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	
	
	@GetMapping(value = "orderBuy_monthly_sales")
	public void orderBuy_monthly_sales(Model model, HttpServletResponse response) {
		
		List<ChartVO> monthlySalesBuy = service.monthlySalesBuy();
		List<ChartVO> monthlySalesSell = service.monthlySalesSell();
		
		JSONObject obj = new JSONObject();
		
		JSONArray jsonArrayBuy = new JSONArray();
		JSONArray jsonArraySell = new JSONArray();
		
		for(ChartVO chart : monthlySalesBuy) {
			// 2. JSONObject 클래스 인스턴스 생성
			//    => 파라미터 : VO 객체(Getter/Setter, 기본생성자 필요)
			JSONObject jsonObject = new JSONObject(chart);
			
			// 3. JSONArray 객체의 put() 메서드를 호출하여 JSONObject 객체 추가
			jsonArrayBuy.put(jsonObject);
		}
		
		for(ChartVO chart : monthlySalesSell) {
			// 2. JSONObject 클래스 인스턴스 생성
			//    => 파라미터 : VO 객체(Getter/Setter, 기본생성자 필요)
			JSONObject jsonObject = new JSONObject(chart);
			
			// 3. JSONArray 객체의 put() 메서드를 호출하여 JSONObject 객체 추가
			jsonArraySell.put(jsonObject);
		}
		
		obj.put("jsonArrayBuy", jsonArrayBuy);
		obj.put("jsonArraySell", jsonArraySell);
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(obj);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("obj: " + obj);
	}
	
	
	@GetMapping(value = "orderBuy_productTop5")
	public void orderBuy_productTop5(Model model, HttpServletResponse response) {
		
		List<ChartVO> productTop5 = service.productTop5();
		
		JSONArray jsonArray = new JSONArray();
		
		for(ChartVO chart : productTop5) {
			// 2. JSONObject 클래스 인스턴스 생성
			//    => 파라미터 : VO 객체(Getter/Setter, 기본생성자 필요)
			JSONObject jsonObject = new JSONObject(chart);
			
			// 3. JSONArray 객체의 put() 메서드를 호출하여 JSONObject 객체 추가
			jsonArray.put(jsonObject);
		}
		try {
			// 응답 데이터를 직접 생성하여 웹페이지에 출력
			// HttpSertvletResponse 객체의 getWriter() 메서드를 통해 PrintWriter 객체를 리턴받아
			// 해당 객체의 print() 메서드를 호출하여 응답데이터 출력
			// => 단, 객체 데이터 출력 전 한글 인코딩 처리 필수!
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonArray);
			System.out.println(jsonArray);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	
	
	
	
}
