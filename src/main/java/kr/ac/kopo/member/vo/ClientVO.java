package kr.ac.kopo.member.vo;

public class ClientVO extends MemberVO {
	
	private String email;
	private String phone;
	private String clientCategory;
	private String teamName;
	private String companyName;
	private String orgName;
	
	
	public ClientVO() {
		super();
	}


	public ClientVO(String email, String phone, String clientCategory, String teamName, String companyName,
			String orgName) {
		super();
		this.email = email;
		this.phone = phone;
		this.clientCategory = clientCategory;
		this.teamName = teamName;
		this.companyName = companyName;
		this.orgName = orgName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getClientCategory() {
		return clientCategory;
	}


	public void setClientCategory(String clientCategory) {
		this.clientCategory = clientCategory;
	}


	public String getTeamName() {
		return teamName;
	}


	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}


	public String getCompanyName() {
		return companyName;
	}


	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}


	public String getOrgName() {
		return orgName;
	}


	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}


	@Override
	public String toString() {
		return "ClientVO [email=" + email + ", phone=" + phone + ", clientCategory=" + clientCategory + ", teamName="
				+ teamName + ", companyName=" + companyName + ", orgName=" + orgName + "]";
	}

	
}
