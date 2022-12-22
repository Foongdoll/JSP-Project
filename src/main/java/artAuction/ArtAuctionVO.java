package artAuction;

public class ArtAuctionVO {
	private int idx;
	private String work;
	private String workFname;
	private String workFSname;
	private String workWriter;
	private String writerBirthYear;
	private String workSize;
	private String workComment;
	private String chuJungPrice;
	private String startPrice;
	private String currentPrice;
	private int ipchalCnt;
	private String workStartDate;
	private String workLastDate;
  private String boomnackchalPrice;
  private String ipchalmember;
  
  private int day_diff;
  private int hour_diff;
  
  private int ipchalprice;
  private String cancelSw;
	
	// 작가 테이블
	private int writerInt;
	private String writerName;
	private String writerGender;
	private String writerBirthday;
	private String writerHomeTown;
	private String writerInfor;
	private String writerFname;
	private String writerFsName;
	private String writeropenSw;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public String getWorkFname() {
		return workFname;
	}
	public void setWorkFname(String workFname) {
		this.workFname = workFname;
	}
	public String getWorkFSname() {
		return workFSname;
	}
	public void setWorkFSname(String workFSname) {
		this.workFSname = workFSname;
	}
	public String getWorkWriter() {
		return workWriter;
	}
	public void setWorkWriter(String workWriter) {
		this.workWriter = workWriter;
	}
	public String getWriterBirthYear() {
		return writerBirthYear;
	}
	public void setWriterBirthYear(String writerBirthYear) {
		this.writerBirthYear = writerBirthYear;
	}
	public String getWorkSize() {
		return workSize;
	}
	public void setWorkSize(String workSize) {
		this.workSize = workSize;
	}
	public String getWorkComment() {
		return workComment;
	}
	public void setWorkComment(String workComment) {
		this.workComment = workComment;
	}
	public String getChuJungPrice() {
		return chuJungPrice;
	}
	public void setChuJungPrice(String chuJungPrice) {
		this.chuJungPrice = chuJungPrice;
	}
	public String getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(String startPrice) {
		this.startPrice = startPrice;
	}
	public String getCurrentPrice() {
		return currentPrice;
	}
	public void setCurrentPrice(String currentPrice) {
		this.currentPrice = currentPrice;
	}
	public int getIpchalCnt() {
		return ipchalCnt;
	}
	public void setIpchalCnt(int ipchalCnt) {
		this.ipchalCnt = ipchalCnt;
	}
	public String getWorkStartDate() {
		return workStartDate;
	}
	public void setWorkStartDate(String workStartDate) {
		this.workStartDate = workStartDate;
	}
	public String getWorkLastDate() {
		return workLastDate;
	}
	public void setWorkLastDate(String workLastDate) {
		this.workLastDate = workLastDate;
	}
	public String getBoomnackchalPrice() {
		return boomnackchalPrice;
	}
	public void setBoomnackchalPrice(String boomnackchalPrice) {
		this.boomnackchalPrice = boomnackchalPrice;
	}
	public String getIpchalmember() {
		return ipchalmember;
	}
	public void setIpchalmember(String ipchalmember) {
		this.ipchalmember = ipchalmember;
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
	public int getIpchalprice() {
		return ipchalprice;
	}
	public void setIpchalprice(int ipchalprice) {
		this.ipchalprice = ipchalprice;
	}
	public String getCancelSw() {
		return cancelSw;
	}
	public void setCancelSw(String cancelSw) {
		this.cancelSw = cancelSw;
	}
	public int getWriterInt() {
		return writerInt;
	}
	public void setWriterInt(int writerInt) {
		this.writerInt = writerInt;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public String getWriterGender() {
		return writerGender;
	}
	public void setWriterGender(String writerGender) {
		this.writerGender = writerGender;
	}
	public String getWriterBirthday() {
		return writerBirthday;
	}
	public void setWriterBirthday(String writerBirthday) {
		this.writerBirthday = writerBirthday;
	}
	public String getWriterHomeTown() {
		return writerHomeTown;
	}
	public void setWriterHomeTown(String writerHomeTown) {
		this.writerHomeTown = writerHomeTown;
	}
	public String getWriterInfor() {
		return writerInfor;
	}
	public void setWriterInfor(String writerInfor) {
		this.writerInfor = writerInfor;
	}
	public String getWriterFname() {
		return writerFname;
	}
	public void setWriterFname(String writerFname) {
		this.writerFname = writerFname;
	}
	public String getWriterFsName() {
		return writerFsName;
	}
	public void setWriterFsName(String writerFsName) {
		this.writerFsName = writerFsName;
	}
	public String getWriteropenSw() {
		return writeropenSw;
	}
	public void setWriteropenSw(String writeropenSw) {
		this.writeropenSw = writeropenSw;
	}
	@Override
	public String toString() {
		return "ArtAuctionVO [idx=" + idx + ", work=" + work + ", workFname=" + workFname + ", workFSname=" + workFSname
				+ ", workWriter=" + workWriter + ", writerBirthYear=" + writerBirthYear + ", workSize=" + workSize
				+ ", workComment=" + workComment + ", chuJungPrice=" + chuJungPrice + ", startPrice=" + startPrice
				+ ", currentPrice=" + currentPrice + ", ipchalCnt=" + ipchalCnt + ", workStartDate=" + workStartDate
				+ ", workLastDate=" + workLastDate + ", boomnackchalPrice=" + boomnackchalPrice + ", ipchalmember="
				+ ipchalmember + ", day_diff=" + day_diff + ", hour_diff=" + hour_diff + ", ipchalprice=" + ipchalprice
				+ ", cancelSw=" + cancelSw + ", writerInt=" + writerInt + ", writerName=" + writerName + ", writerGender="
				+ writerGender + ", writerBirthday=" + writerBirthday + ", writerHomeTown=" + writerHomeTown + ", writerInfor="
				+ writerInfor + ", writerFname=" + writerFname + ", writerFsName=" + writerFsName + ", writeropenSw="
				+ writeropenSw + "]";
	}
}
