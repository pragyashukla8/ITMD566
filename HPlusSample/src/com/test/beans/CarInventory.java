package com.test.beans;

public class CarInventory {
	
	// fields from CarInventory tables
		private int carid;
		private int providerid;
		private int serviceid;
		private String carmodel;
		private String carmake;
		private String mileage;
		private String yearmake;
		private String status;
		private float kmrun;
		private float cost;
		
		// constructor
		public CarInventory(int providerid, int serviceid, String carmodel, String carmake, String mileage, String yearmake, String status, float kmrun, float cost) {
			this.providerid=providerid;
			this.serviceid=serviceid;
			this.carmodel=carmodel;
			this.carmake=carmake;
			this.mileage=mileage;
			this.yearmake=yearmake;
			this.status=status;
			this.kmrun=kmrun;
			this.cost=cost;
		}
		public CarInventory() {
			// TODO Auto-generated constructor stub
		}

		// Getters and Setters for all fields
		public int getCarid() {
			return carid;
		}
		public void setCarid(int carid) {
			this.carid = carid;
		}
		public int getProviderid() {
			return providerid;
		}
		public void setProviderid(int providerid) {
			this.providerid = providerid;
		}
		public int getServiceid() {
			return serviceid;
		}
		public void setServiceid(int serviceid) {
			this.serviceid = serviceid;
		}
		public String getCarmodel() {
			return carmodel;
		}
		public void setCarmodel(String carmodel) {
			this.carmodel = carmodel;
		}
		public String getCarmake() {
			return carmake;
		}
		public void setCarmake(String carmake) {
			this.carmake = carmake;
		}
		public String getMileage() {
			return mileage;
		}
		public void setMileage(String mileage) {
			this.mileage = mileage;
		}
		public String getYearmake() {
			return yearmake;
		}
		public void setYearmake(String yearmake) {
			this.yearmake = yearmake;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public float getKmrun() {
			return kmrun;
		}
		public void setKmrun(float kmrun) {
			this.kmrun = kmrun;
		}
		public float getCost() {
			return cost;
		}
		public void setCost(float cost) {
			this.cost = cost;
		}

}
