package artGuest;

public class ArtGuestVO {
	private int idx;
	private String nickName;
	private String content;
	private String wDate;
	private String hostIp;
	private int good;
	
	private int day_diff; 
	private int hour_diff;
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
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
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
	@Override
	public String toString() {
		return "ArtGuestVO [idx=" + idx + ", nickName=" + nickName + ", content=" + content + ", wDate=" + wDate
				+ ", hostIp=" + hostIp + ", good=" + good + ", day_diff=" + day_diff + ", hour_diff=" + hour_diff + "]";
	}
	
	
		
}
