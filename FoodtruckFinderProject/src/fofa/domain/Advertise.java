package fofa.domain;

public class Advertise {

	private String advId;
	private String sellerId;
	private String period;
	private Boolean approve;
	private String startdate;
	
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getAdvId() {
		return advId;
	}
	public void setAdvId(String advId) {
		this.advId = advId;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public Boolean getApprove() {
		return approve;
	}
	public void setApprove(Boolean approve) {
		this.approve = approve;
	}
	
}
