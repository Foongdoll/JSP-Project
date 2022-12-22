package artMain;

public class ArtVO {
	private int idx;
	private String mid;
	private String pwd;
	private String name;
	private String gender;
	private String email;
	private String nickName;
	private String tel;
	private String birthday;
	private String address;
	private String hostIp;
	private int point;
	private String startDate;
	private String lastDate;
	private int aggrement;      // 광고성 문자 수신 동의
	private int level;          
	private int memDelete;
	private int todayVisitCnt;
	private int reportCnt;
	
	
	private String findId;       // 찾은 아이디
	private String findPwd;      // 임시 비밀번호 넣어줄 변수
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHostIp() {
		return hostIp;
	}
	public void setHostIp(String hostIp) {
		this.hostIp = hostIp;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public int getAggrement() {
		return aggrement;
	}
	public void setAggrement(int aggrement) {
		this.aggrement = aggrement;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getMemDelete() {
		return memDelete;
	}
	public void setMemDelete(int memDelete) {
		this.memDelete = memDelete;
	}
	public int getTodayVisitCnt() {
		return todayVisitCnt;
	}
	public void setTodayVisitCnt(int todayVisitCnt) {
		this.todayVisitCnt = todayVisitCnt;
	}
	public int getReportCnt() {
		return reportCnt;
	}
	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
	}
	public String getFindId() {
		return findId;
	}
	public void setFindId(String findId) {
		this.findId = findId;
	}
	public String getFindPwd() {
		return findPwd;
	}
	public void setFindPwd(String findPwd) {
		this.findPwd = findPwd;
	}
	@Override
	public String toString() {
		return "ArtVO [idx=" + idx + ", mid=" + mid + ", pwd=" + pwd + ", name=" + name + ", gender=" + gender + ", email="
				+ email + ", nickName=" + nickName + ", tel=" + tel + ", birthday=" + birthday + ", address=" + address
				+ ", hostIp=" + hostIp + ", point=" + point + ", startDate=" + startDate + ", lastDate=" + lastDate
				+ ", aggrement=" + aggrement + ", level=" + level + ", memDelete=" + memDelete + ", todayVisitCnt="
				+ todayVisitCnt + ", reportCnt=" + reportCnt + ", findId=" + findId + ", findPwd=" + findPwd + "]";
	}
	
}
