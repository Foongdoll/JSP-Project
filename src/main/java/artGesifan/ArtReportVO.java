package artGesifan;

public class ArtReportVO {
	private int idx;
	private int gesifanidx;
	private String reporter;
	private String content;
	private String rDate;
	private String currentSw;
	
	private int reportCnt;
	private String writer;
	private String title;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getGesifanidx() {
		return gesifanidx;
	}
	public void setGesifanidx(int gesifanidx) {
		this.gesifanidx = gesifanidx;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public String getCurrentSw() {
		return currentSw;
	}
	public void setCurrentSw(String currentSw) {
		this.currentSw = currentSw;
	}
	public int getReportCnt() {
		return reportCnt;
	}
	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "ArtReportVO [idx=" + idx + ", gesifanidx=" + gesifanidx + ", reporter=" + reporter + ", content=" + content
				+ ", rDate=" + rDate + ", currentSw=" + currentSw + ", reportCnt=" + reportCnt + ", writer=" + writer
				+ ", title=" + title + "]";
	}
}
