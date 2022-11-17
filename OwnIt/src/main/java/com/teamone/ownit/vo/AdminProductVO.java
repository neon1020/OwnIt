package com.teamone.ownit.vo;

import java.util.*;

import org.springframework.web.multipart.MultipartFile;

public class AdminProductVO {

	private int product_idx;
	private String product_type;
	private String product_brand;
	private String product_name;
	private String product_model_num;
	private String product_color;
	private String product_release_price;
	private String product_sell_price;
	private String product_buy_price;
	private int product_left_count;
	private int product_sell_count;
	private String product_date;
	
	private int image_idx;
	private String image_board_type;
	
	private String image_original_file1;
	private String image_original_file2;
	private String image_original_file3;
	
	private String image_real_file1;
	private String image_real_file2;
	private String image_real_file3;
	
	private List<MultipartFile> files;
	
	private MultipartFile file1; 
	private MultipartFile file2; 
	private MultipartFile file3;

	public AdminProductVO() {}
	
	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public String getProduct_type() {
		return product_type;
	}

	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}

	public String getProduct_brand() {
		return product_brand;
	}

	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_model_num() {
		return product_model_num;
	}

	public void setProduct_model_num(String product_model_num) {
		this.product_model_num = product_model_num;
	}

	public String getProduct_color() {
		return product_color;
	}

	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}

	public String getProduct_release_price() {
		return product_release_price;
	}

	public void setProduct_release_price(String product_release_price) {
		this.product_release_price = product_release_price;
	}

	public String getProduct_sell_price() {
		return product_sell_price;
	}

	public void setProduct_sell_price(String product_sell_price) {
		this.product_sell_price = product_sell_price;
	}

	public String getProduct_buy_price() {
		return product_buy_price;
	}

	public void setProduct_buy_price(String product_buy_price) {
		this.product_buy_price = product_buy_price;
	}

	public int getProduct_left_count() {
		return product_left_count;
	}

	public void setProduct_left_count(int product_left_count) {
		this.product_left_count = product_left_count;
	}

	public int getProduct_sell_count() {
		return product_sell_count;
	}

	public void setProduct_sell_count(int product_sell_count) {
		this.product_sell_count = product_sell_count;
	}

	public String getProduct_date() {
		return product_date;
	}

	public void setProduct_date(String product_date) {
		this.product_date = product_date;
	}

	public int getImage_idx() {
		return image_idx;
	}

	public void setImage_idx(int image_idx) {
		this.image_idx = image_idx;
	}

	public String getImage_board_type() {
		return image_board_type;
	}

	public void setImage_board_type(String image_board_type) {
		this.image_board_type = image_board_type;
	}

	public String getImage_original_file1() {
		return image_original_file1;
	}

	public void setImage_original_file1(String image_original_file1) {
		this.image_original_file1 = image_original_file1;
	}

	public String getImage_original_file2() {
		return image_original_file2;
	}

	public void setImage_original_file2(String image_original_file2) {
		this.image_original_file2 = image_original_file2;
	}

	public String getImage_original_file3() {
		return image_original_file3;
	}

	public void setImage_original_file3(String image_original_file3) {
		this.image_original_file3 = image_original_file3;
	}

	public String getImage_real_file1() {
		return image_real_file1;
	}

	public void setImage_real_file1(String image_real_file1) {
		this.image_real_file1 = image_real_file1;
	}

	public String getImage_real_file2() {
		return image_real_file2;
	}

	public void setImage_real_file2(String image_real_file2) {
		this.image_real_file2 = image_real_file2;
	}

	public String getImage_real_file3() {
		return image_real_file3;
	}

	public void setImage_real_file3(String image_real_file3) {
		this.image_real_file3 = image_real_file3;
	}

//	public MultipartFile getFile() {
//		return file;
//	}
//	public void setFile(MultipartFile file) {
//		this.file = file;
//	}
	
	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public MultipartFile getFile1() {
		return file1;
	}

	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}

	public MultipartFile getFile2() {
		return file2;
	}

	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}

	public MultipartFile getFile3() {
		return file3;
	}

	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}

	@Override
	public String toString() {
		return "AdminProductVO [product_idx=" + product_idx + ", product_type=" + product_type + ", product_brand="
				+ product_brand + ", product_name=" + product_name + ", product_model_num=" + product_model_num
				+ ", product_color=" + product_color + ", product_release_price=" + product_release_price
				+ ", product_sell_price=" + product_sell_price + ", product_buy_price=" + product_buy_price
				+ ", product_left_count=" + product_left_count + ", product_sell_count=" + product_sell_count
				+ ", product_date=" + product_date + ", image_idx=" + image_idx + ", image_board_type="
				+ image_board_type + ", image_original_file1=" + image_original_file1 + ", image_original_file2="
				+ image_original_file2 + ", image_original_file3=" + image_original_file3 + ", image_real_file1="
				+ image_real_file1 + ", image_real_file2=" + image_real_file2 + ", image_real_file3=" + image_real_file3
				+ ", files=" + files + ", file1=" + file1 + ", file2=" + file2 + ", file3=" + file3 + "]";
	}


	
}
