package fofa.domain;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.stereotype.Component;

@XmlRootElement(name="follow")
@XmlAccessorType(XmlAccessType.FIELD)
@Component
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
