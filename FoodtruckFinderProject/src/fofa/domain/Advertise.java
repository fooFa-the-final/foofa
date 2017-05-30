package fofa.domain;

import java.sql.Date;
import java.util.Calendar;

import org.springframework.stereotype.Component;

@Component
public class Advertise {

	private String advId;
	private String sellerId;
	private int period;
	private int approve;
	private Date startdate;

	
	//sql date를 기반으로 util date로 변환
	public Date getEndofdate() {
		java.util.Date date = null;
		Calendar cal = Calendar.getInstance();
		cal.setTime(startdate);
		cal.add(Calendar.DATE, period);
		date = cal.getTime();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		return sqlDate;
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
