package com.teamone.ownit.vo;

public class AddressVO {
	private int address_idx;
	private int member_idx;
	private String address_zipcode;
	private String address1;
	private String address2;
	private String address_gb;
	private String address_nickname;
	private String address_recipient;
	
	// 기본 생성자
	public AddressVO() {}

	// 파라미터 생성자
	public AddressVO(int address_idx, int member_idx, String address_zipcode, String address1, String address2,
			String address_recipient, String address_gb, String address_nickname) {
		super();
		this.address_idx = address_idx;
		this.member_idx = member_idx;
		this.address_zipcode = address_zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.address_recipient = address_recipient;
		this.address_gb = address_gb;
		this.address_nickname = address_nickname;
	}

	// Getter & Setter
	public int getAddress_idx() {
		return address_idx;
	}

	public void setAddress_idx(int address_idx) {
		this.address_idx = address_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
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

	public String getAddress_recipient() {
		return address_recipient;
	}

	public void setAddress_recipient(String address_recipient) {
		this.address_recipient = address_recipient;
	}

	public String getAddress_gb() {
		return address_gb;
	}

	public void setAddress_gb(String address_gb) {
		this.address_gb = address_gb;
	}

	public String getAddress_nickname() {
		return address_nickname;
	}

	public void setAddress_nickname(String address_nickname) {
		this.address_nickname = address_nickname;
	}
	
	// toString 오버라이딩
	@Override
	public String toString() {
		return "AddressVO [address_idx=" + address_idx + ", member_idx=" + member_idx + ", address_zipcode="
				+ address_zipcode + ", address1=" + address1 + ", address2=" + address2 + ", address_recipient="
				+ address_recipient + ", address_gb=" + address_gb + ", address_nickname=" + address_nickname + "]";
	}

}
