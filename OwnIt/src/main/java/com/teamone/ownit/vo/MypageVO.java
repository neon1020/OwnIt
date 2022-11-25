package com.teamone.ownit.vo;

import org.springframework.web.multipart.MultipartFile;

public class MypageVO {
	private int member_idx;
	private String member_id;
	private String member_name;
	private String member_passwd;
	private String member_nickname;
	private String member_phone;
	private String member_image;
	private String address_zipcode;
	private String address1;
	private String address2;
	private String image_original_file1;
	private String image_real_file1;
	private MultipartFile file;
	
	// 기본 생성자
	public MypageVO() {}

	// 파라미터 생성자
	public MypageVO(int member_idx, String member_id, String member_name, String member_passwd, String member_nickname,
			String member_phone, String member_image, String address_zipcode, String address1, String address2,
			String image_original_file1, String image_real_file1, MultipartFile file) {
		super();
		this.member_idx = member_idx;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_passwd = member_passwd;
		this.member_nickname = member_nickname;
		this.member_phone = member_phone;
		this.member_image = member_image;
		this.address_zipcode = address_zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.image_original_file1 = image_original_file1;
		this.image_real_file1 = image_real_file1;
		this.file = file;
	}
	
	// Getter & Setter
	public int getMember_idx() {
		return member_idx;
	}
	
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	
	public String getMember_id() {
		return member_id;
	}
	
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getMember_name() {
		return member_name;
	}
	
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	public String getMember_passwd() {
		return member_passwd;
	}
	
	public void setMember_passwd(String member_passwd) {
		this.member_passwd = member_passwd;
	}
	
	public String getMember_nickname() {
		return member_nickname;
	}
	
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	
	public String getMember_phone() {
		return member_phone;
	}
	
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	
	public String getMember_image() {
		return member_image;
	}
	
	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}
	
	public String getAddress_zipcode() {
		return address_zipcode;
	}
	
	public void setAddress_zipcode(String address_zipcode) {
		this.address_zipcode = address_zipcode;
	}
	
	public String getAddress1() {
		return address1;
	}
	
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	
	public String getAddress2() {
		return address2;
	}
	
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	
	public String getImage_original_file1() {
		return image_original_file1;
	}
	
	public void setImage_original_file1(String image_original_file1) {
		this.image_original_file1 = image_original_file1;
	}
	
	public String getImage_real_file1() {
		return image_real_file1;
	}
	
	public void setImage_real_file1(String image_real_file1) {
		this.image_real_file1 = image_real_file1;
	}
	
	public MultipartFile getFile() {
		return file;
	}
	
	public void setFile(MultipartFile file) {
		this.file = file;
	}

	// toString 오버라이딩
	@Override
	public String toString() {
		return "MypageVO [member_idx=" + member_idx + ", member_id=" + member_id + ", member_name=" + member_name
				+ ", member_passwd=" + member_passwd + ", member_nickname=" + member_nickname + ", member_phone="
				+ member_phone + ", member_image=" + member_image + ", address_zipcode=" + address_zipcode
				+ ", address1=" + address1 + ", address2=" + address2 + ", image_original_file1=" + image_original_file1
				+ ", image_real_file1=" + image_real_file1 + ", file=" + file + "]";
	}
	


}
