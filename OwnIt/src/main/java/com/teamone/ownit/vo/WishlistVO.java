package com.teamone.ownit.vo;

public class WishlistVO {
	private int member_idx;
	private int product_idx;
	private String image_real_file1;
	private String member_id;
	private String product_name;
	private String product_image;
	
	
	// 기본 생성자
	public WishlistVO() {}

	// 파라미터 생성자
	public WishlistVO(int member_idx, int product_idx, String image_real_file1, String member_id, String product_name,
			String product_image) {
		super();
		this.member_idx = member_idx;
		this.product_idx = product_idx;
		this.image_real_file1 = image_real_file1;
		this.member_id = member_id;
		this.product_name = product_name;
		this.product_image = product_image;
	}

	// Getter & Setter
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
	
	public String getImage_real_file1() {
		return image_real_file1;
	}
	
	public void setImage_real_file1(String image_real_file1) {
		this.image_real_file1 = image_real_file1;
	}
	
	public String getMember_id() {
		return member_id;
	}
	
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getProduct_name() {
		return product_name;
	}
	
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
	public String getProduct_image() {
		return product_image;
	}
	
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}


	// toString 오버라이딩
	@Override
	public String toString() {
		return "WishlistVO [member_idx=" + member_idx + ", product_idx=" + product_idx + ", image_real_file1="
				+ image_real_file1 + ", member_id=" + member_id + ", product_name=" + product_name + ", product_image="
				+ product_image + "]";
	}

	
}

