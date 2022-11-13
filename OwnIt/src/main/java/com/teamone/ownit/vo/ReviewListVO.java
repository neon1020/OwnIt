package com.teamone.ownit.vo;

public class ReviewListVO {

	private String review_image;
	private String member_image;
	private String product_image;
	private String member_nickname;
	private String product_name;
	private String product_buy_price;
	private String review_content;
	private String review_date;
	private int review_reply_count;
	
	public ReviewListVO() {}

	public ReviewListVO(String review_image, String member_image, String product_image, String member_nickname,
			String product_name, String product_buy_price, String review_content, String review_date,
			int review_reply_count) {
		super();
		this.review_image = review_image;
		this.member_image = member_image;
		this.product_image = product_image;
		this.member_nickname = member_nickname;
		this.product_name = product_name;
		this.product_buy_price = product_buy_price;
		this.review_content = review_content;
		this.review_date = review_date;
		this.review_reply_count = review_reply_count;
	}

	public String getReview_image() {
		return review_image;
	}

	public void setReview_image(String review_image) {
		this.review_image = review_image;
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

	@Override
	public String toString() {
		return "ReviewListVO [review_image=" + review_image + ", member_image=" + member_image + ", product_image="
				+ product_image + ", member_nickname=" + member_nickname + ", product_name=" + product_name
				+ ", product_buy_price=" + product_buy_price + ", review_content=" + review_content + ", review_date="
				+ review_date + ", review_reply_count=" + review_reply_count + "]";
	}
	
	
}
