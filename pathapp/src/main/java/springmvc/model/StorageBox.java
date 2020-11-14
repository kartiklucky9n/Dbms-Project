package springmvc.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class StorageBox {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int boxId;
	private int boxCapacity;
	private String containerType;
	private int noOfSample;
	public int getBoxId() {
		return boxId;
	}
	public void setBoxId(int boxId) {
		this.boxId = boxId;
	}
	public int getBoxCapacity() {
		return boxCapacity;
	}
	public void setBoxCapacity(int boxCapacity) {
		this.boxCapacity = boxCapacity;
	}
	public String getContainerType() {
		return containerType;
	}
	public void setContainerType(String containerType) {
		this.containerType = containerType;
	}
	public int getNoOfSample() {
		return noOfSample;
	}
	public void setNoOfSample(int noOfSample) {
		this.noOfSample = noOfSample;
	}
	@Override
	public String toString() {
		return "StorageBox [boxId=" + boxId + ", boxCapacity=" + boxCapacity + ", containerType=" + containerType
				+ ", noOfSample=" + noOfSample + "]";
	}
	public StorageBox(int boxId, int boxCapacity, String containerType, int noOfSample) {
		super();
		this.boxId = boxId;
		this.boxCapacity = boxCapacity;
		this.containerType = containerType;
		this.noOfSample = noOfSample;
	}
	public StorageBox() {
		super();
		// TODO Auto-generated constructor stub
	}
}
