package member;

public class MemberVO {
	private int idx;
	private String mid;
	private String pwd;
	private String nickName;
	private String name;
	private String gender;
	private String birthday;
	private String tel;
	private String address;
	private String email;
	private String homePage;
	private String job;
	private String hobby;
	private String photo;
	private String content;
	private String userInfor;
	private String userDel;
	private int point;
	private int level;
	private int visitCnt;
	private String startDate;
	private String lastDate;
	private int todayCnt;
	
	private String salt;
	
	int getIdx() {
		return idx;
	}
	void setIdx(int idx) {
		this.idx = idx;
	}
	String getMid() {
		return mid;
	}
	void setMid(String mid) {
		this.mid = mid;
	}
	String getPwd() {
		return pwd;
	}
	void setPwd(String pwd) {
		this.pwd = pwd;
	}
	String getNickName() {
		return nickName;
	}
	void setNickName(String nickName) {
		this.nickName = nickName;
	}
	String getName() {
		return name;
	}
	void setName(String name) {
		this.name = name;
	}
	String getGender() {
		return gender;
	}
	void setGender(String gender) {
		this.gender = gender;
	}
	String getBirthday() {
		return birthday;
	}
	void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	String getTel() {
		return tel;
	}
	void setTel(String tel) {
		this.tel = tel;
	}
	String getAddress() {
		return address;
	}
	void setAddress(String address) {
		this.address = address;
	}
	String getEmail() {
		return email;
	}
	void setEmail(String email) {
		this.email = email;
	}
	String getHomePage() {
		return homePage;
	}
	void setHomePage(String homePage) {
		this.homePage = homePage;
	}
	String getJob() {
		return job;
	}
	void setJob(String job) {
		this.job = job;
	}
	String getHobby() {
		return hobby;
	}
	void setHobby(String hobby) {
		this.hobby = hobby;
	}
	String getPhoto() {
		return photo;
	}
	void setPhoto(String photo) {
		this.photo = photo;
	}
	String getContent() {
		return content;
	}
	void setContent(String content) {
		this.content = content;
	}
	String getUserInfor() {
		return userInfor;
	}
	void setUserInfor(String userInfor) {
		this.userInfor = userInfor;
	}
	String getUserDel() {
		return userDel;
	}
	void setUserDel(String userDel) {
		this.userDel = userDel;
	}
	int getPoint() {
		return point;
	}
	void setPoint(int point) {
		this.point = point;
	}
	int getLevel() {
		return level;
	}
	void setLevel(int level) {
		this.level = level;
	}
	int getVisitCnt() {
		return visitCnt;
	}
	void setVisitCnt(int visitCnt) {
		this.visitCnt = visitCnt;
	}
	String getStartDate() {
		return startDate;
	}
	void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	String getLastDate() {
		return lastDate;
	}
	void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	int getTodayCnt() {
		return todayCnt;
	}
	void setTodayCnt(int todayCnt) {
		this.todayCnt = todayCnt;
	}
	String getSalt() {
		return salt;
	}
	void setSalt(String salt) {
		this.salt = salt;
	}
	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", mid=" + mid + ", pwd=" + pwd + ", nickName=" + nickName + ", name=" + name
				+ ", gender=" + gender + ", birthday=" + birthday + ", tel=" + tel + ", address=" + address + ", email=" + email
				+ ", homePage=" + homePage + ", job=" + job + ", hobby=" + hobby + ", photo=" + photo + ", content=" + content
				+ ", userInfor=" + userInfor + ", userDel=" + userDel + ", point=" + point + ", level=" + level + ", visitCnt="
				+ visitCnt + ", startDate=" + startDate + ", lastDate=" + lastDate + ", todayCnt=" + todayCnt + ", salt=" + salt
				+ "]";
	}
}