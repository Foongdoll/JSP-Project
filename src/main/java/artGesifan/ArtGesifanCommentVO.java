package artGesifan;

public class ArtGesifanCommentVO {
	private int idx;
	private int gesifanIdx;
	private String nickName;
	private String wDate;
	private String hostIp;
	private String comment;
	
	private int cnt;
	private int hour_diff;
	private int day_diff;
	
	
	public int getHour_diff() {
		return hour_diff;
	}
	public void setHour_diff(int hour_diff) {
		this.hour_diff = hour_diff;
	}
	public int getDay_diff() {
		return day_diff;
	}
	public void setDay_diff(int day_diff) {
		this.day_diff = day_diff;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getGesifanIdx() {
		return gesifanIdx;
	}
	public void setGesifanIdx(int gesifanIdx) {
		this.gesifanIdx = gesifanIdx;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
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
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "ArtGesifanCommentVO [idx=" + idx + ", gesifanIdx=" + gesifanIdx + ", nickName=" + nickName + ", wDate="
				+ wDate + ", hostIp=" + hostIp + ", comment=" + comment + "]";
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
