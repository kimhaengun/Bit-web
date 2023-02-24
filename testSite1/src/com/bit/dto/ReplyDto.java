package com.bit.dto;

public class ReplyDto {
	private int replyNo; //댓글No
	private int communityNo; //게시글No
	private String id; // 작성 Id
	private String content; //댓글 내용
	private int posistions; //모 깊이
	private int depth; // 자식 깊이
	private String hiredate; // 생성 날짜
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPosistions() {
		return posistions;
	}
	public void setPosistions(int posistions) {
		this.posistions = posistions;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getHiredate() {
		return hiredate;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	@Override
	public String toString() {
		return "ReplyDto [replyNo=" + replyNo + ", communityNo=" + communityNo + ", id=" + id + ", content=" + content
				+ ", posistions=" + posistions + ", depth=" + depth + ", hiredate=" + hiredate + "]";
	}
	
	
}
