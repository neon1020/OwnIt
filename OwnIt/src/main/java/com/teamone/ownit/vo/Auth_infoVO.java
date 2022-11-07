package com.teamone.ownit.vo;

public class Auth_infoVO {
	private int member_idx;
	private String auth_code;
	
	// 기본 생성자
	public Auth_infoVO() {}

	// 파라미터 생성자
	public Auth_infoVO(int member_idx, String auth_code) {
		super();
		this.member_idx = member_idx;
		this.auth_code = auth_code;
	}

	// Getter & Setter
	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getAuth_code() {
		return auth_code;
	}

	public void setAuth_code(String auth_code) {
		this.auth_code = auth_code;
	}

	// toString 오버라이딩
	@Override
	public String toString() {
		return "auth_infoVO [member_idx=" + member_idx + ", auth_code=" + auth_code + "]";
	}
}
