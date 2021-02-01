package com.gr.cg.command;

import java.util.List;

public class ResourcesCommand {
	
	int cpu;
	String total;
	String free;
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getFree() {
		return free;
	}
	public void setFree(String free) {
		this.free = free;
	}
	long HddTotalSize;
	List<CompanyResources> comList; 
	
	public List<CompanyResources> getComList() {
		return comList;
	}
	public void setComList(List<CompanyResources> comList) {
		this.comList = comList;
	}
	public int getCpu() {
		return cpu;
	}
	public void setCpu(int cpu) {
		this.cpu = cpu;
	}

	public long getHddTotalSize() {
		return HddTotalSize;
	}
	public void setHddTotalSize(long hddTotalSize) {
		HddTotalSize = hddTotalSize;
	}

}
