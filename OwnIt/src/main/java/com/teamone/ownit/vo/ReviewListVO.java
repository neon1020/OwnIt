package com.teamone.ownit.vo;

public class ReviewListVO {

	private int review_idx;
	private int member_idx;
	private int product_idx;
	
	private String review_image1;
	private String review_image2;
	private String review_image3;
	private String member_image;
	private String product_image;
	
	private String member_id;
	private String member_nickname;
	
	private String product_name;
	private String product_buy_price;
	
	private String review_content;
	private String review_date;
	private int replyCount;
	private int likeCount;
	private String heartImg;
	private int num;
	
	public ReviewListVO() {}

	public ReviewListVO(int review_idx, int member_idx, int product_idx, String review_image1, String review_image2,
			String review_image3, String member_image, String product_image, String member_id, String member_nickname,
			String product_name, String product_buy_price, String review_content, String review_date, int replyCount,
			int likeCount, String heartImg, int num) {
		super();
		this.review_idx = review_idx;
		this.member_idx = member_idx;
		this.product_idx = product_idx;
		this.review_image1 = review_image1;
		this.review_image2 = review_image2;
		this.review_image3 = review_image3;
		this.member_image = member_image;
		this.product_image = product_image;
		this.member_id = member_id;
		this.member_nickname = member_nickname;
		this.product_name = product_name;
		this.product_buy_price = product_buy_price;
		this.review_content = review_content;
		this.review_date = review_date;
		this.replyCount = replyCount;
		this.likeCount = likeCount;
		this.heartImg = heartImg;
		this.num = num;
	}

	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public String getReview_image1() {
		return review_image1;
	}

	public void setReview_image1(String review_image1) {
		this.review_image1 = review_image1;
	}

	public String getReview_image2() {
		return review_image2;
	}

	public void setReview_image2(String review_image2) {
		this.review_image2 = review_image2;
	}

	public String getReview_image3() {
		return review_image3;
	}

	public void setReview_image3(String review_image3) {
		this.review_image3 = review_image3;
	}

	public String getMember_image() {
		return member_image;
	}

	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_buy_price() {
		return product_buy_price;
	}

	public void setProduct_buy_price(String product_buy_price) {
		this.product_buy_price = product_buy_price;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public String getHeartImg() {
		return heartImg;
	}

	public void setHeartImg(String heartImg) {
		this.heartImg = heartImg;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "ReviewListVO [review_idx=" + review_idx + ", member_idx=" + member_idx + ", product_idx=" + product_idx
				+ ", review_image1=" + review_image1 + ", review_image2=" + review_image2 + ", review_image3="
				+ review_image3 + ", member_image=" + member_image + ", product_image=" + product_image + ", member_id="
				+ member_id + ", member_nickname=" + member_nickname + ", product_name=" + product_name
				+ ", product_buy_price=" + product_buy_price + ", review_content=" + review_content + ", review_date="
				+ review_date + ", replyCount=" + replyCount + ", likeCount=" + likeCount + ", heartImg=" + heartImg
				+ ", num=" + num + "]";
	}

	
}
