package artMyPage;

public class ArtNackChalVO {
	private int idx;
	private String work;
	private String workWriter;
	private String workSize;
	private int ipchalPrice;
	private String nickName;
	private String name;
	private String cancelSw;
	
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public String getWorkWriter() {
		return workWriter;
	}
	public void setWorkWriter(String workWriter) {
		this.workWriter = workWriter;
	}
	public String getWorkSize() {
		return workSize;
	}
	public void setWorkSize(String workSize) {
		this.workSize = workSize;
	}
	public int getIpchalPrice() {
		return ipchalPrice;
	}
	public void setIpchalPrice(int ipchalPrice) {
		this.ipchalPrice = ipchalPrice;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "ArtNackChalVO [work=" + work + ", workWriter=" + workWriter + ", workSize=" + workSize + ", ipchalPrice="
				+ ipchalPrice + ", nickName=" + nickName + ", name=" + name + "]";
	}
	public String getCancelSw() {
		return cancelSw;
	}
	public void setCancelSw(String cancelSw) {
		this.cancelSw = cancelSw;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
}
