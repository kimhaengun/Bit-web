package com.bit.dto;

import java.util.Date;

public class CommunityDto {
	private int communityNo; //커뮤니티No
	private String id; // userId
	private String title; //제목
	private String content; //내용
	private Date hiredate; //생성 날짜
	private int counts; //조회수
	private int pageCount; //총 페이징 수
	
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getCommunityNo() {
		return communityNo;
	}
	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}
	@Override
	public String toString() {
		return "CommunityDto [communityNo=" + communityNo + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", hiredate=" + hiredate + ", counts=" + counts + ", pageCount=" + pageCount + "]";
	}
	
}
