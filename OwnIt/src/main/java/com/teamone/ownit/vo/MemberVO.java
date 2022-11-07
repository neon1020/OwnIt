package com.teamone.ownit.vo;

public class MemberVO {
	private int member_idx;
	private String member_id;
	private String member_passwd;
	private String member_name;
	private String member_nickname;
	private String member_phone;
	private String member_image;
	private String member_join_date;
	private String member_auth_gb;
	private String member_agree;
	
	// 기본 생성자
	public MemberVO() {}

	// 파라미터 생성자
	public MemberVO(int member_idx, String member_id, String member_passwd, String member_name, String member_nickname,
			String member_phone, String member_image, String member_join_date, String member_auth_gb,
			String member_agree) {
		super();
		this.member_idx = member_idx;
		this.member_id = member_id;
		this.member_passwd = member_passwd;
		this.member_name = member_name;
		this.member_nickname = member_nickname;
		this.member_phone = member_phone;
		this.member_image = member_image;
		this.member_join_date = member_join_date;
		this.member_auth_gb = member_auth_gb;
		this.member_agree = member_agree;
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

	public String getMember_passwd() {
		return member_passwd;
	}

	public void setMember_passwd(String member_passwd) {
		this.member_passwd = member_passwd;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
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

	public String getMember_join_date() {
		return member_join_date;
	}

	public void setMember_join_date(String member_join_date) {
		this.member_join_date = member_join_date;
	}

	public String getMember_auth_gb() {
		return member_auth_gb;
	}

	public void setMember_auth_gb(String member_auth_gb) {
		this.member_auth_gb = member_auth_gb;
	}

	public String getMember_agree() {
		return member_agree;
	}

	public void setMember_agree(String member_agree) {
		this.member_agree = member_agree;
	}

	// toString 오버라이딩
	@Override
	public String toString() {
		return "memberVO [member_idx=" + member_idx + ", member_id=" + member_id + ", member_passwd=" + member_passwd
				+ ", member_name=" + member_name + ", member_nickname=" + member_nickname + ", member_phone="
				+ member_phone + ", member_image=" + member_image + ", member_join_date=" + member_join_date
				+ ", member_auth_gb=" + member_auth_gb + ", member_agree=" + member_agree + "]";
	}
	
	
	
}
