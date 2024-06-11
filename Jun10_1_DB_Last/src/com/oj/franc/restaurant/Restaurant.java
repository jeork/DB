package com.oj.franc.restaurant;

public class Restaurant {
	private int no;
	private String location;
	private String owner;
	private int seat;

	public Restaurant() {
		// TODO Auto-generated constructor stub
	}

	public Restaurant(int no, String location, String owner, int seat) {
		super();
		this.no = no;
		this.location = location;
		this.owner = owner;
		this.seat = seat;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public int getSeat() {
		return seat;
	}

	public void setSeat(int seat) {
		this.seat = seat;
	}

}
