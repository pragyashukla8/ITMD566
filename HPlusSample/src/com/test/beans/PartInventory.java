package com.test.beans;

public class PartInventory {

	// fields from PartInventory tables
			private int partid;
			private int providerid;
			private int serviceid;
			private String name;
			private String make;
			private String description;
			private String status;
			private float cost;
			
			// constructor
			public PartInventory(int providerid, int serviceid, String name, String make, String description, String status, float cost) {
				this.providerid=providerid;
				this.serviceid=serviceid;
				this.name=name;
				this.make=make;
				this.description=description;
				this.status=status;
				this.cost=cost;
			}
			public PartInventory() {
				// TODO Auto-generated constructor stub
			}

			// getters and Setters for all the fileds
			public int getPartid() {
				return partid;
			}
			public void setPartid(int partid) {
				this.partid = partid;
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
			public String getName() {
				return name;
			}
			public void setName(String name) {
				this.name = name;
			}
			public String getMake() {
				return make;
			}
			public void setMake(String make) {
				this.make = make;
			}
			public String getDescription() {
				return description;
			}
			public void setDescription(String description) {
				this.description = description;
			}
			public String getStatus() {
				return status;
			}
			public void setStatus(String status) {
				this.status = status;
			}
			public float getCost() {
				return cost;
			}
			public void setCost(float cost) {
				this.cost = cost;
			}
}
