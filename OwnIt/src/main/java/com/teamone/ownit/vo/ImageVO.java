package com.teamone.ownit.vo;

public class ImageVO {
	private int image_idx;
	private int product_idx;
	private int review_idx;
	private String image_board_type;
	private String image_real_file1;
	private String image_original_file1;
	private String image_real_file2;
	private String image_original_file2;
	private String image_real_file3;
	private String image_original_file3;
	
	// 기본 생성자
	public ImageVO() {}

	// 파라미터 생성자
	public ImageVO(int image_idx, int product_idx, int review_idx, String image_board_type, String image_real_file1,
			String image_original_file1, String image_real_file2, String image_original_file2, String image_real_file3,
			String image_original_file3) {
		super();
		this.image_idx = image_idx;
		this.product_idx = product_idx;
		this.review_idx = review_idx;
		this.image_board_type = image_board_type;
		this.image_real_file1 = image_real_file1;
		this.image_original_file1 = image_original_file1;
		this.image_real_file2 = image_real_file2;
		this.image_original_file2 = image_original_file2;
		this.image_real_file3 = image_real_file3;
		this.image_original_file3 = image_original_file3;
	}

	// Getter & Setter
	public int getImage_idx() {
		return image_idx;
	}

	public void setImage_idx(int image_idx) {
		this.image_idx = image_idx;
	}

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}

	public String getImage_board_type() {
		return image_board_type;
	}

	public void setImage_board_type(String image_board_type) {
		this.image_board_type = image_board_type;
	}

	public String getImage_real_file1() {
		return image_real_file1;
	}

	public void setImage_real_file1(String image_real_file1) {
		this.image_real_file1 = image_real_file1;
	}

	public String getImage_original_file1() {
		return image_original_file1;
	}

	public void setImage_original_file1(String image_original_file1) {
		this.image_original_file1 = image_original_file1;
	}

	public String getImage_real_file2() {
		return image_real_file2;
	}

	public void setImage_real_file2(String image_real_file2) {
		this.image_real_file2 = image_real_file2;
	}

	public String getImage_original_file2() {
		return image_original_file2;
	}

	public void setImage_original_file2(String image_original_file2) {
		this.image_original_file2 = image_original_file2;
	}

	public String getImage_real_file3() {
		return image_real_file3;
	}

	public void setImage_real_file3(String image_real_file3) {
		this.image_real_file3 = image_real_file3;
	}

	public String getImage_original_file3() {
		return image_original_file3;
	}

	public void setImage_original_file3(String image_original_file3) {
		this.image_original_file3 = image_original_file3;
	}

	// toString 오버라이딩
	@Override
	public String toString() {
		return "ImageVO [image_idx=" + image_idx + ", product_idx=" + product_idx + ", review_idx=" + review_idx
				+ ", image_board_type=" + image_board_type + ", image_real_file1=" + image_real_file1
				+ ", image_original_file1=" + image_original_file1 + ", image_real_file2=" + image_real_file2
				+ ", image_original_file2=" + image_original_file2 + ", image_real_file3=" + image_real_file3
				+ ", image_original_file3=" + image_original_file3 + "]";
	}
}
