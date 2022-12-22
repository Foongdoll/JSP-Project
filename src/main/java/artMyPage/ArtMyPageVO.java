package artMyPage;

public class ArtMyPageVO {
	private int idx;
	private String nickName; 
	private String title;
	private String content;
	private String wDate;
	private String hostIp;
	private int readNum;
	private int good;
	private int gesifanPwd;
	private String hashTag;
	private String part;
	private String fName;
	private String fSName;
	private String secretSw;
	
	private int day_diff; 
	private int hour_diff;
	
	private int preIdx;
	private int nextIdx;
	private String preTitle;
	private String nextTitle;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public String getHostIp() {
		return hostIp;
	}
	public void setHostIp(String hostIp) {
		this.hostIp = hostIp;
	}
	public int getReadNum() {
		return readNum;
	}
	public void setReadNum(int readNum) {
		this.readNum = readNum;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getGesifanPwd() {
		return gesifanPwd;
	}
	public void setGesifanPwd(int gesifanPwd) {
		this.gesifanPwd = gesifanPwd;
	}
	public String getHashTag() {
		return hashTag;
	}
	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getfSName() {
		return fSName;
	}
	public void setfSName(String fSName) {
		this.fSName = fSName;
	}
	public String getSecretSw() {
		return secretSw;
	}
	public void setSecretSw(String secretSw) {
		this.secretSw = secretSw;
	}
	public int getDay_diff() {
		return day_diff;
	}
	public void setDay_diff(int day_diff) {
		this.day_diff = day_diff;
	}
	public int getHour_diff() {
		return hour_diff;
	}
	public void setHour_diff(int hour_diff) {
		this.hour_diff = hour_diff;
	}
	public int getPreIdx() {
		return preIdx;
	}
	public void setPreIdx(int preIdx) {
		this.preIdx = preIdx;
	}
	public int getNextIdx() {
		return nextIdx;
	}
	public void setNextIdx(int nextIdx) {
		this.nextIdx = nextIdx;
	}
	public String getPreTitle() {
		return preTitle;
	}
	public void setPreTitle(String preTitle) {
		this.preTitle = preTitle;
	}
	public String getNextTitle() {
		return nextTitle;
	}
	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}
	@Override
	public String toString() {
		return "ArtGesifanVO [idx=" + idx + ", nickName=" + nickName + ", title=" + title + ", content=" + content
				+ ", wDate=" + wDate + ", hostIp=" + hostIp + ", readNum=" + readNum + ", good=" + good + ", gesifanPwd="
				+ gesifanPwd + ", hashTag=" + hashTag + ", part=" + part + ", fName=" + fName + ", fSName=" + fSName
				+ ", secretSw=" + secretSw + ", day_diff=" + day_diff + ", hour_diff=" + hour_diff + ", preIdx=" + preIdx
				+ ", nextIdx=" + nextIdx + ", preTitle=" + preTitle + ", nextTitle=" + nextTitle + "]";
	}
}
