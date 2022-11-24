package com.teamone.ownit.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.teamone.ownit.service.ReviewService;
import com.teamone.ownit.vo.ReplyVO;
import com.teamone.ownit.vo.ReviewListVO;
import com.teamone.ownit.vo.ReviewVO;
import com.teamone.ownit.vo.Style_like_listVO;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService service;
	
	@GetMapping(value = "/review")
	public String review(Model model, HttpSession session) {
		
        if(session.getAttribute("sIdx")!=null) {
        	int member_idx = (int)session.getAttribute("sIdx");
        	List<ReviewListVO> reviewList = service.getReviewList(member_idx);
        	model.addAttribute("reviewList", reviewList);
        } else {
        	int member_idx = 0;
        	List<ReviewListVO> reviewList = service.getReviewList(member_idx);
        	model.addAttribute("reviewList", reviewList);
        }
		
		return "review/review";
	}
	
	@GetMapping(value = "/review_detail")
	public String reviewDetail(@RequestParam int review_idx, Model model, HttpSession session) {
		// 리뷰 출력
		ReviewListVO review = service.getReview(review_idx);
		model.addAttribute("review", review);
		
		// 리뷰 이미지 출력
		List<ReviewListVO> reviewImage = service.getReviewImage(review_idx);
        model.addAttribute("reviewImage", reviewImage);
        
        // 댓글 출력
        List<ReplyVO> reply = service.getReply(review_idx);
        model.addAttribute("reply", reply);
        
        // 댓글 수 출력
        int replyCount = service.getReplyCount(review_idx);
        model.addAttribute("replyCount", replyCount);
        
        // 좋아요
        Style_like_listVO like = new Style_like_listVO();
        like.setReview_idx(review_idx);
        if(session.getAttribute("sIdx")!=null) {
        	int member_idx = (int)session.getAttribute("sIdx");
        	like.setMember_idx(member_idx);
        	int reviewlike = service.findLike(like);
        	model.addAttribute("heart", reviewlike);
        } else {
        	int member_idx = 0;
        	int reviewlike = service.findLike(like);
        	model.addAttribute("heart", reviewlike);
        }
        
        // 좋아요 수 출력
        int likeCount = service.getLikeCount(review_idx);
        model.addAttribute("likeCount", likeCount);
        
		return "review/review_detail";
	}
	
	@ResponseBody 
	@PostMapping(value = "/heart", produces = "application/json")
	public int heart(@RequestParam int review_idx, @RequestParam int heart, HttpSession session) {
		int member_idx = (int)session.getAttribute("sIdx");
		
		Style_like_listVO likeVO = new Style_like_listVO();
		
		likeVO.setMember_idx(member_idx);
		likeVO.setReview_idx(review_idx);
		
		if(heart >= 1) {
            service.removeLike(likeVO);
            heart = 0;
        } else {
            service.pushLike(likeVO);
            heart = 1;
        }
		
		return heart;
	}
	
	@GetMapping(value = "/review_mystyle")
	public String reviewMystyle(@RequestParam int member_idx, Model model, HttpSession session) {
		// 프로필 출력
		ReviewListVO profile = service.getProfile(member_idx);
		model.addAttribute("profile", profile);
		// 작성 게시물 수 출력
		int reviewCount = service.getReviewCount(member_idx);
		model.addAttribute("reviewCount", reviewCount);
		// 작성 리뷰 목록 출력
		if(session.getAttribute("sIdx")!=null) {
        	int member_idx2 = (int)session.getAttribute("sIdx");
        	List<ReviewListVO> mystyleList = service.getMystyleList(member_idx, member_idx2);
        	model.addAttribute("mystyleList", mystyleList);
        } else {
        	int member_idx2 = 0;
        	List<ReviewListVO> mystyleList = service.getMystyleList(member_idx, member_idx2);
        	model.addAttribute("mystyleList", mystyleList);
        }
		
		return "review/review_mystyle";
	}
	
	@GetMapping(value = "/review_writeForm")
	public String reviewWrite(@RequestParam int order_buy_idx, Model model) {
		ReviewListVO product = service.getProduct(order_buy_idx);
		model.addAttribute("product", product);
		return "review/review_writeForm";
	}
	
	@PostMapping(value = "/review_WritePro")
	public String reviewWritePro(
			@ModelAttribute ReviewVO review, Model model, HttpSession session, 
			@RequestParam int product_idx, @RequestParam int member_idx) {
		
		String uploadDir = "/resources/img/review"; 
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		File f = new File(saveDir);
		if(!f.exists()) { 
			f.mkdirs();
		}
		
		List<Map<String, String>> fileList = new ArrayList<>();
		List<MultipartFile> mFiles = review.getFiles();
		Map<String, String> map = new HashMap<>();
		
		for(int i = 0; i < mFiles.size(); i++) {
			String originalFileName = mFiles.get(i).getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			String realFileName = uuid + "_" + originalFileName;
			
			map.put("originalFileName" + i, originalFileName);
			map.put("realFileName" + i, realFileName);
			
			fileList.add(map);
			
		}
		
		review.setImage_original_file1(fileList.get(0).get("originalFileName0").toString());
		review.setImage_original_file2(fileList.get(1).get("originalFileName1").toString());
		review.setImage_original_file3(fileList.get(2).get("originalFileName2").toString());
		review.setImage_real_file1(fileList.get(0).get("realFileName0").toString());
		review.setImage_real_file2(fileList.get(1).get("realFileName1").toString());
		review.setImage_real_file3(fileList.get(2).get("realFileName2").toString());
		
		int insertCount = service.registReview(review);
		int insertCount2 = service.registReviewImage(review);
		
		if(insertCount > 0 && insertCount2 > 0) {
			try {
				mFiles.get(0).transferTo(new File(saveDir, review.getImage_real_file1()));
				mFiles.get(1).transferTo(new File(saveDir, review.getImage_real_file2()));
				mFiles.get(2).transferTo(new File(saveDir, review.getImage_real_file3()));
			} catch (IllegalStateException e) {
				System.out.println("IllegalStateException");
				e.printStackTrace();
			} catch (IOException e) {
				System.out.println("IOException");
				e.printStackTrace();
			}
			
			return "redirect:/review";
		} else {
			model.addAttribute("msg", "리뷰 등록 실패!");
			return "notice/fail_back";
		}
		
	}
	
	@GetMapping(value = "/review_modifyForm")
	public String reviewModify(@RequestParam int review_idx, Model model) {
		ReviewListVO review = service.getReview(review_idx);
		model.addAttribute("review", review);
		List<ReviewListVO> reviewImage = service.getReviewImage(review_idx);
        model.addAttribute("reviewImage", reviewImage);
		return "review/review_modifyForm";
	}
	
	@PostMapping(value = "/review_modifyPro")
	public String reviewModifyPro(@ModelAttribute ReviewVO review, Model model, HttpSession session, @RequestParam int review_idx) {
		
		String uploadDir = "/resources/img/review"; 
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		File f = new File(saveDir);
		if(!f.exists()) { 
			f.mkdirs();
		}
		
		List<Map<String, String>> fileList = new ArrayList<>();
		List<MultipartFile> mFiles = review.getFiles();
		Map<String, String> map = new HashMap<>();
		
		for(int i = 0; i < mFiles.size(); i++) {
			String originalFileName = mFiles.get(i).getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			String realFileName = uuid + "_" + originalFileName;
			
			map.put("originalFileName" + i, originalFileName);
			map.put("realFileName" + i, realFileName);
			
			fileList.add(map);
			
		}
		
		review.setImage_original_file1(fileList.get(0).get("originalFileName0").toString());
		review.setImage_original_file2(fileList.get(1).get("originalFileName1").toString());
		review.setImage_original_file3(fileList.get(2).get("originalFileName2").toString());
		review.setImage_real_file1(fileList.get(0).get("realFileName0").toString());
		review.setImage_real_file2(fileList.get(1).get("realFileName1").toString());
		review.setImage_real_file3(fileList.get(2).get("realFileName2").toString());
		
		int updateCount = service.modifyReview(review);
		int updateCount2 = service.modifyReviewImage(review);
		
		if(updateCount > 0 && updateCount2 > 0) {
			try {
				mFiles.get(0).transferTo(new File(saveDir, review.getImage_real_file1()));
				mFiles.get(1).transferTo(new File(saveDir, review.getImage_real_file2()));
				mFiles.get(2).transferTo(new File(saveDir, review.getImage_real_file3()));
			} catch (IllegalStateException e) {
				System.out.println("IllegalStateException");
				e.printStackTrace();
			} catch (IOException e) {
				System.out.println("IOException");
				e.printStackTrace();
			}
			
			return "redirect:/review_detail?review_idx=" + review.getReview_idx();
		} else {
			model.addAttribute("msg", "리뷰 수정 실패!");
			return "notice/fail_back";
		}
		
	}
	
	@GetMapping(value = "/review_delete")
	public String reviewDelete(@ModelAttribute ReviewVO review, @RequestParam int review_idx, Model model) {
		int deleteCount = service.removeReview(review);
		if(deleteCount == 0) {
			model.addAttribute("msg", "삭제 실패!");
			return "notice/fail_back";
		}
		return "redirect:/review";
	}
	
	@GetMapping(value = "/review_reply")
	public String reviewReply(Model model, @ModelAttribute ReplyVO reply, @RequestParam int review_idx, HttpSession session) {
		int insertCount = service.registReply(reply);
		
		if(insertCount > 0) { 
			service.increaseReplycount(review_idx);
			return "redirect:/review_detail?review_idx=" + reply.getReview_idx();
		} else { 
			model.addAttribute("msg", "등록 실패!");
			return "notice/fail_back";
		}
		
	}
	
	@GetMapping(value = "/review_replyDelete")
	public String replyDelete(
			Model model, @ModelAttribute ReplyVO reply, HttpSession session,
			@RequestParam int review_idx, @RequestParam int reply_re_ref) {
		int deleteCount = service.removeReply(reply);
		
		if(deleteCount > 0) { 
			service.decreaseReplycount(review_idx);
			return "redirect:/review_detail?review_idx=" + reply.getReview_idx();
		} else { 
			model.addAttribute("msg", "삭제 실패!");
			return "notice/fail_back";
		}
		
	}
	
	
	

	
	
	
	
	
	
	
}
