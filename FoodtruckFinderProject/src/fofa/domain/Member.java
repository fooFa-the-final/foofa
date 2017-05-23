package fofa.domain;

import java.util.Date;

public class Member {
	private String memberId;
	private String password;
	private Date birthday;
	private String email;
	private Character gender;
	private String profileImg;
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Character getGender() {
		return gender;
	}
	public void setGender(Character gender) {
		this.gender = gender;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", password=" + password + ", birthday=" + birthday + ", email=" + email
				+ ", gender=" + gender + ", profileImg=" + profileImg + "]";
	}

}
