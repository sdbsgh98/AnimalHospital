package com.vet.main.commons;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Pager {
	
	// 시작 인덱스 번호 (limit)
	private Long startRow;
	// 가져올 갯수 (limit)
	private Long lastRow;

	// 검색할 컬럼
	private String kind;
	// 검색어
	private String search;
	//페이지 번호
	private Long page;
	//한 페이지당 보여줄 갯수
	private Long perPage;
	//총 페이지 갯수
	private Long totalPage;
	//해당 페이지의 첫번째 페이지번호
	private Long startNum;
	//해당 페이지의 마지막 페이지번호
	private Long lastNum;
	// 이전 btn [true=중간블럭 | false=첫블럭]
	private boolean pre;
	// 다음 btn [true=중간블럭 | false=마지막블럭]
	private boolean next;


	private String username;
	private Long customerNo;
	
    private String startDate;  // 시작일
    private String endDate;    // 종료일


	// 1. 보여질 data 갯수
	public void makeRowNum() {
		this.startRow = (this.getPage()-1)*this.getPerPage();		// *=10의자리 | +1=1의자리	

	}

	// 2. data 갯수에 따른 totalPage
	public void makePageNum(Long total) {
		// 2_1. 전체 페이지 수 
		this.totalPage = total/this.getPerPage();
		if(total%this.getPerPage() != 0) {
			this.totalPage++;
		}

		// 2_2. 전체 페이지 수로 block 나누기
		long perBlock = 5;

		long totalBlock = this.totalPage/perBlock;
		if(this.totalPage%perBlock != 0) {
			totalBlock++;
		}

		// 2_3. 현재 page 번호로 block 구하기
		long curBlock = this.getPage()/perBlock;

		if(this.getPage()%perBlock != 0) {
			curBlock++;
		}


		// 2_4. 현재 block의 시작+마지막 번호 구하기
		this.startNum = (curBlock-1)*perBlock+1;
		this.lastNum = curBlock*perBlock;

		// 2_5. 이전*다음 block 활성화
		if(curBlock>1) {
			this.pre=true;
		}

		if(curBlock<totalBlock) {
			this.next=true;
		}


		// 2_5_1. 마지막 block일 때
		if(!this.next) {
			this.lastNum=totalPage;
		}
	}

	public Long getStartRow() {
		if(this.startRow == null || this.startRow<0) {
			return 0L;
		}
		return this.startRow;
	}
	public Long getLastRow() {
		if(this.lastRow == null || this.lastRow<0) {
			return 10L;
		}
		return this.lastRow;
	}
	public String getSearch() {
		if(this.search == null) {
			return "";
		}
		return this.search;
	}
	public Long getPage() {
		if(this.page==null) {
			this.page=1L;
		}
		return page;
	}
	public Long getPerPage() {
		if(this.perPage==null) {
			this.perPage=10L;
		}
		return perPage;
	}
	
	/*
	 * private Long page; //page 번호를 담을 변수 private Long perPage; //한 페이지에 보여줄 글의 갯수
	 * private Long startRow; //시작 index 번호 //오라클과는 달리 LIMIT를 사용하기 때문에, lastRow가
	 * 필요없음.
	 * 
	 * private Long totalPage; //전체 페이지 갯수 private Long perBlock; //한 블럭당 출력할 페이지수
	 * private Long startNum; //한블럭 내 시작번호 private Long lastNum; //한블럭 내 끝번호 //시작과 끝
	 * 블럭에서 블럭 사용을 disabled 시키기 위한 스위치 //아무값도 안넣으면 primitive type boolean은 false가
	 * 초기값임. ref타입(Boolean)은 null private boolean pre; private boolean next;
	 * 
	 * //검색기능 private String kind; //검색할 컬럼명 private String search; //검색어
	 * 
	 * private String username; private Long customerNo;
	 * 
	 * //시작 index 번호를 계산하는 메서드 public void makeStartRow() { //page = 1, startRow = 0
	 * //page = 2, startRow = 10 //page = 3, startRow = 20 this.startRow =
	 * this.getPerPage()*(this.getPage()-1); }
	 * 
	 * //page를 계산하는 메서드 public void makeNum(Long totalCount) { //페이저 만드는 메서드 진행순서
	 * //1. 전체 글(row)의 갯수를 받아옴 //2. 전체 글의 갯수로 전체 페이지(page) 갯수 구하기 //3. 전체 페이지로 전체
	 * 블럭의 갯수 구하기 //4. page 번호로 현재 블럭 번호 구하기 //5. 현재 블럭 번호로 시작 번호, 끝 번호 구하기 //6. 이전
	 * 블럭과 다음 블럭의 유무 확인 //7. 현재 블럭이 마지막 블럭 번호와 같다면 페이저의 마지막 번호(lastNum)가 전체
	 * 페이지(totalPage)와 같게 설정
	 * 
	 * //시작 //1. 전체 글의 갯수를 받아옴 - 매개변수로 받아온다. DAO에서 전체 row를 구하는 메서드를 실행시켜줌. //2. 전체
	 * 글의 갯수(row)로 전체 페이지 갯수(page) 구하기 - 나머지가 0이 아니면 토탈페이지 +1 해주기 this.totalPage =
	 * totalCount/this.getPerPage(); if(totalCount%this.getPerPage()!=0) {
	 * totalPage++; } //현재 page가 totalPage를 넘지 않게 설정 if(this.getPage()>totalPage) {
	 * this.setPage(totalPage); }
	 * 
	 * //3. 전체 페이지로 전체 블럭의 갯수 구하기(총 40페이지를 블럭당 5페이지씩 보여줄거면 총 블럭은 8개가 있어야함) Long
	 * totalBlock = totalPage/getPerBlock(); //3-1. 총 43페이지를 블럭당 5페이지씩 보여줄거면 총 블럭은
	 * 9개가 있어야함 if(totalPage%this.getPerBlock()!=0) { totalBlock++; }
	 * 
	 * //4. page 번호로 현재 블럭 번호 구하기(현재 페이지가 35번째 페이지면, 현재 블럭은 7번째 블럭이다) //page:1-5 ->
	 * curBlock=1 / page:6-10 -> curBlock=2 / page:11-15 -> curBlock=3 ... Long
	 * currentBlock = this.getPage()/getPerBlock(); //4-1. 나머지가 0이 아닌 경우, 현재 블럭의 값을
	 * 1 더해줌.(현재 페이지가 38번째 페이지면, 현재 블럭은 8번째 블럭이다. 7+1)
	 * if(this.getPage()%getPerBlock()!=0) { currentBlock++; }
	 * 
	 * //5. 현재 블럭 번호로 시작 번호, 끝 번호 구하기 //curB -> startNum ~ lastNum //curB=1 -> 1 ~ 5
	 * / curB=2 -> 6 ~ 10 / curB=3 -> 11 ~ 15 ... this.startNum =
	 * (currentBlock-1)*getPerBlock() +1; this.lastNum = currentBlock*getPerBlock();
	 * 
	 * //6. 현재 블럭이 마지막 블럭 번호와 같다면 페이저의 마지막 번호(lastNum)가 전체 페이지(totalPage)와 같게 설정
	 * if(currentBlock==totalBlock) { this.lastNum = totalPage; }
	 * 
	 * //7. 이전 블럭과 다음 블럭의 유무 확인 if(currentBlock!=1) { this.pre=true; }
	 * 
	 * if(currentBlock!=totalBlock) { this.next=true; }else
	 * if(currentBlock==totalBlock) { this.next=false; }
	 * 
	 * }
	 * 
	 * //getter를 이용한 초기값 세팅 - 명시를 하면 lombok이 만든 getter/setter 대신 이걸로 사용
	 * //getter/setter 메서드 명은 우측의 Outline 참고하면 됨 - 안보이는경우 window - show view public
	 * Long getPage() { //기본값 설정 if(this.page == null || this.page < 1) { this.page
	 * = 1L; } return this.page; }
	 * 
	 * public Long getPerPage() { if(this.perPage == null || this.perPage == 0) {
	 * this.perPage = 10L; } return this.perPage; }
	 * 
	 * public Long getPerBlock() { if(this.perBlock == null || this.perBlock == 0) {
	 * this.perBlock = 5L; } return this.perBlock; }
	 * 
	 * public String getSearch() { if(this.search == null) { search = ""; } return
	 * search; }
	 */
	

}
