package com.teamone.ownit.vo;

public class AccountVO {
	private int account_idx;
	private int member_idx;
	private String account_bank;
	private String account_num;
	private String account_owner_name;
	private String account_gb;
	private String account_nickname;
	
	// 기본 생성자
	public AccountVO() {}

	// 파라미터 생성자
	public AccountVO(int account_idx, int member_idx, String account_bank, String account_num,
			String account_owner_name, String account_gb, String account_nickname) {
		super();
		this.account_idx = account_idx;
		this.member_idx = member_idx;
		this.account_bank = account_bank;
		this.account_num = account_num;
		this.account_owner_name = account_owner_name;
		this.account_gb = account_gb;
		this.account_nickname = account_nickname;
	}

	// Getter & Setter
	public int getAccount_idx() {
		return account_idx;
	}

	public void setAccount_idx(int account_idx) {
		this.account_idx = account_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getAccount_bank() {
		return account_bank;
	}

	public void setAccount_bank(String account_bank) {
		this.account_bank = account_bank;
	}

	public String getAccount_num() {
		return account_num;
	}

	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}

	public String getAccount_owner_name() {
		return account_owner_name;
	}

	public void setAccount_owner_name(String account_owner_name) {
		this.account_owner_name = account_owner_name;
	}

	public String getAccount_gb() {
		return account_gb;
	}

	public void setAccount_gb(String account_gb) {
		this.account_gb = account_gb;
	}

	public String getAccount_nickname() {
		return account_nickname;
	}

	public void setAccount_nickname(String account_nickname) {
		this.account_nickname = account_nickname;
	}

	// toString 오버라이딩
	@Override
	public String toString() {
		return "AccountVO [account_idx=" + account_idx + ", member_idx=" + member_idx + ", account_bank=" + account_bank
				+ ", account_num=" + account_num + ", account_owner_name=" + account_owner_name + ", account_gb="
				+ account_gb + ", account_nickname=" + account_nickname + "]";
	}
}
