package com.mains.bin;

public class DashCounter {
	private long totalProjects;
    private long closedProjects;
    private long runningProjects;
    private long cancelledProjects;
	public DashCounter() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DashCounter(long totalProjects, long closedProjects, long runningProjects, long cancelledProjects) {
		super();
		this.totalProjects = totalProjects;
		this.closedProjects = closedProjects;
		this.runningProjects = runningProjects;
		this.cancelledProjects = cancelledProjects;
	}
	public long getTotalProjects() {
		return totalProjects;
	}
	public void setTotalProjects(long totalProjects) {
		this.totalProjects = totalProjects;
	}
	public long getClosedProjects() {
		return closedProjects;
	}
	public void setClosedProjects(long closedProjects) {
		this.closedProjects = closedProjects;
	}
	public long getRunningProjects() {
		return runningProjects;
	}
	public void setRunningProjects(long runningProjects) {
		this.runningProjects = runningProjects;
	}
	public long getCancelledProjects() {
		return cancelledProjects;
	}
	public void setCancelledProjects(long cancelledProjects) {
		this.cancelledProjects = cancelledProjects;
	}
	@Override
	public String toString() {
		return "DashCounter [totalProjects=" + totalProjects + ", closedProjects=" + closedProjects
				+ ", runningProjects=" + runningProjects + ", cancelledProjects=" + cancelledProjects + "]";
	}
    
}
