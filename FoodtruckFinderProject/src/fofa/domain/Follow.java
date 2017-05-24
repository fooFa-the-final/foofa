package fofa.domain;

public class Follow {

	private String toId;
	private String fromId;
	public String getToId() {
		return toId;
	}
	public void setToId(String toId) {
		this.toId = toId;
	}
	public String getFromId() {
		return fromId;
	}
	public void setFromId(String fromId) {
		this.fromId = fromId;
	}
	@Override
	public String toString() {
		return "Follow [toId=" + toId + ", fromId=" + fromId + "]";
	}
	
}
