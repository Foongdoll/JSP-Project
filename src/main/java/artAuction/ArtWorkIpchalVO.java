package artAuction;

public class ArtWorkIpchalVO {
	private int idx;
	private int workIdx;
	private int memIdx;
	private int ipchalprice;
	private String cancelSw;
	private String ipchalName;
	private String workName;
	
	private String wDate;
	private String workLastDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getWorkIdx() {
		return workIdx;
	}
	public void setWorkIdx(int workIdx) {
		this.workIdx = workIdx;
	}
	public int getMemIdx() {
		return memIdx;
	}
	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
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
	public String getIpchalName() {
		return ipchalName;
	}
	public void setIpchalName(String ipchalName) {
		this.ipchalName = ipchalName;
	}
	public String getWorkName() {
		return workName;
	}
	public void setWorkName(String workName) {
		this.workName = workName;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	@Override
	public String toString() {
		return "ArtWorkIpchalVO [idx=" + idx + ", workIdx=" + workIdx + ", memIdx=" + memIdx + ", ipchalprice="
				+ ipchalprice + ", cancelSw=" + cancelSw + ", ipchalName=" + ipchalName + ", workName=" + workName + ", wDate="
				+ wDate + "]";
	}
	public String getWorkLastDate() {
		return workLastDate;
	}
	public void setWorkLastDate(String workLastDate) {
		this.workLastDate = workLastDate;
	}
}
