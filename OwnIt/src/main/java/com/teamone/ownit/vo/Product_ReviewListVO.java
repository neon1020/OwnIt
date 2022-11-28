package com.teamone.ownit.vo;

public class Product_ReviewListVO {

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
	private int review_reply_count;
	
	private int style_like_count;
	private String heartImg;
	
	public Product_ReviewListVO() {}

	public Product_ReviewListVO(int review_idx, int member_idx, int product_idx, String review_image1,
			String review_image2, String review_image3, String member_image, String product_image, String member_id,
			String member_nickname, String product_name, String product_buy_price, String review_content,
			String review_date, int review_reply_count, int style_like_count, String heartImg) {
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
		this.review_reply_count = review_reply_count;
		this.style_like_count = style_like_count;
		this.heartImg = heartImg;
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

	public int getReview_reply_count() {
		return review_reply_count;
	}

	public void setReview_reply_count(int review_reply_count) {
		this.review_reply_count = review_reply_count;
	}

	public int getStyle_like_count() {
		return style_like_count;
	}

	public void setStyle_like_count(int style_like_count) {
		this.style_like_count = style_like_count;
	}

	public String getHeartImg() {
		return heartImg;
	}

	public void setHeartImg(String heartImg) {
		this.heartImg = heartImg;
	}

	@Override
	public String toString() {
		return "Product_ReviewListVO [review_idx=" + review_idx + ", member_idx=" + member_idx + ", product_idx="
				+ product_idx + ", review_image1=" + review_image1 + ", review_image2=" + review_image2
				+ ", review_image3=" + review_image3 + ", member_image=" + member_image + ", product_image="
				+ product_image + ", member_id=" + member_id + ", member_nickname=" + member_nickname
				+ ", product_name=" + product_name + ", product_buy_price=" + product_buy_price + ", review_content="
				+ review_content + ", review_date=" + review_date + ", review_reply_count=" + review_reply_count
				+ ", style_like_count=" + style_like_count + ", heartImg=" + heartImg + "]";
	}

	
	
	

}
