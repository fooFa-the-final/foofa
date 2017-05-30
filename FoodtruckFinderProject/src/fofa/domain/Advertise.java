package fofa.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Advertise {

	private String advId;
	private String sellerId;
	private int period;
	private int approve;
	private Date startdate;
	private String enddate;
	
	
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String edndate) {
		this.enddate = edndate;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
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
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public int getApprove() {
		return approve;
	}
	public void setApprove(int approve) {
		this.approve = approve;
	}
	
}
