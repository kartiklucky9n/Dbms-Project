package springmvc.model;

public class Region {
	private int pincode;
	private String district;
	private String state;
	public int getPincode() {
		return pincode;
	}
	public void setPincode(int pincode) {
		this.pincode = pincode;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Region(int pincode, String district, String state) {
		super();
		this.pincode = pincode;
		this.district = district;
		this.state = state;
	}
	public Region() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Region [pincode=" + pincode + ", district=" + district + ", state=" + state + "]";
	}
}
